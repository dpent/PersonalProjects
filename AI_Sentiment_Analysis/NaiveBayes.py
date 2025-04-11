import os
import pathlib
from sklearn.feature_extraction.text import CountVectorizer
import numpy as np
import matplotlib.pyplot as plt
import copy
import time

from scipy.sparse import csr_array




max_number_of_reviews = 1000000


class NaiveBayes:
    filesRead=[]
    recall=[]
    precision=[]
    nMostCommonWords=0
    kleastCommonWords=0
    selectedVocabulary=0
    totalPositiveReviews=0
    totalNegativeReviews=0
    totalReviews=0
    totalPos=0 #posa test vgikan thetika
    totalRealPos=0 #posa itan ontos thetika
    totalNeg=0 #posa test vgikan arnitika
    totalRealNeg=0 #posa itan ontos anitika
    vocabularyUsed={
    }
    probabilityDict={
    }
    posDict={
    }
    negDict={
    }
    wordList=[] #voithiki lista
    posList=[] #voithitiki lista
    negList=[] #voithitiki lista
    removeList=[] #lista apo lekseis pou tha agnoei o vectoriser tin deuteri fora po diavazei arxeia

    vectorizer=CountVectorizer()

    def readPositiveReviews(self,path,count):
        i=0
        j=0
        self.totalPositiveReviews=0
        for name in os.listdir(path):
            if j<count:
                self.totalPositiveReviews+=1
                review=open(os.path.join(path,name),mode="r",encoding="utf8",errors="replace")
                self.wordList.append(review.read())
                i=i+1
                j+=1
                if i> max_number_of_reviews:
                    break
            else:
                break
    def readNegativeReviews(self,path,count):
        i=0
        j=0
        self.totalNegativeReviews=0
        for name in os.listdir(path):
            if j<count:
                self.totalNegativeReviews+=1
                review=open(os.path.join(path,name),mode="r",encoding="utf8",errors="replace")
                self.wordList.append(review.read())
                i=i+1
                j+=1
                if i> max_number_of_reviews:
                    break
            else:
                break
    def turnTo1or0(self,reviews):
        indices = reviews.nonzero()
        for position in zip(indices[0],indices[1]):
            review_number = position[0] # a number between 0 and 25000
            feature_pos = position[1] # a number between 0 and 74000
            reviews[review_number,feature_pos]=1
        return reviews
            
    def sortWordsByCount(self,dictionary):
        self.totalReviews=self.totalNegativeReviews+self.totalPositiveReviews
        v=list(dictionary.values())
        k=list(dictionary.keys())
        sortedCount=np.argsort(v)
        newdict={}
        for i in range(self.kleastCommonWords,len(dictionary)-self.nMostCommonWords):
            key=k[sortedCount[i]]
            value=v[sortedCount[i]]
            newdict[key]=value
        for i in range(0,self.kleastCommonWords):
            self.removeList.append(k[sortedCount[i]])
        for i in range(len(dictionary)-self.nMostCommonWords,len(dictionary)):
            self.removeList.append(k[sortedCount[i]])
        self.vectorizer=CountVectorizer(stop_words=self.removeList,analyzer='word')
        return newdict

    def readPosForSum(self,path,count):
        i=0
        j=0
        for name in os.listdir(path):
            if j<count:
                i=i+1
                review=open(os.path.join(path,name),mode="r",encoding="utf8",errors="replace")
                self.posList.append(review.read())
                j+=1
                if i > max_number_of_reviews:
                    break
            else:
                break
        vocab=self.vectorizer.fit_transform(self.posList)
        vocab=self.turnTo1or0(vocab)
        count=np.sum(vocab.toarray(),axis=0)
        zdict = zip(b1.vectorizer.get_feature_names_out(), count)
        self.posDict=dict(zdict)
    def readNegForSun(self,path,count):
        i=0
        j=0
        for name in os.listdir(path):
            if j<count:
                i=i+1
                review=open(os.path.join(path,name),mode="r",encoding="utf8",errors="replace")
                self.negList.append(review.read())
                j+=1
                if i > max_number_of_reviews:
                    break
            else:
                break
        vocab=self.vectorizer.fit_transform(self.negList)
        vocab=self.turnTo1or0(vocab)
        count=np.sum(vocab.toarray(),axis=0)
        self.negDict=dict(zip(b1.vectorizer.get_feature_names_out(),count))

    def equalizeDictionaries(self,dictPos,dictNeg):
        for i in (list(dictPos.keys())):
            if i not in list(dictNeg.keys()):
                dictNeg[i]=0
        for i in (list(dictNeg.keys())):
            if i not in list(dictPos.keys()):
                dictPos[i]=0

    def entropyOf(self):
        pp = (self.totalPositiveReviews+1)/(self.totalReviews+2)
        pn = (self.totalNegativeReviews+1)/(self.totalReviews+2)
        return -pp*np.log2(pp) - pn*np.log2(pn)


    def entropyOfGivenThat(self,var,value):
        if value==1:
            count=self.posDict[var]+self.negDict[var]
            pn = (self.negDict[var]+1)/(count+2)
            pp = (self.posDict[var]+1)/(count+2)
            H=-pn*np.log2(pn)-pp*np.log2(pp)
        else:
            count=self.totalReviews-self.posDict[var]-self.negDict[var]
            pn = ((self.totalNegativeReviews-self.negDict[var])+1)/(count+2)
            pp = (self.totalPositiveReviews-self.posDict[var]+1)/(count+2)
            H=-pn*np.log2(pn)-pp*np.log2(pp)
        return H

    def probabilityOf(self,var,value):
        if value==1:
            P=((self.posDict[var]+self.negDict[var])+1)/(self.totalReviews+2)
        else:
            P=1-((self.posDict[var]+self.negDict[var])+1)/(self.totalReviews+2)
        return P

    def probabilityOfGivenThat(self,var,value,value2):
        if value2==1:
            posCount = self.posDict[var]
            if value==1:
                P=(posCount+1)/(self.totalPositiveReviews+2)
            else:
                P=1-((posCount+1)/(self.totalPositiveReviews+2))
        else:
            negCount = self.negDict[var]
            if value==1:
                P=(negCount+1)/(self.totalNegativeReviews+2)
            else:
                P=1-((negCount+1)/(self.totalNegativeReviews+2))
        return P

    def getInformationGain(self,var):
        IG=self.entropyOf()
        sum=(self.probabilityOf(var,1)*self.entropyOfGivenThat(var,1))+(self.probabilityOf(var,0)*self.entropyOfGivenThat(var,0))
        IG-=sum
        return IG
    
    def getMBestWords(self,m,dictionary):
        for word in dictionary:
            infoG=self.getInformationGain(word)
            dictionary[word]=infoG
        newDict={}
        k=list(dictionary.keys())
        v=list(dictionary.values())
        infoSorted=np.argsort(v)

        for i in range(len(dictionary)-m,len(dictionary)):
            newDict[k[infoSorted[i]]]=v[infoSorted[i]]
        
        for i in range(0,len(dictionary)-m):
            self.removeList.append(k[infoSorted[i]])
        
        self.vectorizer=CountVectorizer(stop_words=self.removeList,analyzer='word')
        return newDict

    def testBayes(self):
        
        #directoryTestPos=input("Doste to path tou fakelou me ta thetika review gia testarisma: ")
        #tempDirPosTest=pathlib.Path(directoryTestPos)
        tempDirPosTest="C:\\Users\\dimpe\\Desktop\\pliroforiki\\Python\\aclImdb\\test\\pos" 
        self.readTestReviews(tempDirPosTest,1)
        #directoryTestNeg=input("Doste to path tou fakelou me ta arnitika review gia testarisma: ")
        #tempDirNegTest=pathlib.Path(directoryTestNeg)
        tempDirNegTest="C:\\Users\\dimpe\\Desktop\\pliroforiki\\Python\\aclImdb\\test\\neg"
        self.readTestReviews(tempDirNegTest,0) 

    def readTestReviews(self,path,C):
        numberOfReview=0
        numberOfSkippedReviews=0
        for name in os.listdir(path):
            numberOfReview += 1
            if numberOfReview % 100  ==0:
                print("Number of reviews: " + str(numberOfReview) + " Skipped :" + str(numberOfSkippedReviews))
                print("Positive reviews are " + str(b1.totalPos)+" out of "+str(b1.totalRealPos))
                print("Negative reviews are " +str(b1.totalNeg)+" out of "+str(b1.totalRealNeg))
            review=open(os.path.join(path,name),mode="r",encoding="utf8",errors="replace")
            words=[review.read()]
            try:
                words=self.vectorizer.fit_transform(words)
            except:
               numberOfSkippedReviews+=1
               continue 
            ginomenoPos=(self.totalPositiveReviews+1)/(self.totalReviews+2)
            ginomenoNeg=(self.totalNegativeReviews+1)/(self.totalReviews+2)
            for word in list(self.vocabularyUsed.keys()):
                if word in self.vectorizer.get_feature_names_out():
                    ginomenoPos=ginomenoPos*self.probabilityOfGivenThat(word,1,1)
                    ginomenoNeg=ginomenoNeg*self.probabilityOfGivenThat(word,1,0)
                else:
                    ginomenoPos=ginomenoPos*self.probabilityOfGivenThat(word,0,1)
                    ginomenoNeg=ginomenoNeg*self.probabilityOfGivenThat(word,0,0)
            #for word in list(self.vectorizer.get_feature_names_out()):
            #    ginomenoPos=ginomenoPos*self.probabilityOfGivenThat(word,1,1)
            #    ginomenoNeg=ginomenoNeg*self.probabilityOfGivenThat(word,1,0)

            if C==1:
                self.totalRealPos+=1
                if ginomenoPos>=ginomenoNeg:
                    self.totalPos+=1
            else:
                self.totalRealNeg+=1
                if ginomenoNeg>ginomenoPos:
                    self.totalNeg+=1

            


    def count1sPerWord(self,reviews):
        result={}
        features=list(self.vectorizer.get_feature_names_out())

        for feature in features:
            result[feature] =0

        indices = reviews.nonzero()
        for position in zip(indices[0],indices[1]):
            #review_number = position[0] # a number between 0 and 25000
            feature_pos = position[1] # a number between 0 and 74000
            word=features[feature_pos]
            result[word] += 1
              


        
        return result
    
    def testText(self,path,name,C):
        review=open(os.path.join(path,name),mode="r",encoding="utf8",errors="replace")
        words=[review.read()]
        try:
            words=self.vectorizer.fit_transform(words)
        except:
            return
    
        ginomenoPos=(self.totalPositiveReviews+1)/(self.totalReviews+2)
        ginomenoNeg=(self.totalNegativeReviews+1)/(self.totalReviews+2)
        for word in list(self.vocabularyUsed.keys()):
            if word in self.vectorizer.get_feature_names_out():
                ginomenoPos=ginomenoPos*self.probabilityOfGivenThat(word,1,1)
                ginomenoNeg=ginomenoNeg*self.probabilityOfGivenThat(word,1,0)
            else:
                ginomenoPos=ginomenoPos*self.probabilityOfGivenThat(word,0,1)
                ginomenoNeg=ginomenoNeg*self.probabilityOfGivenThat(word,0,0)

        if C==1:
            self.totalRealPos+=1
            if ginomenoPos>=ginomenoNeg:
                self.totalPos+=1
        else:
            self.totalRealNeg+=1
            if ginomenoNeg>ginomenoPos:
                self.totalNeg+=1

    def useDevelopmentData(self,pathPos,pathNeg):
        count=1
        for name in os.listdir(pathPos):
            if count<12000:
                count+=1
                continue
            else:
                self.testText(pathPos,name,1)
        count=1
        for name in os.listdir(pathNeg):
            if count<12000:
                count+=1
                continue
            else:
                self.testText(pathNeg,name,0)

    def getPrecision(self,precision,index):
        return precision[index]
    
    def getRecall(self,recall,index):
        return recall[index]

        
    def getF1(self,precision,recall):
        F1=2*((precision*recall)/(precision+recall))
        return F1
        

                
        


