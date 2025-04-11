import java.util.*;


public class PrefixToInfix{ 


    public static void main(String args[]){
        Scanner scan=new Scanner(System.in);
        System.out.println("Δώστε μια αριθμητική παράστση σε μεταθεματική μορφή (prefix): ");
        String prefixString=scan.nextLine();
        while(!(String.valueOf(prefixString.charAt(0)).equals("+") || String.valueOf(prefixString.charAt(0)).equals("-") || String.valueOf(prefixString.charAt(0)).equals("*") || String.valueOf(prefixString.charAt(0)).equals("/"))){
            System.out.println("Η παράσταση πρέπει να ξεκινά με - ή + ή * ή /.\n");
            System.out.println("Ξαναπροσπαθείστε: ");
            prefixString=scan.nextLine();
        }
        while(true){
            boolean correctString=false;
            for(int i=0;i<prefixString.length();i++){
                if(String.valueOf(prefixString.charAt(i)).equals("+") || String.valueOf(prefixString.charAt(i)).equals("-") || String.valueOf(prefixString.charAt(i)).equals("*") || String.valueOf(prefixString.charAt(i)).equals("/") || String.valueOf(prefixString.charAt(i)).equals("0") || String.valueOf(prefixString.charAt(i)).equals("1") || String.valueOf(prefixString.charAt(i)).equals("2") || String.valueOf(prefixString.charAt(i)).equals("3") || String.valueOf(prefixString.charAt(i)).equals("4") || String.valueOf(prefixString.charAt(i)).equals("5") || String.valueOf(prefixString.charAt(i)).equals("6") || String.valueOf(prefixString.charAt(i)).equals("7") || String.valueOf(prefixString.charAt(i)).equals("8") || String.valueOf(prefixString.charAt(i)).equals("9")){
                    correctString=true;
                }else{
                    correctString=false;
                    break;
                }
            } 
            if(correctString==false){
                System.out.println("Η παράσταση δεν είναι σε προθεματική μορφή.");
                System.out.println("Ξαναπροσπαθείστε: ");
                prefixString=scan.nextLine();
            }else{
                break;
            }
        }
        scan.close();
        StringDoubleEndedQueueImpl prefixQ=new StringDoubleEndedQueueImpl();
        for(int i=0; i<prefixString.length(); i++){
            prefixQ.addLast(String.valueOf(prefixString.charAt(i)));
        }
        StringDoubleEndedQueueImpl infixQ=new StringDoubleEndedQueueImpl();
        while(prefixQ.isEmpty()==false){
            if(prefixQ.tail.data.equals("*")||prefixQ.tail.data.equals("/")||prefixQ.tail.data.equals("+")||prefixQ.tail.data.equals("-")){
                if(infixQ.size()<2){
                    System.out.println("Η παράσταση δεν είναι σε προθεματική μορφή.");
                    System.exit(0);
                }
                if(prefixQ.size()>1){
                    String operator1=infixQ.head.data;
                    infixQ.removeFirst();
                    String operator2=infixQ.head.data;
                    infixQ.removeFirst();
                    infixQ.addFirst("("+operator1+prefixQ.tail.data+operator2+")");
                    prefixQ.removeLast();
                }else{
                     String operator1=infixQ.head.data;
                    infixQ.removeFirst();
                    String operator2=infixQ.head.data;
                    infixQ.removeFirst();
                    infixQ.addFirst(operator1+prefixQ.tail.data+operator2);
                    prefixQ.removeLast();
                }
            }else{
                infixQ.addFirst(prefixQ.tail.data);
                prefixQ.removeLast();
            }
        }
        infixQ.printQueue(System.out);
    }

}
