package nevigation.dto;

public class Station_Dec {
	
	private int dec_no;
	private int user_no;
	private int station_no;
	private String dec_type;
	private String dec_date;
	
	
	@Override
	public String toString() {
		return "Map [dec_no=" + dec_no + ", user_no=" + user_no + ", station_no=" + station_no + ", dec_type="
				+ dec_type + ", dec_date=" + dec_date + "]";
	}
	
	public int getDec_no() {
		return dec_no;
	}
	public void setDec_no(int dec_no) {
		this.dec_no = dec_no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public int getStation_no() {
		return station_no;
	}
	public void setStation_no(int station_no) {
		this.station_no = station_no;
	}
	public String getDec_type() {
		return dec_type;
	}
	public void setDec_type(String dec_type) {
		this.dec_type = dec_type;
	}
	public String getDec_date() {
		return dec_date;
	}
	public void setDec_date(String dec_date) {
		this.dec_date = dec_date;
	}
	
	
	
}
