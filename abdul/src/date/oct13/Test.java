package date.oct13;

public class Test {

	int i = 5;
	
	Test()
	{
		
		System.out.println("constructor");
	}
	Test(int i)
	{
		this();
		System.out.println("constructor");
	}
	private void t() {
		// TODO Auto-generated method stub
		System.out.println("t");
		this.exp();
	}

	private void exp() {
		// TODO Auto-generated method stub
		
		System.out.println(this.i);
		
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Test t = new Test();
		Test t1 = new Test();
		
		t.t();
		t.exp();

	}

}
