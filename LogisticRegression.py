import os
import pathlib
from sklearn.feature_extraction.text import CountVectorizer
import numpy as np
import matplotlib.pyplot as plt
import copy
import time
import random


from scipy.sparse import csr_array



max_number_of_reviews = 1000000

class LogisticRegression:
    filesRead=[]
    recall=[]
    precision=[]
    w=[] #vari tou algorithmou
    h=1 #learning rate tou algoritmou
    lamda=1 #parametros tis kanonikopoiisis
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
    wordList=[] #voithiki lista
    posList=[] #voithitiki lista
    negList=[] #voithitiki lista
    removeList=[] #lista apo lekseis pou tha agnoei o vectoriser tin deuteri fora po diavazei arxeia
    vocabularyUsed={
    }
    probabilityDict={
    }
    posDict={
    }
    negDict={
    }
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
        zdict = zip(l1.vectorizer.get_feature_names_out(), count)
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
        self.negDict=dict(zip(l1.vectorizer.get_feature_names_out(),count))


    def readForTraining(self,pathPos,pathNeg,count):
        j=0
        for name in os.listdir(pathPos):
            if j<count:
                review=open(os.path.join(pathPos,name),mode="r",encoding="utf8",errors="replace")
                wordList=[review.read()]
                try:
                    vocab=self.vectorizer.fit_transform(wordList)
                except:
                    continue
                vocab=self.makeTextInCorrectForm()
                self.trainRegression(vocab,1)
                j+=1
            else:
                break
        j=0
        for name in os.listdir(pathNeg):
            if j<count:
                review=open(os.path.join(pathNeg,name),mode="r",encoding="utf8",errors="replace")
                wordList=[review.read()]
                try:
                    vocab=self.vectorizer.fit_transform(wordList)
                except:
                    continue
                vocab=self.makeTextInCorrectForm()
                self.trainRegression(vocab,0)
                j+=1
            else:
                break

    def makeTextInCorrectForm(self):
        k=list(self.vocabularyUsed.keys())
        vector=[0]*len(k)
        for i in range(len(k)):
            if k[i] in self.vectorizer.get_feature_names_out():
                vector[i]=1
        return vector

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

    def probabilityOfPos(self,vectoredText):
        return 1/(1+np.exp(-self.productOfVectors(vectoredText)))


    def pithanofaneia(self,vectoredText,Y): #Y=1 an prokeitai gia thetiko review kai Y=0 an oxi
        return self.probabilityOfGivenThat(vectoredText,Y)
    
    def logPithanofaneia(self,vectoredText,Y):
        l=0
        if Y==1:
            l=np.log2(self.probabilityOfPos(vectoredText))
        else:
            l=1-(np.log2(self.probabilityOfPos(vectoredText)))
        return l
    
    def regularise(self,vectoredText,Y):
        weights=0
        for i in range(len(self.w)):
            weights+=self.w[i]*self.w[i]
        regularised=self.logPithanofaneia(vectoredText,Y)-self.lamda*weights
        return regularised
    
    def stochasticGradientAscent(self,vectoredText,Y):
        for i in range(len(self.w)):
            self.w[i]=self.w[i]+self.h*((Y-self.probabilityOfPos(vectoredText))*vectoredText[i])
        return None
    
    def productOfVectors(self,vectoredText):
        product=0
        for i in range(len(self.w)-1):
            temp=self.w[i]*vectoredText[i]
            product+=temp
        return product
    
    def testText(self,path,name,C):
        review=open(os.path.join(path,name),mode="r",encoding="utf8",errors="replace")
        words=[review.read()]
        try:
            words=self.vectorizer.fit_transform(words)
        except:
            return
        i=0
        vectoredText=[0]*len(list(self.vocabularyUsed.keys()))
        for word in list(self.vocabularyUsed.keys()):
            if word in self.vectorizer.get_feature_names_out():
                vectoredText[i]=1
            i+=1

        P=self.probabilityOfPos(vectoredText)

        if C==1:
            self.totalRealPos+=1
            if P>0.5:
                self.totalPos+=1
        else:
            self.totalRealNeg+=1
            if P<=0.5:
                self.totalNeg+=1

    def useDevelopmentData(self,pathPos,pathNeg):
        count=0
        for name in os.listdir(pathPos):
            if count<12000:
                count+=1
                continue
            else:
                self.testText(pathPos,name,1)
        count=0
        for name in os.listdir(pathNeg):
            if count<12000:
                count+=1
                continue
            else:
                self.testText(pathNeg,name,0)

    def trainRegression(self,vectoredText,Y):
        self.stochasticGradientAscent(vectoredText,Y)
        return self.regularise(vectoredText,Y)
        
    def getPrecision(self,precision,index):
        return precision[index]
    
    def getRecall(self,recall,index):
        return recall[index]

        
    def getF1(self,precision,recall):
        F1=2*((precision*recall)/(precision+recall))
        return F1
    
    def testRegression(self):
        
        #directoryTestPos=input("Doste to path tou fakelou me ta thetika review gia testarisma: ")
        #tempDirPosTest=pathlib.Path(directoryTestPos)
        tempDirPosTest="C:\\Users\\dimpe\\Desktop\\pliroforiki\\Python\\aclImdb\\test\\pos" 
        self.test(tempDirPosTest,1)
        #directoryTestNeg=input("Doste to path tou fakelou me ta arnitika review gia testarisma: ")
        #tempDirNegTest=pathlib.Path(directoryTestNeg)
        tempDirNegTest="C:\\Users\\dimpe\\Desktop\\pliroforiki\\Python\\aclImdb\\test\\neg"
        self.test(tempDirNegTest,0) 

    def test(self,path,C):
        for name in os.listdir(path):
            self.testText(path,name,C)
