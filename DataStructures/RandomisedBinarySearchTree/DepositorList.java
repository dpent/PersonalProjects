public class DepositorList {
    Node head=null;
    int size=0;

    public DepositorList(Node head){
        this.head=head;
        this.size=0;
    }

    public void addNode(Node node){
        if(head!=null){
            head.addNode(node);
            this.size++;
        }else{
            head=node;
            this.size++;
        }        
    }

    public void removeNode(int AFM){
        if(head.data.item.key()!=AFM){
            head.removeNode(AFM);
            this.size--;
        }else{
            head=head.next;
            this.size--;
        }
    }

    public void printAllDepositors(){
        if(head!=null){
            System.out.println(head.data.item.toString());
            head.printNext();
        }else{
            return;
        }
    }

    public void placeSorted(Node node){     //aujousa seira
        if (head==null){
            head = node;
            this.size++;
        }else{
            LargeDepositor tempDep=head.data.item.compareTo(node.data.item);
            if(tempDep==head.data.item){
                node.next=head;
                head=node;
                this.size++;
            }else{
                head.findPlaceInSortedList(node);
                this.size++;
            }
        }
    }
}
