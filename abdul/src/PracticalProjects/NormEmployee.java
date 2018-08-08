package PracticalProjects;

public class NormEmployee extends Employees
{
	private int rank;
    private String speciality;

    
    
    public NormEmployee(int id, String name, String address, String mobileNumber, String email, double salary, int rank,
		String speciality) {
	super(id, name, address, mobileNumber, email, salary);
	this.rank = rank;
	this.speciality = speciality;
}

    
    
	@Override
	public String toString() {
		return String.format("NormEmployee [rank=%s, speciality=%s]", rank, speciality);
	}



	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}

	public String getSpeciality() {
		return speciality;
	}

	public void setSpeciality(String speciality) {
		this.speciality = speciality;
	}

	

}
