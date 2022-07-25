package manager;

public class ManagerDTO {
	String managerID;
	String managerPassword;
	String managerName;
	

	
	public String getManagerID() {
		return managerID;
	}



	public void setManagerID(String managerID) {
		this.managerID = managerID;
	}



	public String getManagerPassword() {
		return managerPassword;
	}



	public void setManagerPassword(String managerPassword) {
		this.managerPassword = managerPassword;
	}



	public String getManagerName() {
		return managerName;
	}



	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}



	public ManagerDTO(String managerID, String managerPassword, String managerName) {
		super();
		this.managerID = managerID;
		this.managerPassword = managerPassword;
		this.managerName = managerName;
	}



	public ManagerDTO() {
		
	}

}
