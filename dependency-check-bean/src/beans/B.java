package beans;

public class B {

	private String soap;
	private String lock;
	private C c;
	
	public B(String lock) {
		this.lock=lock;
		System.out.println("B....param");
		// TODO Auto-generated constructor stub
	}

	public String getSoap() {
		return soap;
	}

	public void setSoap(String soap) {
		this.soap = soap;
	}

	public String getLock() {
		return lock;
	}

	public void setLock(String lock) {
		this.lock = lock;
	}

	public C getC() {
		return c;
	}

	public void setC(C c) {
		this.c = c;
	}
	
}
