package latheef;

public class bubblesort {
	
	public static void main(String[] args) {
		
		int[] bs={5,8,2,6,9,2};
		
	for (int i = 0; i < bs.length-1; i++) {
		for (int j = i+1; j < bs.length; j++) {
			
		
		if(bs[i]>bs[j])
		{
			int k= bs[j];
			bs[j]=bs[i];
			bs[i]=k;
		}
		}
	}

	for (int i : bs) {
		System.out.print(i+" ");
	}
	
	}

}
