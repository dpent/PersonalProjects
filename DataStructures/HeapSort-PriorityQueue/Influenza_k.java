import java.io.*;



public class Influenza_k{


    public static void main(String args[]) throws IOException{
       
        int k=Integer.valueOf(args[0]);
        String fileName=args[1];
        
        
        BufferedReader reader = new BufferedReader(new FileReader(fileName));

        int c = 0;
        while( reader.readLine() != null) {
            c ++;
        }
        reader.close();

        if (k > c){
            System.out.println("The given number is bigger than the number of cities in the file.");
            System.exit(0);

        }
        BufferedReader reader2 = new BufferedReader(new FileReader(fileName));
        String line;
        String[] splitLine;

        City[] cities= new City[c];
        for(int i=0;i<c;i++){
            line=reader2.readLine();
            splitLine=line.split(" ");
            cities[i]=new City(Integer.valueOf(splitLine[0]),splitLine[1],Integer.valueOf(splitLine[2]),Integer.valueOf(splitLine[3]));
        }
        reader2.close();
       

        HeapSort hs=new HeapSort();
        hs.sort(cities);


        System.out.println("The top "+k+" cities are:");
        for(int i=0; i<k; i++){
            System.out.println(cities[i].name);
        }

    }
}
