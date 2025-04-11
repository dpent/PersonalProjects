public class Node {
    TreeNode data;
    Node next=null;

    public Node(TreeNode data,Node next){
        this.data=data;
        this.next=next;
    }

    public TreeNode getData() {
        return data;
    }

    public void setData(TreeNode data) {
        this.data = data;
    }

    public Node getNext() {
        return next;
    }

    public void setNext(Node next) {
        this.next = next;
    }

    public void addNode(Node node){
        if(this.next==null){
            this.next=node;
            return;
        }else{
            this.next.addNode(node);
        }
    }

    public void removeNode(int AFM){
        if(this.next.data.item.key()==AFM){
            this.next=this.next.next;
            return;
        }else{
            this.next.removeNode(AFM);
        }
    }

    public void printNext(){
        if(this.next!=null){
            System.out.println(this.next.data.item.toString());
            this.next.printNext();
        }else{
            return;
        }
    }

    public void findPlaceInSortedList(Node node){
        LargeDepositor tempDep=this.data.item.compareTo(node.data.item);
        if(tempDep==node.data.item){
            if(this.next==null){
                this.next=node;
                return;
            }else{
                if(this.next.data.item.compareTo(node.data.item)==this.next.data.item){
                    node.next=this.next;
                    this.next=node;
                    return;
                }else{
                    this.next.findPlaceInSortedList(node);
                }
            }
        }
    }
}
