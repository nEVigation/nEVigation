package nevgation.dto;

public class Car_info {
	private int charge_type_no;
	private String charge_type;
	
	@Override
	public String toString() {
		return "car_info=[charge_type_no="+charge_type+", charge_type=" +charge_type +"]";
	}

	public int getCharge_type_no() {
		return charge_type_no;
	}

	public String getCharge_type() {
		return charge_type;
	}

	public void setCharge_type_no(int charge_type_no) {
		this.charge_type_no = charge_type_no;
	}

	public void setCharge_type(String charge_type) {
		this.charge_type = charge_type;
	}

}
