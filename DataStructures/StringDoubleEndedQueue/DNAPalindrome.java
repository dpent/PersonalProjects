import java.util.*;
public class DNAPalindrome{


    public static void main(String args[]){

        DNAPalindrome program= new DNAPalindrome();
        Scanner scan = new Scanner(System.in);
        System.out.println("Δώσε ακολουθία DNA: ");
        String dna_bef = scan.nextLine();
        scan.close();
        if(!(dna_bef.length()%2==0)||!(dna_bef.contains("A")||dna_bef.contains("C")||dna_bef.contains("T")||dna_bef.contains("G")||dna_bef.contains(" "))){
            program.endProgramm();
        }
        String dna_bef_half=dna_bef.substring(dna_bef.length()/2);
        dna_bef=dna_bef.substring(0,dna_bef.length()/2);
        StringDoubleEndedQueueImpl dna_q= new StringDoubleEndedQueueImpl();
        for (int i=0;i<dna_bef_half.length();i++){
            if(dna_bef.matches(".*[a-z].*")||(String.valueOf(dna_bef_half.charAt(dna_bef_half.length()-i-1))).equals(String.valueOf(dna_bef.charAt(i)))){
                program.endProgramm();
            }
            if(String.valueOf(dna_bef_half.charAt(dna_bef_half.length()-i-1)).equals("A")){
                dna_q.addFirst("T");   
            }else if(String.valueOf(dna_bef_half.charAt(dna_bef_half.length()-i-1)).equals("T")){
                dna_q.addFirst("A");
            }else if(String.valueOf(dna_bef_half.charAt(dna_bef_half.length()-i-1)).equals("C")){
                dna_q.addFirst("G");
            }else{
                dna_q.addFirst("C");
            }
            if(!(dna_q.tail.data.equals(String.valueOf(dna_bef.charAt(i))))){
                program.endProgramm();
            }else{
                dna_q.removeLast();
            }
        }
        System.out.println("Η ακολουθία είναι συμπληρωματικά παλίνδρομη.");
    }


    public void endProgramm(){
        System.out.println("Η ακολουθία δεν είναι συμπληρωματικά παλίνδρομη.");
        System.exit(0);
    }

    


    
}

