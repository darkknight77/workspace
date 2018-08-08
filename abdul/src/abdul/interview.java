package abdul;

 public class interview {
	 interview() {
		// TODO Auto-generated constructor stub
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.print("1 ");
        synchronized(args)
        {
            System.out.print("2 ");
            try 
            {
                    args.wait(); /* Line 11 */
            }
            catch(InterruptedException e){ }
        }
        System.out.print("3 ");
    
	
	}
	
}