####----ARXI PROGRAMMATOS----####
b1=NaiveBayes()
#directory=input("Doste to path tou fakelou me ta thetika review gia ekpaideusi: ")
#tempDirPos=pathlib.Path(directory)
tempDirPos="C:\\Users\\dimpe\\Desktop\\pliroforiki\\Python\\aclImdb\\train\\pos"

#directory=input("Doste to path tou fakelou me ta arnitika review gia ekpaideusi: ")
#tempDirNeg=pathlib.Path(directory)
tempDirNeg="C:\\Users\\dimpe\\Desktop\\pliroforiki\\Python\\aclImdb\\train\\neg"

length=0

correctPercentage=0
filesToRead=1000
filesToReadList=[1000]
m=500
while True:
    b1.removeList.clear()
    b1.vectorizer=CountVectorizer()
    b1.wordList.clear()
    b1.vocabularyUsed.clear()
    b1.probabilityDict.clear()
    b1.posDict.clear()
    b1.posList.clear()
    b1.negDict.clear()
    b1.negList.clear()
    b1.totalNeg=0
    b1.totalPos=0
    b1.totalRealNeg=0
    b1.totalRealPos=0

    b1.readPositiveReviews(tempDirPos,filesToRead)
    b1.readNegativeReviews(tempDirNeg,filesToRead)
    print(len(b1.wordList))

    Words=b1.vectorizer.fit_transform(b1.wordList)
    length=len(list(b1.vectorizer.get_feature_names_out()))
    print(length)
    wordFreq=b1.count1sPerWord(Words)
    print("Done summing")
    b1.vocabularyUsed=copy.deepcopy(wordFreq)

    b1.nMostCommonWords=int(length*0.1)

    b1.kleastCommonWords=int(length*0.5)

    

    dictu=b1.sortWordsByCount(wordFreq)
    b1.vocabularyUsed=copy.deepcopy(dictu)
    b1.readPosForSum(tempDirPos,filesToRead)
    b1.readNegForSun(tempDirNeg,filesToRead)
    b1.equalizeDictionaries(b1.posDict,b1.negDict)
    

    b1.vocabularyUsed=copy.deepcopy(b1.getMBestWords(m,b1.vocabularyUsed))

    b1.useDevelopmentData(tempDirPos,tempDirNeg)


    print(str(b1.totalPos)+" "+str(b1.totalRealPos))
    print(str(b1.totalNeg)+" "+str(b1.totalRealNeg))
    b1.filesRead.append(filesToRead)
    b1.precision.append((b1.totalPos)/(b1.totalPos+(b1.totalRealNeg-b1.totalNeg)))
    b1.recall.append((b1.totalPos)/(b1.totalPos+(b1.totalRealPos-b1.totalPos)))
    temp=(b1.totalPos+b1.totalNeg)/(b1.totalRealPos+b1.totalRealNeg)
    if temp<correctPercentage:
        break
    else:
        if filesToRead!=12000:
            filesToRead+=1000
            filesToReadList.append(filesToRead)
            m+=250
        else:
            break


