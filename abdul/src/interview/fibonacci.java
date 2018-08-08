package interview;

public class fibonacci {
	static int a=0,b=1,c=0;
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
		/*first 10 Fibonacci numbers are 1, 1, 2, 3, 5, 8, 13, 21, 34, 55*/

			//System.out.print("1 1 ");
		while(c<=50)
		{
			c=a+b; //c=2 c=3
			b=a;   //b=1  b=2
			a=c;  //a=2  a=3
			System.out.print(c);
			System.out.print(" ");
		}
		
		
	}

}
