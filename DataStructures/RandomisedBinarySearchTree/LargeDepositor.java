class LargeDepositor {
    private int AFM; // ΑΦΜ (ελληνικός)
    private String firstName; // Όνομα
    private String lastName; // Επώνυμο
    private double savings; // Συνολικό ύψος γνωστών καταθέσεων σε άλλες
   // χώρες
    private double taxedIncome; //Συνολικό δηλωμένο εισόδημα στην Ελλάδα
    //την τελευταία 3ετία

    public LargeDepositor(int AFM, String firstName, String lastName, double savings){
        this.AFM=AFM;
        this.firstName=firstName;
        this.lastName=lastName;
        this.savings=savings;
    }

    public LargeDepositor compareTo(LargeDepositor depositor){
        if(this.taxedIncome<8000 && depositor.taxedIncome<8000){
            if(this.AFM<depositor.AFM){
                return depositor;
            }else{
                return this;
            }
        }else if(this.taxedIncome<8000 && depositor.taxedIncome>8000){
            return this;
        }else if(this.taxedIncome>8000 && depositor.taxedIncome<8000){
            return depositor;
        }else{
            if((this.savings-this.taxedIncome)<(depositor.savings-depositor.taxedIncome)){
                return depositor;
            }else if((this.savings-this.taxedIncome)>(depositor.savings-depositor.taxedIncome)){
                return this;
            }else{
                if(this.AFM<depositor.AFM){
                    return depositor;
                }else{
                    return this;
                }
            }
        }
    }

    public String toString(){
        return("AΦΜ (ελληνικός): "+ AFM +"\nΌνομα: "+firstName+"\nΕπίθετο: "+lastName+"\nΣυνολικό ύψος γνωστών καταθέσεων σε άλλες χώρες: "+savings+"\n");
    }

    int key() {return AFM;} //μέθοδος για πρόσβαση στο κλειδί

    public void setAFM(int aFM) {
        AFM = aFM;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }
    
    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public double getSavings() {
        return savings;
    }

    public void setSavings(double savings) {
        this.savings = savings;
    }

    public double getTaxedIncome() {
        return taxedIncome;
    }

    public void setTaxedIncome(double taxedIncome) {
        this.taxedIncome = taxedIncome;
    }
    
    // + getters, setters για τα πεδία
    // + ό,τι άλλο χρειαστεί να προσθέσετε
}