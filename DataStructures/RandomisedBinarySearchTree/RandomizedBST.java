import java.util.Scanner;
import java.io.BufferedReader;
import java.io.FileReader;
import java.util.List;
import java.io.IOException;

class RandomizedBST implements TaxEvasiomInterface{
    private class Treenode {

    };
    private TreeNode root;
    public double sum = 0;

    //1η επιλογή
    public void insert(LargeDepositor item){
        if (root == null){
           root = new TreeNode(item,null,null,null);
           sum+=root.item.getSavings();
        }else if(root.item.key()==item.key()){
            System.out.println("Λάθος εισαγωγή. Το στοιχείο που δώθηκε είναι ήδη αποθηκευμένο.\n");
            System.exit(0);
        }else{
            TreeNode tmpNode=root.compareAndPlace(item); 
            if(tmpNode==null){
                System.out.println("Λάθος εισαγωγή. Το στοιχείο που δώθηκε είναι ήδη αποθηκευμένο.\n");
                System.exit(0);
            }else{
                if(tmpNode.parent==null){
                    root=tmpNode;
                    sum += tmpNode.item.getSavings();
                }
            }
        }
    }

    //2η επιλογή
    public void load(String ffff){
        System.out.println("Δώσε αρχείο:");
        Scanner scanner = new Scanner(System.in);
        String filename = scanner.nextLine();
        try{
            BufferedReader reader = new BufferedReader(new FileReader(filename));
            String line=reader.readLine();
            while(line!=null){
                    String[] splitline=line.split(" ");
                    LargeDepositor item=new LargeDepositor(Integer.valueOf(splitline[0]),splitline[1],splitline[2],Double.parseDouble(splitline[3]));
                    insert(item);
                    line=reader.readLine();
            }
            reader.close();
        }catch(IOException e){
                System.out.println("o mhtsos einai gei");
            }
    }

    //3η επιλογή
    public void updateSavings(int AFM, double savings){
        LargeDepositor depositor=root.findDepositor(AFM);
        if(depositor!=null){
            depositor.setSavings(savings);
            System.out.println("Επιτυχής ενημέρωση.\n");
        }else{
            System.out.println("Ο ύποπτος δεν είναι καταχωρημένος.\n");
            System.exit(0);
        }
    }

    //4η επιλογή
    public LargeDepositor searchByAFM(int AFM){
        LargeDepositor depositor=root.findDepositor(AFM);
        if(depositor!=null){
            System.out.println(depositor.toString());
        }else{
            System.out.println("Ο ύποπτος δεν είναι καταχωρημένος.\n");
        }
        return depositor;
    }

    //5η επιλογή
    public List searchByLastName(String last_name){
        DepositorList listaDep= new DepositorList(null);
        this.root.searchNextNode(listaDep,last_name);
        if (listaDep.size == 0){
            System.out.println("Το επίθετο δεν υπάρχει\n");
        }else{
            System.out.println("Επιτυχής αναζήτηση.\n");

            if(listaDep.size<=5){
                listaDep.printAllDepositors();
            }

        }
        return null;

    }

    //6η επιλογή
    public void remove(int AFM){
       TreeNode node=null;
        if(this.root!=null){
            node=this.root.findTreeNode(AFM);
            if(node==null){
                System.out.println("Λάθος ΑΦΜ.\n");
            }else{
                sum -= node.item.getSavings();
                TreeNode subRoot=null;
                if(node.left==null && node.right!=null){
                    subRoot=node.right;
                    subRoot.calculateNOfEveryoneAbove();
                }else if(node.left!=null && node.right==null){
                    subRoot=node.left;
                    subRoot.calculateNOfEveryoneAbove();
                }else if(node.left!=null && node.right!=null){
                    subRoot=this.root.joinNodes(node.left,node.right);  
                    if(subRoot==node.left){
                       subRoot.findLeavesAndPlace(node.left);
                       node.left.calculateNOfEveryoneAbove();
                    }else if(subRoot==node.right){
                        subRoot.findLeavesAndPlace(node.right);
                        node.right.calculateNOfEveryoneAbove();
                    }
                }
                if(node==this.root){ 
                    this.root = subRoot;
                }
                if(node.parent.right==node){    //tha kanei calculate to n xoris na exei to nsosto gonea ftiaxto
                    node.parent.right=subRoot;
                }else if(node.parent.left==node){
                    node.parent.left=subRoot;
                }
                System.out.println("Επιτυχής διαγραφή.\n");
                return;
            }
        }else{
            System.out.println("Δεν υπάρχει κάποιος στη λίστα για να διαγραφεί. Εισάγετε πρώτα.\n");
            return;
        }
    }    
    
    //7η επιλογή
    public double getMeanSavings(){
        return sum/(root.N+1);
    }

