"""A calendar i made in my first year of university as an assignment. This is all in greek unfortunately, but you can still experiment
The controls are: ENTER to see the next month, '-' to see the last month, '+' to manage the events saved in the calendar, '*' to see the events of a selected month, 'q' to close the program
If you pressed '+' then to insert a new event press '1', press '2' to delete one and '3' to update one. '0' takes you back to the main menu. To add an event insert the year, month, day, hour, minute, duration and title of the event
To update an event you have to enter the year, month and then press the button that corresponds to the event that you want. Make the changes you want. To delete one insert the year and month, and then press the button that corresponds to it."""


import calendar
import datetime
from datetime import datetime
import csv


#VRISKEI AN I MERA EXEI GEGONOS APOTHIKEUMENO
def has_gegonos(gegonota,xronia,minas,mera):
    for gegonos in gegonota:
        if str(xronia)+"-"+str(minas)+"-"+str(mera)==gegonos[0]:
            return "*"
    return " "




#SINARTISI POU MORFOPOIEI TIN LISTA POU PERIEXEI TIS MERES TOY IMEROLOGIOY ETSI OSTE OI MERES TOY PROIGOUMENOY KAI TOY
#EPOMENOY MINA NA KSEXORIZOYN APO TON MINA POU PROVALETAI
def meres_tou_mina(xronia,minas,gegonota):
    Meres_mhna=list(calendar.monthcalendar(xronia,minas))
    proti_mera=calendar.monthrange(xronia,minas)[0]
    i=0
    while i<proti_mera:
        if minas!=1:
            Meres_mhna[0][i]=calendar.monthrange(xronia,minas-1)[1]-(proti_mera-(i+1))
        else:
            Meres_mhna[0][i]=calendar.monthrange(xronia-1,12)[1]-(proti_mera-(i+1))
        i+=1
    n=1
    for i in Meres_mhna:
        m=0
        for j in i:
            if j==0:
                i[m]=n
                n+=1
            m+=1
    meres_output=""

    for i in Meres_mhna:
        m=0
        for j in i:
            if i==Meres_mhna[0]:
                if j>7:
                    meres_output=meres_output+"   "+str(j)+" |"
                else:
                    meres_output=meres_output+"[ "+has_gegonos(gegonota,xronia,minas,str(j))+str(j)+"]"
                    if m!=6:
                        meres_output=meres_output+" |"
                        
            elif i==Meres_mhna[len(Meres_mhna)-1]:
                if j<20:
                    meres_output=meres_output+"  "+str(j)
                    if m!=6:
                        meres_output=meres_output+"   |"
                else:
                    if m!=6:
                        meres_output=meres_output+"["+has_gegonos(gegonota,xronia,minas,str(j))+str(j)+"]"+" |"
                    else:
                        meres_output=meres_output+"["+has_gegonos(gegonota,xronia,minas,str(j))+str(j)+"]"
                        
            else:
                if j<10:
                    meres_output=meres_output+"[ "+has_gegonos(gegonota,xronia,minas,str(j))+str(j)+"]"
                else:
                    meres_output=meres_output+"["+has_gegonos(gegonota,xronia,minas,str(j))+str(j)+"]"
                if m!=6:
                    meres_output=meres_output+" |"
            m+=1
        meres_output=meres_output+"\n"
    return meres_output
        

#EMFANIZEI TO IMEROLOGIO SIMFONA ME TOUS KANONES TIS ERGASIAS
def Hmerologio_mhna(xronia,minas):
    print("________________________________________________")

    if minas==1:
        minasStr="ΙΑΝ"
    elif minas==2:
        minasStr="ΦΕΒ"
    elif minas==3:
        minasStr="ΜΑΡ"
    elif minas==4:
        minasStr="ΑΠΡ"
    elif minas==5:
        minasStr="ΜΑΪ"
    elif minas==6:
        minasStr="ΙΟΥΝ"
    elif minas==7:
        minasStr="ΙΟΥΛ"
    elif minas==8:
        minasStr="ΑΥΓ"
    elif minas==9:
        minasStr="ΣΕΠ"
    elif minas==10:
        minasStr="ΟΚΤ"
    elif minas==11:
        minasStr="ΝΟΕ"
    else:
        minasStr="ΔΕΚ"
    print(minasStr,"  ",xronia)
    print("________________________________________________")
    print("  ΔΕΥ |  ΤΡΙ |  ΤΕΤ |  ΠΕΜ |  ΠΑΡ |  ΣΑΒ |  ΚΥΡ")
    print(meres_tou_mina(xronia,minas,gegonota))


