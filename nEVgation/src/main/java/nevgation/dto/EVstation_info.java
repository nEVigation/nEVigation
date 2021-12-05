package nevgation.dto;

public class EVstation_info {
	private int station_no;
	private String station_name;
	private String station_loc;
	private String station_start_time;
	private String station_end_time;
	private int slow_charger;
	private int slow_charger_cnt;
	private int quick_charger;
	private int quick_charger_cnt;
	private String quick_charger_type;
	private int parking_fee;
	private String station_address;
	private double station_latitude;
	private double station_longitude;
	private int station_state;
	
	@Override
	public String toString() {
		return "EVstation_info [station_no=" + station_no + ", station_name=" + station_name + ", station_loc="
				+ station_loc + ", station_start_time=" + station_start_time + ", station_end_time=" + station_end_time
				+ ", slow_charger=" + slow_charger + ", slow_charger_cnt=" + slow_charger_cnt + ", quick_charger="
				+ quick_charger + ", quick_charger_cnt=" + quick_charger_cnt + ", quick_charger_type="
				+ quick_charger_type + ", parking_fee=" + parking_fee + ", station_address=" + station_address
				+ ", station_latitude=" + station_latitude + ", station_longitude=" + station_longitude
				+ ", station_state=" + station_state + "]";
	}
	
	public int getStation_no() {
		return station_no;
	}
	public void setStation_no(int station_no) {
		this.station_no = station_no;
	}
	public String getStation_name() {
		return station_name;
	}
	public void setStation_name(String station_name) {
		this.station_name = station_name;
	}
	public String getStation_loc() {
		return station_loc;
	}
	public void setStation_loc(String station_loc) {
		this.station_loc = station_loc;
	}
	public String getStation_start_time() {
		return station_start_time;
	}
	public void setStation_start_time(String station_start_time) {
		this.station_start_time = station_start_time;
	}
	public String getStation_end_time() {
		return station_end_time;
	}
	public void setStation_end_time(String station_end_time) {
		this.station_end_time = station_end_time;
	}
	public int getSlow_charger() {
		return slow_charger;
	}
	public void setSlow_charger(int slow_charger) {
		this.slow_charger = slow_charger;
	}
	public int getSlow_charger_cnt() {
		return slow_charger_cnt;
	}
	public void setSlow_charger_cnt(int slow_charger_cnt) {
		this.slow_charger_cnt = slow_charger_cnt;
	}
	public int getQuick_charger() {
		return quick_charger;
	}
	public void setQuick_charger(int quick_charger) {
		this.quick_charger = quick_charger;
	}
	public int getQuick_charger_cnt() {
		return quick_charger_cnt;
	}
	public void setQuick_charger_cnt(int quick_charger_cnt) {
		this.quick_charger_cnt = quick_charger_cnt;
	}
	public String getQuick_charger_type() {
		return quick_charger_type;
	}
	public void setQuick_charger_type(String quick_charger_type) {
		this.quick_charger_type = quick_charger_type;
	}
	public int getParking_fee() {
		return parking_fee;
	}
	public void setParking_fee(int parking_fee) {
		this.parking_fee = parking_fee;
	}
	public String getStation_address() {
		return station_address;
	}
	public void setStation_address(String station_address) {
		this.station_address = station_address;
	}
	public double getStation_latitude() {
		return station_latitude;
	}
	public void setStation_latitude(double station_latitude) {
		this.station_latitude = station_latitude;
	}
	public double getStation_longitude() {
		return station_longitude;
	}
	public void setStation_longitude(double station_longitude) {
		this.station_longitude = station_longitude;
	}
	public int getStation_state() {
		return station_state;
	}
	public void setStation_state(int station_state) {
		this.station_state = station_state;
	}
	
}
