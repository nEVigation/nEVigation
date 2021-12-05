package nevgation.dto;

public class EVstation_info {
	private int station_no;
	private String station_name;
	private String station_loc;	//상세 주소
	private String station_start_time;
	private String station_end_time;
	private int slow_charger;	//완속 충전기
	private int slow_charger_cnt;	//완속 충전기 개수
	private int quick_charger;	//고속충전기
	private int quick_charger_cnt;	//고속충전기 개수
	private String quick_charger_type;	//충전기 타입
	private int parking_fee;
	private String station_address;	//대략적인 주소
	private int station_latitude;	//위도
	private int station_longitude;	//경도
	private int station_state;	//충전소 운영여부
	
	@Override
	public String toString() {
		return "EVstation_info=[station_no="+station_no+", station_name="+station_name+", station_loc="+station_loc+", "
				+ "station_start_time="+station_start_time+", station_end_time="+station_end_time+", slow_charger="+slow_charger
				+", slow_charger_cnt="+slow_charger_cnt+", quick_charger="+quick_charger+", quick_charger_cnt="+quick_charger_cnt
				+", quick_charger_type="+quick_charger_type+", parking_fee="+parking_fee+", station_address="+station_address
				+", staiont_latitude="+station_latitude+", station_longitue="+station_longitude+", station_state="+station_state+"]";
	}

	public int getStation_no() {
		return station_no;
	}

	public String getStation_name() {
		return station_name;
	}

	public String getStation_loc() {
		return station_loc;
	}

	public String getStation_start_time() {
		return station_start_time;
	}

	public String getStation_end_time() {
		return station_end_time;
	}

	public int getSlow_charger() {
		return slow_charger;
	}

	public int getSlow_charger_cnt() {
		return slow_charger_cnt;
	}

	public int getQuick_charger() {
		return quick_charger;
	}

	public int getQuick_charger_cnt() {
		return quick_charger_cnt;
	}

	public String getQuick_charger_type() {
		return quick_charger_type;
	}

	public int getParking_fee() {
		return parking_fee;
	}

	public String getStation_address() {
		return station_address;
	}

	public int getStation_latitude() {
		return station_latitude;
	}

	public int getstation_longitude() {
		return station_longitude;
	}

	public int getStation_state() {
		return station_state;
	}

	public void setStation_no(int station_no) {
		this.station_no = station_no;
	}

	public void setStation_name(String station_name) {
		this.station_name = station_name;
	}

	public void setStation_loc(String station_loc) {
		this.station_loc = station_loc;
	}

	public void setStation_start_time(String station_start_time) {
		this.station_start_time = station_start_time;
	}

	public void setStation_end_time(String station_end_time) {
		this.station_end_time = station_end_time;
	}

	public void setSlow_charger(int slow_charger) {
		this.slow_charger = slow_charger;
	}

	public void setSlow_charger_cnt(int slow_charger_cnt) {
		this.slow_charger_cnt = slow_charger_cnt;
	}

	public void setQuick_charger(int quick_charger) {
		this.quick_charger = quick_charger;
	}

	public void setQuick_charger_cnt(int quick_charger_cnt) {
		this.quick_charger_cnt = quick_charger_cnt;
	}

	public void setQuick_charger_type(String quick_charger_type) {
		this.quick_charger_type = quick_charger_type;
	}

	public void setParking_fee(int parking_fee) {
		this.parking_fee = parking_fee;
	}

	public void setStation_address(String station_address) {
		this.station_address = station_address;
	}

	public void setStation_latitude(int station_latitude) {
		this.station_latitude = station_latitude;
	}

	public void setstation_longitude(int station_longitude) {
		this.station_longitude = station_longitude;
	}

	public void setStation_state(int sation_state) {
		this.station_state = sation_state;
	}
}
