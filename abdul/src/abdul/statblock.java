package abdul;

public class statblock {

	static int x;
	static String y;
	float f;;
	
	static{
		System.out.println("static");
		x=10;
	y="damn";	
	int z=101;	
	}
	
	{
		System.out.println("non-static");
		x=100;
	y="damnit";	
	f=0.3f;
	
	int c=1;
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		statblock sb= new statblock();
		System.out.println(x);
		System.out.println(y);
		
		System.out.println(sb.x);
		System.out.println(sb.y);
		
		
	//	System.out.println(z);
		//System.out.println(c);
		
		
		
	}

}
