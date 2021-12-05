package nevgation.dto;

public class Station_review {
	private int review_no;
	private int station_no;
	private int user_no;
	private String review_content;
	private String review_date;
	
	@Override
	public String toString() {
		return "station_review=[review_no="+review_no+", station_no="+station_no+", user_no="+user_no
				+", review_content="+review_content+", review_date="+review_date+"]";
	}

	public int getReview_no() {
		return review_no;
	}

	public int getStation_no() {
		return station_no;
	}

	public int getUser_no() {
		return user_no;
	}

	public String getReview_content() {
		return review_content;
	}

	public String getReview_date() {
		return review_date;
	}

	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}

	public void setStation_no(int station_no) {
		this.station_no = station_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public void setReview_date(String review_Date) {
		this.review_date = review_Date;
	}
}
