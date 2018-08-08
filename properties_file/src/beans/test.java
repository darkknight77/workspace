package beans;

import java.util.Properties;
import java.util.Set;

public class test {

	private Properties Driver;

	public Properties getDriver() {
		return Driver;
	}

	public void setDriver(Properties driver) {
		Driver = driver;
	}
	
	
	public void printdata()
	{
		Set keys=Driver.keySet();
		for(Object key:keys)
		{
			System.out.println(key+" "+Driver.getProperty((String) key));
			
		}
	}
	
}
