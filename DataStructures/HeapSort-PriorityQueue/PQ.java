public class PQ {

    int capacity=20;
    public City[] cityArr=new City[capacity];
    public int size_counter = 0;

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }


    
    public boolean isEmpty(){
        if (size_counter == 0){
            return true;
        }else{
            return false;
        }
    }

    public int size(){
        return size_counter;
    }

    public City min(){
        if (size_counter==0)
            return null;
        else{
            return cityArr[1];
        }
    }

    public void insert(City x){
        if(((float)size_counter/(float)capacity)>=0.75){
            cityArr=resize(cityArr);
            capacity=capacity*2;
        }
        cityArr[size_counter+1]=x;
        size_counter++;
        swim(size_counter);
    }

    public City getmin(){
        if (size_counter==0){
            return null;
        }else{
            City temp_root;
            temp_root=cityArr[1];
            swap(1, size_counter);
            cityArr[size_counter]=null;
            sink(1);
            size_counter--;
            return temp_root;
        }
    }

    public City remove(int id){
        City remCity=null;
        for(int i=1;i<=size_counter;i++){
            if(cityArr[i].ID==id){
                swap(i, size_counter);               
                remCity=cityArr[size_counter];
                cityArr[size_counter]=null;
                size_counter--;
                swim(size_counter);
                sink(size_counter);
            }
        }
        return remCity;
    }


    public City[] resize(City[] cityArr){
        City[] newcityArr=new City[cityArr.length*2];
        for(int i=0;i<cityArr.length;i++){
            newcityArr[i]=cityArr[i];
            cityArr[i]=null;
        }
        return newcityArr;
    }

    public void swim(int i){
        if (i==1)
            return;

        int parent = i / 2 ;
        while (i != 1 && cityArr[i].compareTo( cityArr[parent]) == -1) {
            swap(i,parent);
            i = parent ;
            parent = i / 2;
        }
    }

    public void sink(int i) {
        int min=0;
        int left = 2 * i;
        int right = left + 1;

        if (left > size_counter-1)
            return;
        
        while (left <= size_counter-1) {
            min = left;
            if (right <= size_counter-1) {
                if (cityArr[left].compareTo(cityArr[right])==1)
                    min = right;
            }
        
        
            if(cityArr[i].compareTo(cityArr[min])==-1)
                return;
            else{
                swap(i,min);
                i=min;
                left=i*2;
                right=left+1;
            }
        }
    }


    void swap(int i, int j) {
    	City temp = cityArr[i];
        cityArr[i]=cityArr[j];
        cityArr[j]= temp;
    }

}
