import java.text.DecimalFormat;

public class City implements CityInterface, Comparable<City> {
    public int ID;
    public String name;
    public int population;
    public int influenzaCases;

    public City(int iD, String Name, int Population, int InfluenzaCases){
        ID = iD;
        name = Name;
        population = Population;
        influenzaCases = InfluenzaCases;
    }
    
    
    public int getID() {
        return ID;
    }

    public void setID(int iD) {
        ID = iD;
    }

    public String getName() {
        return name;
    }

    public void setName(String Name) {
        name = Name;
    }

    public int getPopulation() {
        return population;
    }

    public void setPopulation(int Population) {
        population = Population;
    }

    public int getInfluenzaCases() {
        return influenzaCases;
    }

    public void setInfluenzaCases(int InfluenzaCases) {
        influenzaCases =InfluenzaCases;
    }
 
    public int compareTo(City city) { // girnaei 1 an to city sto orisma tis sinartisis einai pio pano stin tajinomisi(kaliteri thesi stin katataji)
        boolean ret_val;
        if (city.calculateDensity()  < calculateDensity()) {
            ret_val=true;
        }else if (city.calculateDensity()  > calculateDensity()) {
            ret_val=false;        
        }else
            if ((city.name.compareTo(name))>0) {
                ret_val=true;
            }else if(city.name.compareTo(name)<0) {
                ret_val=false;
            }else 
                if(city.ID < ID) {
                    ret_val=true;
                }else
                    ret_val=false;

        if(ret_val==false){
            return -1;
        }else{
            return  1;
        }
    }
    float constant = 50000.0f;
    public float calculateDensity(){
        float density = (constant/population)*influenzaCases;
        String pattern = "###.##";
        DecimalFormat decimalFormat = new DecimalFormat(pattern);
        String format= decimalFormat.format(density);
        density=Float.parseFloat(format);
        return density;
    }

    
}