import java.util.NoSuchElementException;
import java.io.*;


class StringDoubleEndedQueueImpl implements StringDoubleEndedQueue {
       
    public StringDoubleEndedQueueImpl() {
    }

    public Node head = new Node();
    public Node tail = new Node();
    int sizeCounter=0;
    public boolean isEmpty(){
        return(sizeCounter==0);
    }

    public int size(){
        return sizeCounter;
    }

    public void setHead(Node head) {
        this.head = head;
    }

    public void setTail(Node tail) {
        this.tail = tail;
    }

    public void addFirst(String item){
        Node nodeFirst=new Node();
        if(sizeCounter==0){
            nodeFirst.isTail=true;
            setTail(nodeFirst);
        }else{
            nodeFirst.prev=head;
            head.next=nodeFirst;
            head.isHead=false;
        }
        if(sizeCounter==1){
            head.prev=tail;
        }
        nodeFirst.data=item;
        nodeFirst.isHead=true;
        sizeCounter++;
        setHead(nodeFirst);
    }
    
    public void addLast(String item){
        Node nodeLast=new Node();
        if(sizeCounter==0){
            nodeLast.isHead=true;
            setHead(nodeLast);
        }else{
            nodeLast.next=tail;
            tail.prev=nodeLast;
            tail.isTail=false;
        }
        if(sizeCounter==1){
            tail.next=head;
        }
        nodeLast.data=item;
        nodeLast.isTail=true;
        sizeCounter++;
        setTail(nodeLast);
    }

    public String getFirst() {
        return head.data;
    }

    public String getLast() {
        return tail.data;
    }

    public String removeFirst() throws NoSuchElementException{
            if(sizeCounter==0){
                throw new NoSuchElementException();
            }
            String data=head.data;
            setHead(head.prev);
            if(sizeCounter>1){
                head.next=null;
            }
            sizeCounter--;
            return data;
    }

    public String removeLast() throws NoSuchElementException{
        if(sizeCounter==0){
            throw new NoSuchElementException();
        }
        String data=tail.data;
        setTail(tail.next);
        if(sizeCounter>1){
            tail.prev=null;
        }
        sizeCounter--;
        return data;
    }

    public void printQueue(PrintStream stream){
        String finalStr="";
        Node currNode=head;
        for(int i=0;i<sizeCounter;i++){
            finalStr=finalStr+currNode.data;
            currNode=currNode.prev;
        }
        stream.println(finalStr);
    }
}