#MENOU
def basiko_menu():
    print("Πατήστε ENTER για προβολή του επόμενου μήνα,","'q' για έξοδο ή κάποια από τις παρακάτω επιλογές:")
    print("\t","'-' για πλοήγηση στον προηγούμενο μήνα")
    print("\t","'+' για διαχείρηση των γεγονότων του ημερολογίου")
    print("\t","'*' για εμφάνιση των γεγονότων ενός επιλεγμένου μήνα")
    print("-> ",end="") 
    epilogi=input()
    return epilogi

#MENOU DIAXEIRIS(EPILOGI "+")
def menou_diaxeirisis():
    print("_____________________________________________________")
    print("Διαχείριση γεγονότων ημερολογίου, επιλέξτε ενέργεια:")
    print("\t","1 Καταγραφή νέου γεγονότος")
    print("\t","2 Διαγραφή γεγονότος")
    print("\t","3 Ενημέρωση γεγονότος")
    print("\t","0 Επιστροφή στο κυρίως μενού")
    print("-> ",end="")
    epilogi=input()
    return epilogi

#DIMIOURGIA NEOU GEGONOTOS(EPILOGI "1")
def dimiourgia_gegonotos(xronia,gegonota):
    #LISTA POU PERIEXEI TA DEDOMENA POU THA EISAXTHOUN STO ARXEIO CSV
    gegonos = []
    #----------------------------------------------------------------
    epikal=False
    while epikal==False:
        print("Έτος γεγονότος:",end="")
        imerominia_geg=input()
        while int(imerominia_geg)<=2022:
            print("Λάθος χρονιά. Η χρονιά πρέπει να είναι μετά το 2022")
            print("Έτος γεγονότος:",end="")
            imerominia_geg=input()

        imerominia_geg=str(int(imerominia_geg))
        imerominia_geg=imerominia_geg+"-"
            
        print("Μήνας γεγονότος:",end="")
        minas_menou=input()
        while int(minas_menou)<1 or int(minas_menou)>12:
            print("Λάθος μήνας. Ο μήνας πρέπει να είναι μεταξύ του 1 και του 12")
            print("Μήνας γεγονότος:",end="")
            minas_menou=input()

        minas_menou=str(int(minas_menou))    
        imerominia_geg=imerominia_geg+minas_menou+"-"
            
        print("Μέρα γεγονότος:",end="")
        mera=input()
        while int(mera)<=0 or int(mera)>calendar.monthrange(xronia,int(minas_menou))[1]:
            print("Λάθος ημέρα. Η μέρα θα πρέπει να ανήκει στον συγκεκριμένο μήνα.Ο συγκεκριμένος μήνας έχει",calendar.monthrange(xronia,int(minas_menou))[1],"μέρες") 
            print("Μέρα γεγονότος:",end="")
            mera=input()

        mera=str(int(mera))    
        imerominia_geg=imerominia_geg+mera
            
        print("Ώρα έναρξης γεγονότος:",end="")
        ora_geg=input()
        while int(ora_geg)<0 or int(ora_geg)>23:
            print("Λάθος ώρα. Ξαναπροσπαθείστε")
            print("Ώρα έναρξης γεγονότος:",end="")
            ora_geg=input()

        ora_geg=str(int(ora_geg))    
        ora_geg=ora_geg+":"

        print(ora_geg,end="")
        lepta=input()
        while int(lepta)<0 or int(lepta)>59:
            print("Λάθος ώρα. Ξαναπροσπαθείστε")
            print(ora_geg,end="")
            lepta=input()

        lepta=str(int(lepta))
        if lepta=="0":
            lepta="00"    
        ora_geg=ora_geg+lepta

        print("Διάρκεια γεγονότος:",end="")	
        diarkeia=input()
        diarkeia=int(diarkeia)
        while diarkeia<0:
            print("Η διάρκεια πρέπει να είναι θετικός ακέραιος")
            print("Διάρκεια γεγονότος:",end="")	
            diarkeia=input()
            diarkeia=int(diarkeia)

        print("Τίτλος γεγονότος:",end="")
        titlos=input()
        while "," in titlos==True:
            print("Ο τίτλος πρέπει να μην περιέχει το χαρακτήρα ','(κόμμα)")
            print("Τίτλος γεγονότος:",end="")
            titlos=input()
            
        epikal=xron_epikal(gegonota,ora_geg,lepta,diarkeia,imerominia_geg,epikal)
        if epikal==True:
            dimiourgia_gegonotos(xronia,gegonota)
        else:
            gegonos.append(imerominia_geg)
            gegonos.append(ora_geg)
            gegonos.append(diarkeia)
            gegonos.append(titlos)
            break
            

    gegonota.append(gegonos)

