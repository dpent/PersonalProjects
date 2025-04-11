class TreeNode {
    LargeDepositor item;
    TreeNode left; // pointer to left subtree
    TreeNode right; // pointer to right subtree
    int N; //number of nodes in the subtree rooted at this TreeNode
    TreeNode parent;
    
    public TreeNode(LargeDepositor item, TreeNode left, TreeNode right, TreeNode parent){
        this.item = item;
        this.left = left;
        this.right = right;
        this.parent=parent;
    }

    public TreeNode compareAndPlace(LargeDepositor item){
        TreeNode result=null;
        if (this.left != null && this.right !=null){
            if (left.item.key()==item.key() || right.item.key() == item.key()){
                return result;
            }
        }
        if(Math.random()*(this.N+1)<1.0){
            result=placeInSubTreeRoot(this,item);
        }else{
            if(item.key()>this.item.key()){
                if(this.right==null){ 
                    this.right=new TreeNode(item, null, null, this);
                    result=this.right;
                    result.calculateNOfEveryoneAbove();
                }else{
                    result=this.right.compareAndPlace(item);
                }
            }else if(item.key()<this.item.key()){
                if(this.left==null){
                    this.left=new TreeNode(item, null, null, this);
                    result=this.left;
                    result.calculateNOfEveryoneAbove();
                }else{
                    result=this.left.compareAndPlace(item);
                }
            }   
        }
        return result;
    }

    public LargeDepositor findDepositor(int AFM){
        LargeDepositor result=null;
        if(this.item.key()==AFM){
            result=this.item;
            return this.item;
        }else if(AFM>this.item.key()){
            if(this.right!=null){
                right.findDepositor(AFM);
            }else{
                return null;
            }
        }else if(AFM<this.item.key()){
            if(this.left!=null){
                left.findDepositor(AFM);
            }else{
                return null;
            }
        }
        return result;
    }

    public TreeNode findTreeNode(int AFM){
        TreeNode result=null;
        if(this.item.key()==AFM){
            result=this;
            return result;
        }else if(AFM>this.item.key()){
            if(this.right!=null){
                result=right.findTreeNode(AFM);
                return result;
            }else{
                return null;
            }
        }else if(AFM<this.item.key()){
            if(this.left!=null){
                result=left.findTreeNode(AFM);
                return result;
            }else{
                return null;
            }
        }
        return result;
    }

    public TreeNode joinNodes(TreeNode a,TreeNode b){
        int N=a.N+b.N;
        if(Math.random()*N<1.0*a.N){
            if(a.right==null){
                return b;
            }
            a.right=joinNodes(a.right, b);
            return a;
        }else{
            if(b.left==null){
                return a;
            }
            b.left=joinNodes(a, b.left);
            return b;
        }
    }

    public TreeNode findLeavesAndPlace(TreeNode node){
        TreeNode result=null;
        if(node.item.key()>this.item.key()){
            if(this.right!=null){
                this.right.findLeavesAndPlace(node);
            }else{
                this.right=node;
                result=node;
                return result;
            }
        }else if(node.item.key()<this.item.key()){
            if(this.left!=null){
                this.left.findLeavesAndPlace(node);
            }else{
                this.left=node;
                result=node;
                return result;
            }
        }
        return result;
    }

    public TreeNode placeInSubTreeRoot(TreeNode root,LargeDepositor item){
        TreeNode newNode=null;
        if(item.key()>this.item.key()){
            if(this.right==null){
                this.right=new TreeNode(item, null, null, this);
                newNode=this.right;
            }else{
                newNode=this.right.placeInSubTreeRoot(root,item);
            }
        }else if(item.key()<this.item.key()){
            if(this.left==null){
                this.left=new TreeNode(item, null, null, this);
                newNode=this.left;
            }else{
                newNode=this.left.placeInSubTreeRoot(root,item);
            }
        }
        if(newNode!=null){
            newNode.rotate(root);
        }
        return newNode;
        }

    public void calculateN(){
        if(this.right!=null && this.left!=null){
            this.N=this.right.N+this.left.N+2;
        }else if(this.right!=null){
            this.N=this.right.N+1;
        }else if(this.left!=null){
            this.N=this.left.N+1;
        }else{
            this.N=0;
        }
        return; 
    }

    public void calculateNOfEveryoneAbove(){
        this.calculateN();
        if(this.parent!=null){
            this.parent.calculateNOfEveryoneAbove();
        }else{
            return;
        }
    }

    public void rotate(TreeNode root){
        if(parent==null){
            return;
        }
        TreeNode thisParent=this.parent;
        if(this.item.key()>thisParent.item.key()){
            this.rotateLeft(thisParent);
        }else if(this.item.key()<thisParent.item.key()){
            this.rotateRight(thisParent);
        }
        if(this.left==root || this.right==root){
            if(this.parent!=null){
                this.parent.calculateNOfEveryoneAbove();
            }
            return;
        }else{
            this.rotate(root);
        }
    }

    public void rotateLeft(TreeNode thisParent){
        TreeNode temp=this.left;
        this.left=thisParent;
        thisParent.right=temp;
        if(this.parent.right!=null){
            thisParent.right.parent=thisParent;
        }
        thisParent.calculateN();
        this.calculateN();
        this.parent=thisParent.parent; 
        thisParent.parent=this;
        if(this.parent!=null){
            if(this.parent.right==this.left){
                this.parent.right=this;
            }else if(this.parent.left==this.left){
                this.parent.left=this;
            }
        } 
    }

    public void rotateRight(TreeNode thisParent){
        TreeNode temp=this.right;
        this.right=thisParent;
        thisParent.left=temp;
        if(this.parent.left!=null){
            thisParent.left.parent=thisParent;
        }    
        thisParent.calculateN();
        this.calculateN();
        this.parent=thisParent.parent;
        thisParent.parent=this;
        if(this.parent!=null){
            if(this.parent.right==this.right){
                this.parent.right=this;
            }else if(this.parent.left==this.right){
                this.parent.left=this;
            }
        }
    }

    public DepositorList searchNextNode(DepositorList listaDep,String last_name){
        if(this.item.getLastName().equals(last_name)){
            listaDep.addNode(new Node(this, null));
        }
        if(this.right!=null){
            listaDep=this.right.searchNextNode(listaDep, last_name);
        }
        if(this.left!=null){
            listaDep=this.left.searchNextNode(listaDep, last_name);
        }
        return listaDep;
    }

    public DepositorList getTopLargeDepositors(DepositorList listaDep,int k){
        if(listaDep.size<k){
            listaDep.placeSorted(new Node(this, null));
        }else{
            Node tempNode=new Node(this, null);
            LargeDepositor result=tempNode.data.item.compareTo(listaDep.head.data.item);
            if(result==tempNode.data.item){
                listaDep.head=listaDep.head.next;
                listaDep.placeSorted(tempNode);
            }
        }
        if(this.right!=null){
            listaDep=this.right.getTopLargeDepositors(listaDep, k);
        }
        if(this.left!=null){
                listaDep=this.left.getTopLargeDepositors(listaDep, k);
            }else{
                return listaDep;
            }
        return listaDep;
    }

    public void printAllNodes(){
        if(this.left!=null){
            this.left.printAllNodes();
        }
        System.out.println(this.item.toString());
        if(this.right==null){
            return;
        }else{
            this.right.printAllNodes();
            return;
        }
    }
}