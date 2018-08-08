package beans;

import org.springframework.beans.factory.FactoryBean;

public class carFactory implements FactoryBean  {

	private String carname;
	public void setCarname(String carname) {
		this.carname = carname;
	}
	
	
	@Override
	public Object getObject() throws Exception {
		// TODO Auto-generated method stub
	car c= (car) Class.forName(carname).newInstance();	
		return c;
	}

	@Override
	public Class getObjectType() {
		// TODO Auto-generated method stub
		return car.class;
	}
    
	@Override
	public boolean isSingleton() {
		// TODO Auto-generated method stub
		return true;
	}
	
	
	
}