    //8η επιλογή
    public void printΤopLargeDepositors(int k){
        DepositorList lista=new DepositorList(null);
        lista=root.getTopLargeDepositors(lista, k);
        lista.printAllDepositors();
    }

    //9η επιλογή
    public void printByAFM(){
        root.printAllNodes();
    }

    public static void main (String args[]){
        int choice = 0;
        Scanner scan = new Scanner(System.in);

        RandomizedBST mainappBst = new RandomizedBST();

        while(true){
            System.out.println("1. Εισαγωγή υπόπτου:\n2. Εισαγωγή αρχείου:\n3. Ενημέρωση καταθέσεων:\n4. Αναζήτηση βάσει ΑΦΜ:\n5. Αναζήτηση βάσει επωνύμου:\n6. Διαγραφή υπόπτου:\n7. Εκτύπωση μέσου όρου καταθέσεων:\n8. Εμφάνιση μεγαλύτερων καταθετών:\n9. Εκτύπωση : \n0. Έξοδος");
            System.out.println("Επιλέξτε λειτουργία:");
            choice = scan.nextInt();

            if (choice==1)
            {   
                System.out.println("Δώστε μεγάλο καταθέτη:");
                String temp = scan.nextLine();
                String[] splitline=temp.split(" ");               
                LargeDepositor temp2 = new LargeDepositor(Integer.valueOf(splitline[0]), splitline[1], splitline[2], Double.parseDouble(splitline[3]));
                mainappBst.insert(temp2);
                System.out.println("Επιτυχής εισαγωγή.\n");
                
            }else if(choice==2){
                mainappBst.load("tg");
                System.out.println("Επιτυχής εισαγωγή αρχείου.\n");

            }else if (choice==3){
                if(mainappBst.root==null){
                    System.out.println("Δεν υπάρχουν στοιχεία. Εισάγετε για να μπορέσετε να χρησιμοποιήσετε όλες τις μεθόδους.");
                }else{
                    System.out.println("Δώσε AFM και καταθέσεις:");
                    scan.nextLine();
                    String temp=scan.nextLine();
                    String[] splitline=temp.split(" ");
                    int AFM = Integer.valueOf(splitline[0]);
                    double Savings = Double.valueOf(splitline[1]);
                    mainappBst.updateSavings(AFM, Savings);
                }
                
            }else if (choice==4){
                if(mainappBst.root==null){
                    System.out.println("Δεν υπάρχουν στοιχεία. Εισάγετε για να μπορέσετε να χρησιμοποιήσετε όλες τις μεθόδους.");
                }else{
                    System.out.println("Δώσε AFM:");
                    int AFM  =  scan.nextInt();
                    mainappBst.searchByAFM(AFM);
                }

            }else if (choice==5){
                if(mainappBst.root==null){
                    System.out.println("Δεν υπάρχουν στοιχεία. Εισάγετε για να μπορέσετε να χρησιμοποιήσετε όλες τις μεθόδους.");
                }else{
                    System.out.println("Δώσε επώνυμο:");
                    String surname=scan.nextLine();
                    mainappBst.searchByLastName(surname); 
                }
                
            }else if (choice==6){
                if(mainappBst.root==null){
                    System.out.println("Δεν υπάρχουν στοιχεία. Εισάγετε για να μπορέσετε να χρησιμοποιήσετε όλες τις μεθόδους.");
                }else{
                    System.out.println("Δώσε ΑΦΜ:");
                    int AFM = scan.nextInt();
                    mainappBst.remove(AFM);
                }

            }else if (choice==7){
                if(mainappBst.root==null){
                    System.out.println("Δεν υπάρχουν στοιχεία. Εισάγετε για να μπορέσετε να χρησιμοποιήσετε όλες τις μεθόδους.");
                }else{
                    double meansavings=mainappBst.getMeanSavings();
                    System.out.println("Ο μέσος όρος καταθέσεων είναι: "+meansavings+"\n");
                }

            }else if (choice==8){
                if(mainappBst.root==null){
                    System.out.println("Δεν υπάρχουν στοιχεία. Εισάγετε για να μπορέσετε να χρησιμοποιήσετε όλες τις μεθόδους.");
                }else{
                    System.out.println("Δώστε αριθμό:");
                    int number=scan.nextInt();
                    mainappBst.printΤopLargeDepositors(number);
                }

            }else if (choice==9){
                if(mainappBst.root==null){
                    System.out.println("Δεν υπάρχουν στοιχεία. Εισάγετε για να μπορέσετε να χρησιμοποιήσετε όλες τις μεθόδους.");
                }else{
                    System.out.println("Οι αποθηκευμένοι ύποπτοι είναι: ");
                    mainappBst.printByAFM();
                }

            }else if (choice==0){
                System.exit(0);
                scan.close();

            }else{
                System.out.println("Λάθος επιλογή. Ξαναπροσπαθείστε:");
            }
        }
    }
}