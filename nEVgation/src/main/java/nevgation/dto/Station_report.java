package nevgation.dto;

public class Station_report {
	private int report_no;
	private int user_no;
	private int station_no;
	private String report_title;
	private String report_content;
	private String report_date;
	private int report_check;
	
	@Override
	public String toString() {
		return "station_report=[reprot_no="+report_no+", user_no="+user_no+", station_no="+station_no+", report_title="+report_title+"report_content="+report_content+", report_date="+report_date+", report_check="+report_check+"]";
	}

	public int getReport_no() {
		return report_no;
	}

	public int getUser_no() {
		return user_no;
	}

	public int getStation_no() {
		return station_no;
	}

	public String getReport_title() {
		return report_title;
	}

	public String getReport_content() {
		return report_content;
	}

	public String getReport_date() {
		return report_date;
	}

	public int getReport_check() {
		return report_check;
	}

	public void setReport_no(int report_no) {
		this.report_no = report_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public void setStation_no(int station_no) {
		this.station_no = station_no;
	}

	public void setReport_title(String report_title) {
		this.report_title = report_title;
	}

	public void setReport_content(String report_content) {
		this.report_content = report_content;
	}

	public void setReport_date(String report_date) {
		this.report_date = report_date;
	}

	public void setReport_check(int report_check) {
		this.report_check = report_check;
	}	
}
