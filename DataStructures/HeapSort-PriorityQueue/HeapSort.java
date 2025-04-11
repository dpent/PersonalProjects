public class HeapSort {

        public void sort(City cities[]){
            int len= cities.length;

            for(int i=len/2-1;i>=0;i--){
                heapify(cities,len,i);
            }

            for(int i=len-1;i>=0;i--){
                City temp= cities[0];
                cities[0]=cities[i];
                cities[i]=temp;
                heapify(cities,i,0);
            }
        }

        void heapify(City cities[], int len, int i){
            int largest=i;
            int left=2*i+1;
            int right=2*i+2;

          

            if (left<len && cities[left].compareTo(cities[largest])==1)
                largest=left;
            
            if (right<len && cities[right].compareTo(cities[largest])==1)
                largest=right;

            if(largest!= i){
                City swap = cities[i];
                cities[i]= cities[largest];
                cities[largest]=swap;
                heapify(cities,len,largest);


            }
        }
}