#DIAVAZEI TA GEGONOTA APO TO CSV ARXEIO
def read_gegonota(gegonota):
    try: 
        with open('events.csv','r',newline='',encoding='utf-8') as csvfile:
            csvreader=csv.reader(csvfile, delimiter=';')
            for line in csvreader:
                gegonota.append(line)
            gegonota.pop(0)
            print(gegonota)
    except:
            return None     

#DIAGRAFEI ENA GEGONOS(EPILOGI "2")
def diagrafi_gegonotos(gegonota):
    k,etos,minas_csv,n=emfanisi_geg(gegonota,"Διαγραφή")
    if k==True:
        diagrafi_geg=input("Επιλέξτε το γεγονός που θέλετε να διαγράψετε πληκτρολογώντας τον αντίστοιχο αριθμό:")
        while int(diagrafi_geg)<0 or int(diagrafi_geg)>n-1:
            print("Λάθος αριθμός γεγονότος")
            diagrafi_geg=input("Επιλέξτε το γεγονός που θέλετε να διαγράψετε πληκτρολογώντας τον αντίστοιχο αριθμό:")

        n=0
        k=0
        for gegonos in gegonota:
            if etos+"-"+minas_csv+"-" in gegonos[0]:
                if n==int(diagrafi_geg):
                    gegonota.pop(k)
                n+=1
            k+=1
    
    return gegonota


    
#APOTHIKEUEI TA GEGONOTA STO CSV ARXEIO
def apothikeusi_csv(gegonota):
    with open('events.csv','w', newline='', encoding='utf-8') as csvfile:
        csvwriter=csv.writer(csvfile, delimiter=';')
        header=["Ημερομηνία","Ώρα έναρξης","Διάρκεια","Τίτλος"]
        csvwriter.writerow(header)
        csvwriter.writerows(gegonota)


#EMFANIZEI TA GEGONOTA ENOS EPILEGMENOU MINA(EPILOGI "*")
def emfanisi_geg(gegonota,mnm):
    
    print("==== "+mnm+" γεγονότων ====")

    print("Εισάγετε έτος:",end="")
    etos=input()
    while int(etos)<=2022:
        print("Λάθος χρονιά. Η χρονιά πρέπει να είναι μετά το 2022")
        print("Έτος γεγονότος:",end="")
        etos=input()
    
    print("Εισάγετε μήνα:",end="")
    minas_csv=input()
    while int(minas_csv)>12 or int(minas_csv)<1:
        print("Λάθος μήνας. Ο μήνας πρέπει να είναι μεταξύ του 1 και του 12")
        print("Μήνας γεγονότος:",end="")
        minas_csv=input()
    
    n=0
    k=False
    for gegonos in gegonota:
        if etos+"-"+minas_csv+"-" in gegonos[0]:
            print(str(n)+".",end=" ")
            print("["+gegonos[3]+"] -> ",end="")
            print("Date: "+gegonos[0]+", ",end="")
            print("Time: "+gegonos[1]+", ",end="")
            print("Duration: "+str(gegonos[2]))
            print("")
            n+=1
            k=True
    return k,etos,minas_csv,n

