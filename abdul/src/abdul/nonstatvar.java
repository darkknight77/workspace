package abdul;

public class nonstatvar {

	byte b=2;
	int i=3;
	
	public void x()
	{
		System.out.println(b);
		System.out.println(i);
		
	}
	
	public static void main(String[] args) {
		
		nonstatvar nsv=new nonstatvar();
		
		
		System.out.println(nsv.b);
		System.out.println(nsv.i);
		
		
		nonstatvar nsv1=new nonstatvar();
		
		nsv1.b= 5;
		nsv1.i=10;
		
		System.out.println(nsv1.b);
		System.out.println(nsv1.i);
		
		System.out.println("nsv");
		nsv.x();
		
		System.out.println("nsv1");
		
		nsv1.x();
	}
	
}
