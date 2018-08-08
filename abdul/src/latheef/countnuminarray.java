package latheef;

import java.util.Arrays;
import java.util.Collections;

public class countnuminarray {
	static int a[] = { 101, 103, 105, 107, 101, 107, 101 };

	
	static int count = 0;
	static int i = 0;
	static int j = 0;

	static boolean flag = false;

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	
		int b[] = new int[a.length];
		for (int i = 0; i < a.length; i++) {
			b[i] = a[i];

		}

		for (i = 0; i < a.length; i++) {

			for (j = 0; j < a.length; j++) {

				if (a[i] == b[j]) {
					count++;

					
				} else {

				}

			}
try{
	if(a[i]==a[i-1]|a[i]==a[i-2]|a[i]==a[i-3]|a[i]==a[i-4]){
	count=0;
}
	else{
		System.out.println(a[i] + "-" + count);
		
		count = 0;
		
	}
}catch(ArrayIndexOutOfBoundsException ae)
{
	System.out.println(a[i] + "-" + count);
	count=0;
	}


	}

}
	}
