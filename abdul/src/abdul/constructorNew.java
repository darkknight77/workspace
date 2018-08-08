package abdul;

public class constructorNew {

	
	  int id;  
	    String name;  
	    constructorNew(int i,String n){  
	    id = i;  
	    name = n;  
	    }  
	      
	    constructorNew(constructorNew s){  
	    id = s.id;  
	    name =s.name;  
	    }  
	    void display(){System.out.println(id+" "+name);}  
	   
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		constructorNew s1 = new constructorNew(111,"Karan");  
		   constructorNew s2 = new constructorNew(s1);  
		    s1.display();  
		    s2.display();  
		
	}

}
