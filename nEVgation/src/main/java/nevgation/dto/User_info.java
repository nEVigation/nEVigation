package nevgation.dto;

public class User_info {
	private int user_no;
	private int charge_type_no;
	private String user_email;
	private String user_pw;
	private String user_nick;
	private String user_type;
	private String token;
	
	@Override
	public String toString() {
		return "user_info=[user_no="+user_no+", charge_type_no="+charge_type_no+", user_email="+user_email+", user_pw="+user_pw+", user_nick="+user_nick+", user_type="+user_type+", token="+token+"]";
	}

	public int getUser_no() {
		return user_no;
	}

	public int getCharge_type_no() {
		return charge_type_no;
	}

	public String getUser_email() {
		return user_email;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public String getUser_nick() {
		return user_nick;
	}

	public String getUser_type() {
		return user_type;
	}

	public String getToken() {
		return token;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public void setCharge_type_no(int charge_type_no) {
		this.charge_type_no = charge_type_no;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}

	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}

	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}

	public void setToken(String token) {
		this.token = token;
	}
}
