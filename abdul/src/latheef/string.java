package latheef;

import java.util.Scanner;

public class string {
	public static final String s1 = "interview";
	public static String s2;
	public static String s3;

	public static void reverse(String str) {
		char c[] = s2.toCharArray();
		for (int i = s2.length() - 1; i >= 0; --i) {

			System.out.print(c[i]);

		}

	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Scanner sc = new Scanner(System.in);
		s2 = sc.nextLine();

		if (s1.length() == s2.length()) {

			reverse(s2);

		}

	}

}