####----ARXI PROGRAMMATOS----####
l1=LogisticRegression()
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
m=100
maxPithanofaneia=0
while True:
    l1.removeList.clear()
    l1.vocabularyUsed.clear()
    l1.probabilityDict.clear()
    l1.posDict.clear()
    l1.posList.clear()
    l1.negDict.clear()
    l1.negList.clear()
    l1.vectorizer=CountVectorizer()
    l1.wordList.clear()
    l1.w=l1.w+[0]*(m-len(l1.w))
    l1.totalNeg=0
    l1.totalPos=0
    l1.totalRealNeg=0
    l1.totalRealPos=0

    l1.readPositiveReviews(tempDirPos,filesToRead)
    l1.readNegativeReviews(tempDirNeg,filesToRead)
    print(len(l1.wordList))

    Words=l1.vectorizer.fit_transform(l1.wordList)
    length=len(list(l1.vectorizer.get_feature_names_out()))
    print(length)
    wordFreq=l1.count1sPerWord(Words)
    print("Done summing")
    l1.vocabularyUsed=copy.deepcopy(wordFreq)

    l1.nMostCommonWords=int(length*0.1)

    l1.kleastCommonWords=int(length*0.5)

    dictu=l1.sortWordsByCount(wordFreq)
    l1.vocabularyUsed=copy.deepcopy(dictu)
    l1.readPosForSum(tempDirPos,filesToRead)
    l1.readNegForSun(tempDirNeg,filesToRead)
    l1.equalizeDictionaries(l1.posDict,l1.negDict)
    
    l1.vocabularyUsed=copy.deepcopy(l1.getMBestWords(m,l1.vocabularyUsed))
    l1.readForTraining(tempDirPos,tempDirNeg,filesToRead)

    l1.useDevelopmentData(tempDirPos,tempDirNeg)


    print(str(l1.totalPos)+" "+str(l1.totalRealPos))
    print(str(l1.totalNeg)+" "+str(l1.totalRealNeg))

    l1.filesRead.append(filesToRead)
    l1.precision.append((l1.totalPos)/(l1.totalPos+(l1.totalRealNeg-l1.totalNeg)))
    l1.recall.append((l1.totalPos)/(l1.totalPos+(l1.totalRealPos-l1.totalPos)))
    temp=(l1.totalPos+l1.totalNeg)/(l1.totalRealPos+l1.totalRealNeg)
    if temp<correctPercentage:
        break
    else:
        if filesToRead!=12000:
            filesToRead+=1000
            m+=250
            l1.w+=[0]*250
        else:
            break

