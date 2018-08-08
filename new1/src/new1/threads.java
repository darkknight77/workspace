package new1;



public class threads {

	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
	
	//	Runnable o1 = 
		
	//	Runnable o2 =
			
			Thread t =new Thread(() -> {
				int i=0;
				for (int z = 0; z < 10; z++) {
					

					i++;
					System.out.println(i);
				}
			}
			);
		 Thread t1 =new Thread(()  ->
		{
				int x=5;
				for (int z = 0; z < 10; z++) {
					
					try {
					
						x++;
						System.out.println(x);
						Thread.sleep(5000);
					} catch (InterruptedException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			});
		t.setPriority(Thread.MAX_PRIORITY);
		t.start();
		Thread.sleep(5000);
		t1.start();
		t.join();
		t1.join();
		
		System.out.println("main");
		//System.out.println(b.x);
		
	}
	
}


