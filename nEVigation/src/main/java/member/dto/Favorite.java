package member.dto;

public class Favorite {
	private int favorite_no;
	private int user_no;
	private int station_no;
	private String station_name;
	private String station_loc;
	private float station_latitude; 
	private float station_longitude;
	@Override
	public String toString() {
		return "Favorite [favorite_no=" + favorite_no + ", user_no=" + user_no + ", station_no=" + station_no
				+ ", station_name=" + station_name + ", station_loc=" + station_loc + ", station_latitude="
				+ station_latitude + ", station_longitude=" + station_longitude + "]";
	}
	public int getFavorite_no() {
		return favorite_no;
	}
	public void setFavorite_no(int favorite_no) {
		this.favorite_no = favorite_no;
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
	public float getStation_latitude() {
		return station_latitude;
	}
	public void setStation_latitude(float station_latitude) {
		this.station_latitude = station_latitude;
	}
	public float getStation_longitude() {
		return station_longitude;
	}
	public void setStation_longitude(float station_longitude) {
		this.station_longitude = station_longitude;
	}
	
	 
}