while True:
    l1.lamda=1.5
    l1.useDevelopmentData(tempDirPos,tempDirNeg)
    print(str(l1.totalPos)+" "+str(l1.totalRealPos))
    print(str(l1.totalNeg)+" "+str(l1.totalRealNeg))
    temp=(l1.totalPos+l1.totalNeg)/(l1.totalRealPos+l1.totalRealNeg)
    if temp<correctPercentage:
        break
    else:
        if filesToRead!=12000:
            filesToRead+=1000
            filesToReadList.append(filesToRead)
            m+=250
            l1.w+=[0]*250
        else:
            break


def devDataNumber():
    return [1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000]

f1List=[]
for i in range(len(l1.filesRead)):
    f1List.append(l1.getF1(l1.precision[i],l1.recall[i]))

plt.figure(figsize=(20,10))

plt.subplot(2,2,1)
plt.plot(l1.filesRead,l1.precision,'r--')
plt.ylabel('Precision')
plt.xlabel('Training Files')

plt.subplot(2,2,2)
plt.plot(l1.filesRead,l1.recall,'b--')
plt.ylabel('Recall')
plt.xlabel('Training Files')

plt.subplot(2,2,3)
plt.plot(l1.filesRead,f1List,'g--')
plt.ylabel('F1')
plt.xlabel('Training Files')

plt.subplot(2,2,4)
plt.plot(l1.filesRead,devDataNumber(),'m--')
plt.ylabel('Development Files')
plt.xlabel('Training Files')

plt.show()

print("Βρέθηκε βέλτιστη προσέγγιση")
print(str(correctPercentage)+"% σωστά αποτελέσματα")

print("Αρχίζουμε να τεστάρουμε...")
l1.testRegression()
print("Τέλος τεστ")


precisionP=(l1.totalPos)/(l1.totalPos+(l1.totalRealNeg-l1.totalNeg))
print("Συνολικό Precision στα θετικά: "+str(precisionP))
recallP=(l1.totalPos)/(l1.totalPos+(l1.totalRealPos-l1.totalPos))
print("Συνολικό recall στα θετικά: "+str(recallP))
precisionN=(l1.totalNeg)/(l1.totalNeg+(l1.totalRealPos-l1.totalPos))
print("Συνολικό Precision στα αρνητικά: "+str(precisionN))
recallN=(l1.totalNeg)/(l1.totalNeg+(l1.totalRealNeg-l1.totalNeg))
print("Συνολικό recall στα αρνητικά: "+str(recallN))

f1P=2*((precisionP*recallP)/(precisionP+recallP))
print("Συνολικό f1 για θετικά: "+str(f1P))
f1N=2*((precisionN*recallN)/(precisionN+recallN))
print("Συνολικό f1 για αρνητικά: "+str(f1N))

macroPrec=(precisionP+precisionN)/2
print("Macro-Precision: "+str(macroPrec))
macroRec=(recallP+recallN)/2
print("Macro-Recall: "+str(macroRec))
microPrec=(l1.totalPos+l1.totalNeg)/((l1.totalPos+(l1.totalRealNeg-l1.totalNeg))+(l1.totalNeg+(l1.totalRealPos-l1.totalPos)))
print("Micro-Precision: "+str(microPrec))
microRec=(l1.totalPos+l1.totalNeg)/((l1.totalPos+(l1.totalRealPos-l1.totalPos))+(l1.totalNeg+(l1.totalRealNeg-l1.totalNeg)))
print("Micro-Recall: "+str(microRec))