#ENIMERONEI ENA GEGONOS(EPILOGI "3")
def enimerosi_geg(gegonota):
    epikal=False
    k,etos,minas_csv,n=emfanisi_geg(gegonota,"Ενημέρωση")
    if k==True:
        print("Επιλέξτε γεγονός:",end="")
        epilogi_geg=input()
        while int(epilogi_geg)<0 or int(epilogi_geg)>n-1:
            print("Λάθος αριθμός γεγονότος")
            epilogi_geg=input("Επιλέξτε το γεγονός που θέλετε να διαγράψετε πληκτρολογώντας τον αντίστοιχο αριθμό:")
        k=False
        while k==False:
            v=0
            n=0
            for gegonos in gegonota:
                if etos+"-"+minas_csv+"-" in gegonos[0]:
                    if n==int(epilogi_geg):
                        print("Ημερομηνία γεγονότος ","(",gegonos[0],"):",end="")
                        tropopoihsh=input()
                        if tropopoihsh=="":
                            print("↵")
                            hmerominia=gegonos[0]
                        else:
                            if int(tropopoihsh)>2022:
                                hmerominia=tropopoihsh+"-"
                            while int(tropopoihsh)<=2022:
                                print("Λάθος χρονιά. Η χρονιά πρέπει να είναι μετά το 2022")
                                print("Ημερομηνία γεγονότος ","(",gegonos[0],"):",end="")
                                tropopoihsh=input()
                                if tropopoihsh=="":
                                    print("↵")
                                    hmerominia=gegonos[0].rsplit("-")[0]+"-"
                                else:
                                    tropopoihsh=str(int(tropopoihsh))
                                    hmerominia=tropopoihsh+"-"
                                
                            print(hmerominia,end="")
                            minas_menou=input()
                            if tropopoihsh=="":
                                print("↵")
                                minas_menou=gegonos[0].rsplit("-")[1]+"-"
                                hmerominia=hmerominia+minas_menou
                            else:
                                hmerominia=hmerominia+minas_menou+"-"
                            while int(minas_menou)<1 or int(minas_menou)>12:
                                print("Λάθος μήνας. Ο μήνας πρέπει να είναι μεταξύ του 1 και του 12")
                                print("Μήνας γεγονότος:",end="")
                                tropopoihsh=input()
                                if tropopoihsh=="":
                                    print("↵")
                                    hmerominia=hmerominia+gegonos[0].rsplit("-")[0]+"-"
                                else:
                                    tropopoihsh=str(int(tropopoihsh))
                                    hmerominia=hmerominia+minas_menou+"-"

                            print(hmerominia,end="")    
                            tropopoihsh=input()                            
                            if tropopoihsh=="":
                                print("↵")
                                hmerominia=hmerominia+gegonos[0].rsplit("-")[2]
                            else:
                                hmerominia=hmerominia+tropopoihsh
                            while int(tropopoihsh)<=0 or int(tropopoihsh)>calendar.monthrange(xronia,int(minas_menou))[1]:
                                print("Λάθος ημέρα. Η μέρα θα πρέπει να ανήκει στον συγκεκριμένο μήνα.Ο συγκεκριμένος μήνας έχει",calendar.monthrange(xronia,int(minas_menou))[1],"μέρες") 
                                print("Μέρα γεγονότος:",end="")
                                tropopoihsh=input()
                                if tropopoihsh=="":
                                    print("↵")
                                    hmerominia=hmerominia+gegonos[0].rsplit("-")[2]
                                else:
                                    tropopoihsh=str(int(tropopoihsh))
                                    hmerominia=hmerominia+tropopoihsh

                        print("Ώρα γεγονότος ","(",gegonos[1],"):",end="")
                        tropopoihsh=input()
                        if tropopoihsh=="":
                            print("↵")
                            ora=gegonos[1]
                            lepta=gegonos[1].rsplit(":")[1]
                        else:
                            while int(tropopoihsh)<0 or int(tropopoihsh)>23:
                                print("Λάθος ώρα. Ξαναπροσπαθείστε")
                                print("Ώρα γεγονότος ","(",gegonos[1],"):",end="")
                                tropopoihsh=input()
                                if tropopoihsh=="":
                                    print("↵")

                            tropopoihsh=str(int(tropopoihsh))
                            ora=tropopoihsh+":"

                            print(ora,end="")
                            tropopoihsh=input()
                            if tropopoihsh=="":
                                print("↵")
                                lepta=gegonos[1].rsplit(":")[1]
                            while int(tropopoihsh)<0 or int(tropopoihsh)>59:
                                print("Λάθος ώρα. Ξαναπροσπαθείστε")
                                print(ora,end="")
                                tropopoihsh=input()
                                if tropopoihsh=="":
                                    print("↵")

                            tropopoihsh=str(int(tropopoihsh))  
                            lepta=tropopoihsh
                            if tropopoihsh=="0":
                                tropopoihsh="00"       
                            ora=ora+tropopoihsh

                        print("Διάρκεια γεγονότος ","(",gegonos[2],"):",end="")	
                        diarkeia=input()
                        if diarkeia=="":
                            print("↵")
                            diarkeia=gegonos[2]
                        else:
                            diarkeia=int(diarkeia)
                            while diarkeia<0:
                                print("Η διάρκεια πρέπει να είναι θετικός ακέραιος")
                                print("Διάρκεια γεγονότος","(",gegonos[2],"):",end="")	
                                diarkeia=input()
                                if tropopoihsh=="":
                                    print("↵")
                                diarkeia=int(diarkeia)        
                                
                        print("Τίτλος γεγονότος ","(",gegonos[3],"):",end="")
                        titlos=input()
                        if titlos=="":
                            print("↵")
                            titlos=gegonos[3]
                        else:    
                            while "," in titlos==True:
                                print("Ο τίτλος πρέπει να μην περιέχει το χαρακτήρα ','(κόμμα)")
                                print("Τίτλος γεγονότος ","(",gegonos[3],"):",end="")
                                titlos=input()
                                if tropopoihsh=="":
                                    print("↵")
                        epikal=xron_epikal(gegonota,ora,lepta,diarkeia,hmerominia,epikal)
                        if epikal==False:
                            gegonos[0]=hmerominia
                            gegonos[1]=ora
                            gegonos[2]=diarkeia
                            gegonos[3]=titlos
                            k=True
                            break
                        else:
                            epikal=False
                    n+=1
                v+=1
            if k==True:
                break

