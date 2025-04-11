import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class DynamicInfluenza_k_withPQ {
     public static void main(String args[]) throws IOException{

        int k=Integer.valueOf(args[0]);
        String fileName=args[1]; 


        BufferedReader reader = new BufferedReader(new FileReader(fileName));
        PQ pq = new PQ();


        String line="t";
        String[] splitLine;
        City max=null;

        while(line!=null) {
            line=reader.readLine();
            if(line!=null)
                splitLine=line.split(" ");
            else
                break;

            if (pq.size()<k) {
                pq.insert(new City(Integer.valueOf(splitLine[0]),splitLine[1],Integer.valueOf(splitLine[2]),Integer.valueOf(splitLine[3])));
                if(pq.size()==1){
                    max=new City(Integer.valueOf(splitLine[0]),splitLine[1],Integer.valueOf(splitLine[2]),Integer.valueOf(splitLine[3]));
                }else{
                    if(max.compareTo(new City(Integer.valueOf(splitLine[0]),splitLine[1],Integer.valueOf(splitLine[2]),Integer.valueOf(splitLine[3])))==-1){
                        max=new City(Integer.valueOf(splitLine[0]),splitLine[1],Integer.valueOf(splitLine[2]),Integer.valueOf(splitLine[3]));
                    }
                }
            }else{
                if (max.compareTo(new City(Integer.valueOf(splitLine[0]),splitLine[1],Integer.valueOf(splitLine[2]),Integer.valueOf(splitLine[3])))==1){
                    pq.remove(max.ID);
                    pq.insert(new City(Integer.valueOf(splitLine[0]),splitLine[1],Integer.valueOf(splitLine[2]),Integer.valueOf(splitLine[3])));
                    max=pq.cityArr[pq.size()];
                    for(int i=1;i<pq.size();i++){
                        if(max.compareTo(pq.cityArr[i])==-1){
                            max=pq.cityArr[i];
                        }
                    }
                }
            }


        }

        reader.close();
        
        System.out.println("The top "+k+" cities are:");
        for(int i=0; i<k; i++){
            System.out.println(pq.getmin().name);
        }

        System.exit(0);
    
    }
}
