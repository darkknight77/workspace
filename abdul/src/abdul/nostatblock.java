package abdul;

public class nostatblock {

	private static int x;
	public nostatblock() {
		x=100;
		// TODO Auto-generated constructor stub
	System.out.println("No arg constructor  "+this.x);
	}
	{
		System.out.println("first instance block  "+this.x);
	}
	
	static{
		System.out.println("Static block");
			
	}
	
	{
		System.out.println("second instance block  "+this.x);
		
	}
	public nostatblock(int i) {
		// TODO Auto-generated constructor stub
		System.out.println(" Argumented constructor  "+this.x);
		
	}
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		new nostatblock();
		new nostatblock();
		new nostatblock(2);

	}

}