#VRISKEI TA XRONIKA KENA SE MIA MERA
def xron_kena(gegonota,imeromhnia):
    xron_kena_meras=[]
    for gegonos in gegonota:
        if imeromhnia in gegonos[0]:
            if len(xron_kena_meras)==0:
                if gegonos[1]!="00:00" and len(xron_kena_meras)==0:
                    xron_kena_meras.append("00:00")
                    xron_kena_meras.append(gegonos[1])
            else:
                xron_kena_meras.append(gegonos[1])
            if int(gegonos[1].rsplit(":")[1])+int(gegonos[2])>60:
                ora_liskis=int(gegonos[1].rsplit(":")[0])+int((int(gegonos[1].rsplit(":")[1])+int(gegonos[2]))/60)
                lepta_liksis=(int(gegonos[1].rsplit(":")[1])+int(gegonos[2]))%60
            else:
                ora_liskis=gegonos[1].rsplit(":")[0]+":"
                lepta_liksis=int(gegonos[1].rsplit(":")[1])+int(gegonos[2])
                
            ora_liskis_str=str(ora_liskis)+":"+str(lepta_liksis)
            xron_kena_meras.append(ora_liskis_str)
    xron_kena_meras_str=""
    if len(xron_kena_meras)!=0 and len(xron_kena_meras)%2==1:
            xron_kena_meras.append("23:59")
    elif len(xron_kena_meras)!=0 and len(xron_kena_meras)==2:
            xron_kena_meras.pop(1)
            xron_kena_meras.append("23:59")
    elif len(xron_kena_meras)!=0 and len(xron_kena_meras)%2==0:
            xron_kena_meras.pop(len(xron_kena_meras)-1)
            xron_kena_meras.append("23:59")

        
    xron_kena_meras=sort_xron_kena_meras(xron_kena_meras).copy()
    for i in xron_kena_meras:
        xron_kena_meras_str=xron_kena_meras_str+i
    return xron_kena_meras_str
        

