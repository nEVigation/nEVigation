package member.dto;

public class User {
	private int userNo; //	NUMBER	NOT NULL,
	private int chargeTypeNo; //	NUMBER	NOT NULL,
	private String userEmail; //	VARCHAR2(50)	NULL,
	private String userPw; //	VARCHAR2(20)	NULL,
	private String userNick; //	VARCHAR2(20)	NULL,
	private String userType; //	VARCHAR2(10)	NULL,
	private String token; //	VARCHAR2(50)	NULL
	@Override
	public String toString() {
		return "User [userNo=" + userNo + ", chargeTypeNo=" + chargeTypeNo + ", userEmail=" + userEmail + ", userPw="
				+ userPw + ", userNick=" + userNick + ", userType=" + userType + ", token=" + token + "]";
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getChargeTypeNo() {
		return chargeTypeNo;
	}
	public void setChargeTypeNo(int chargeTypeNo) {
		this.chargeTypeNo = chargeTypeNo;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserNick() {
		return userNick;
	}
	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	
	
}
