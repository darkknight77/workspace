package generics;

public class car {
	
	String carModel;
	int modelYear;
	public String getCarModel() {
		return carModel;
	}
	public void setCarModel(String carModel) {
		this.carModel = carModel;
	}
	public int getModelYear() {
		return modelYear;
	}
	public void setModelYear(int modelYear) {
		this.modelYear = modelYear;
	}
	@Override
	public String toString() {
		return String.format("car [carModel=%s, modelYear=%s]", carModel, modelYear);
	}
	
	

}