#VRISKEI AN O XRISTIS KATAXORISE GOGONOS TO OPOIO EXEI XRONIKI EPIKALIPSI ME ALLO(BONUS LEITOURGIA 1)
def xron_epikal(gegonota,ora,lepta,diarkeia,imeromhnia,epikal):
    ora_int=0
    lepta_int=0
    diarkeia_int=0
    xron_kena_meras=xron_kena(gegonota,imeromhnia)
    for gegonos in gegonota:
        if imeromhnia in gegonos[0]:
            lep_enarksis=int(gegonos[1].rsplit(":")[1])
            ora_enarksis=int(gegonos[1].rsplit(":")[0])
            ora_liksis=int(gegonos[1].rsplit(":")[0])
            lep_liksis=int(gegonos[1].rsplit(":")[1])
            if int(lep_enarksis)+int(gegonos[2])>=60:
                ora_liksis+=int((int(lep_enarksis)+int(gegonos[2]))/60)
                lep_liksis=(int(gegonos[1].rsplit(":")[1])+int(gegonos[2]))%60
            else:
                lep_liksis+=int(gegonos[2])
            
            k=False

            if int(ora.rsplit(":")[0])==ora_liksis:
                if int(lepta)+int(diarkeia)>=60:
                    lepta_int=int(lepta)
                    diarkeia_int=int(diarkeia)
                    ora_int=int((lepta_int+diarkeia_int)/60)
                    lepta_liksis_mi_apoth=(int(lepta)+int(diarkeia))%60
                else:
                    lepta_liksis_mi_apoth=int(lepta)+int(diarkeia)
                if int(lepta)<lep_liksis and int(lepta)>lep_enarksis:
                    print("\n")
                    print("Υπάρχει χρονική επικάλυψη με το γεγονός '",gegonos[3],"' που ξεκινά στις ",gegonos[1])
                    print("Τα διαθέσιμα χρονκά κενά στις ",gegonos[0]," είναι μεταξύ:"+str(xron_kena_meras))
                    print("\n")
                    k=True
                    epikal=True 
                elif lepta_liksis_mi_apoth>lep_enarksis and lepta_liksis_mi_apoth<lep_liksis:
                    print("\n")
                    print("Υπάρχει χρονική επικάλυψη με το γεγονός '",gegonos[3],"' που ξεκινά στις ",gegonos[1])
                    print("Τα διαθέσιμα χρονκά κενά στις ",gegonos[0]," είναι μεταξύ:"+str(xron_kena_meras))
                    print("\n")
                    k=True
                    epikal=True
            if k==False:
                v=False
                ora_liksis=ora.rsplit(":")[0]
                if int(lepta)+int(diarkeia)>60:
                    ora_liksis=int(ora_liksis)+(int(lepta)+int(diarkeia))%60
                if int(ora_liksis)==int(ora_enarksis):
                    if lep_enarksis<=int(lepta) and lep_liksis>int(lepta):
                        print("\n")
                        print("Υπάρχει χρονική επικάλυψη με το γεγονός '",gegonos[3],"' που ξεκινά στις ",gegonos[1])
                        print("Τα διαθέσιμα χρονκά κενά στις ",gegonos[0]," είναι μεταξύ:"+str(xron_kena_meras))
                        print("\n")
                        epikal=True
                        v=True
                if int(lepta)+int(diarkeia)>60:
                    lepta_int=int(lepta)
                    diarkeia_int=int(diarkeia)
                    ora_int=int((lepta_int+diarkeia_int)/60)
                    ora_liksis=ora.rsplit(":")[0]+str(ora_int)
                    lepta=(int(lepta)+int(diarkeia))%60
                else:
                    lepta=int(lepta)+int(diarkeia)
                
                if int(ora_liksis)==int(ora_enarksis) and v==False:
                    if lep_enarksis<=int(lepta) and lep_liksis>int(lepta):
                        print("\n")
                        print("Υπάρχει χρονική επικάλυψη με το γεγονός '",gegonos[3],"' που ξεκινά στις ",gegonos[1])
                        print("Τα διαθέσιμα χρονκά κενά στις ",gegonos[0]," είναι μεταξύ:"+str(xron_kena_meras))
                        print("\n")
                        epikal=True
                
                else:
                    lepta=lepta-int(diarkeia)
    return epikal

