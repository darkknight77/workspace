package beans;

public class A {

	private String toothpaste;
	private String brush;
    private B b;	
	
	public A() {
		System.out.println("A....");
		// TODO Auto-generated constructor stub
	}


	public String getToothpaste() {
		return toothpaste;
	}


	public void setToothpaste(String toothpaste) {
		this.toothpaste = toothpaste;
	}


	public String getBrush() {
		return brush;
	}


	public void setBrush(String brush) {
		this.brush = brush;
	}

	public B getB() {
		return b;
	}


	public void setB(B b) {
		this.b = b;
	}


	public void print() {
		
		System.out.println(getBrush());
		System.out.println(getToothpaste());
		System.out.println(getB().getSoap());
		System.out.println(b.getLock());
		// TODO Auto-generated method stub

	}
	
}
