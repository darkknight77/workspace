package abdul;

public class duplicateNumCount {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int[] a = { 1, 14, 78, 13, 78, 24, 31, 45, 56, 67, 78, 56 };
		System.out.println("Duplicates: ");
		for (int i = 0; i < a.length; i++) {
			int t = 1;
			for (int j = i + 1; j < a.length; j++) {

				if (a[i] == a[j]) {
                  t++;
				}
				
			}
			System.out.println(a[i] + " - " + t);
		}
	}

}