#TAKSINOMEI TA DIATHESIMA XRONIKA KENA
def sort_xron_kena_meras(xron_kena_meras):
    sorted_xron_kena=[]
    for i in xron_kena_meras:
        if i!="-" and i!=" , ":
            sorted_xron_kena.append(i)
    
    sorted(sorted_xron_kena)
    n=0
    meg_sorted=0
    while meg_sorted<len(sorted_xron_kena):
        if meg_sorted%2==1:
            if n==0:
                sorted_xron_kena.insert(meg_sorted,"-")
                n+=1
            else:
                sorted_xron_kena.insert(meg_sorted," , ")
                n-=1
        meg_sorted+=1
    xron_kena_meras=sorted_xron_kena.copy()
    return xron_kena_meras


#IPENTHIMIZEI STON XRISTI TA GEGONOTA TIS IMERAS(BONUS LEITOURGIA 2)
def ipenthimisi_geg(gegonota,xronia,minas):
    currentDateAndTime = datetime.now()
    mera=datetime.now().day
    hmerominia=str(xronia)+"-"+str(minas)+"-"+str(mera)
    ora=currentDateAndTime.hour
    lepta=currentDateAndTime.minute
    xron_apost=""
    for gegonos in gegonota:
        if str(hmerominia) in gegonos[0]:
            ora_geg=int(gegonos[1].rsplit(":")[0])
            lept_geg=int(gegonos[1].rsplit(":")[1])
            if ora_geg>ora:
                xron_apost="Σε "+str(ora_geg-ora)+" ώρες και "+str(abs(lept_geg-lepta))+" λεπτά από τώρα έχει προγραμματιστεί το γεγονός '"+gegonos[3]+"'"
            elif ora_geg==ora:
                xron_apost="Σε "+str(abs(lept_geg-lepta))+" λεπτά από τώρα έχει προγραμματιστεί το γεγονός '"+gegonos[3]+"'"
        if xron_apost!="":
            print("\n")
            print(xron_apost)


"""-------------ARXH--------------"""
minas=datetime.now().month
xronia=datetime.now().year
#LISTA ME TA GEGONOTA POU THA EGRAFOUN
gegonota=[]
read_gegonota(gegonota)
ipenthimisi_geg(gegonota,xronia,minas)


Hmerologio_mhna(xronia,minas)

while True:
    epilogi=basiko_menu()

    if epilogi=="-":
        if minas!=1:
            minas-=1
        else:
            xronia-=1
            minas=12
        Hmerologio_mhna(xronia,minas)
    elif epilogi=="":
        if minas!=12:
            minas+=1
        else:
            xronia+=1
            minas=1
        Hmerologio_mhna(xronia,minas)
    elif epilogi=="q":
        apothikeusi_csv(gegonota)
        exit()
    elif epilogi=="+":
        while True:
            epilogi=menou_diaxeirisis()
            if epilogi=="1":
                dimiourgia_gegonotos(xronia,gegonota)
            elif epilogi=="2":
                gegonota=diagrafi_gegonotos(gegonota)
            elif epilogi=="3":
                enimerosi_geg(gegonota)
            elif epilogi=="0":
                break
    elif epilogi=="*":
        emfanisi_geg(gegonota,"Εμφάνιση")