package nevgation.service.face;

import nevgation.dto.Station_report;

public interface StationReportService {
	
	/**
	 * 주유소 제보 게시물 추가
	 * @param stationReport - 추가할 게시물 정보가 담긴 객체
	 */
	public void insertReport(Station_report stationReport);
}
