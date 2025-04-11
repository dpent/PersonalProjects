public class Node{
        protected String data=" ";
        protected Node next = null;
        protected Node prev=null;
        public boolean isHead=false;
        public boolean isTail=false;

    public void setNext(Node next){
        this.next=next;
    }

    public void setPrev(Node prev){
        this.prev=prev;
    }

    public Node(){
    }

    public void setData(String data) {
        this.data = data;
    }

}