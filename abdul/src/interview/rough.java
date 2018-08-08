package interview;

public class rough {

public static void main(String[] args) {
	int s=5,a=1;
    for (int i = 1; i <=5 ; i++) {
        for (int j = 1; j <s ; j++) {
            System.out.print(" ");
        }
        for (int k = 1; k <a ; k++) {
            System.out.print("* ");
        }
        System.out.println();
        a++;
        s--;
    }

	
}

}
