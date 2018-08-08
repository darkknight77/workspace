package latheef;

public class shit {
	static int a[]={101,103,105,107,101,107,101};
	static	int count=1;
	static int size=1;
	public static void main(String[] args) {
		// TODO Auto-generated method stub


		for (int i = 0; i < a.length; i++) {
		       
			for (int j = 0; j < a.length-1; j++) {
			
				if(a[i]==a[j+1])
			{
				count++;
			}
			
				else
			{
				size++;
				
			}
				
		}
			
		System.out.println(a[i]+"-"+count);
		count=1;
		//System.out.println(size);
		}
		
		
		
	}

}