def devDataNumber():
    return [1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000]

f1List=[]
for i in range(len(b1.filesRead)):
    f1List.append(b1.getF1(b1.precision[i],b1.recall[i]))

plt.figure(figsize=(20,10))

plt.subplot(2,2,1)
plt.plot(b1.filesRead,b1.precision,'r--')
plt.ylabel('Precision')
plt.xlabel('Training Files')

plt.subplot(2,2,2)
plt.plot(b1.filesRead,b1.recall,'b--')
plt.ylabel('Recall')
plt.xlabel('Training Files')

plt.subplot(2,2,3)
plt.plot(b1.filesRead,f1List,'g--')
plt.ylabel('F1')
plt.xlabel('Training Files')

plt.subplot(2,2,4)
plt.plot(b1.filesRead,devDataNumber(),'m--')
plt.ylabel('Development Files')
plt.xlabel('Training Files')

plt.show()

print("Βρέθηκε βέλτιστη προσέγγιση")
print(str(correctPercentage)+"% σωστά αποτελέσματα")

print("Αρχίζουμε να τεστάρουμε...")
b1.testBayes()
print("Τέλος τεστ")

precisionP=(b1.totalPos)/(b1.totalPos+(b1.totalRealNeg-b1.totalNeg))
print("Συνολικό Precision στα θετικά: "+str(precisionP))
recallP=(b1.totalPos)/(b1.totalPos+(b1.totalRealPos-b1.totalPos))
print("Συνολικό recall στα θετικά: "+str(recallP))
precisionN=(b1.totalNeg)/(b1.totalNeg+(b1.totalRealPos-b1.totalPos))
print("Συνολικό Precision στα αρνητικά: "+str(precisionN))
recallN=(b1.totalNeg)/(b1.totalNeg+(b1.totalRealNeg-b1.totalNeg))
print("Συνολικό recall στα αρνητικά: "+str(recallN))

f1P=2*((precisionP*recallP)/(precisionP+recallP))
print("Συνολικό f1 για θετικά: "+str(f1P))
f1N=2*((precisionN*recallN)/(precisionN+recallN))
print("Συνολικό f1 για αρνητικά: "+str(f1N))

macroPrec=(precisionP+precisionN)/2
print("Macro-Precision: "+str(macroPrec))
macroRec=(recallP+recallN)/2
print("Macro-Recall: "+str(macroRec))
microPrec=(b1.totalPos+b1.totalNeg)/((b1.totalPos+(b1.totalRealNeg-b1.totalNeg))+(b1.totalNeg+(b1.totalRealPos-b1.totalPos)))
print("Micro-Precision: "+str(microPrec))
microRec=(b1.totalPos+b1.totalNeg)/((b1.totalPos+(b1.totalRealPos-b1.totalPos))+(b1.totalNeg+(b1.totalRealNeg-b1.totalNeg)))
print("Micro-Recall: "+str(microRec))
    