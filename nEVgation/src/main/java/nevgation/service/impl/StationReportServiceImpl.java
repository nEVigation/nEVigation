package nevgation.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import nevgation.dao.face.StationReportDao;
import nevgation.dto.Station_report;
import nevgation.service.face.StationReportService;

@Service
public class StationReportServiceImpl implements StationReportService {
	
	private static final Logger logger = LoggerFactory.getLogger(StationReportService.class);
	@Autowired private StationReportDao stationReportDao;

	@Override
	public void insertReport(Station_report stationReport) {
		logger.info("StationReportService");
		stationReportDao.insertReport(stationReport);
	}
}
