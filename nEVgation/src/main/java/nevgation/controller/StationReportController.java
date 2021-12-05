package nevgation.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import nevgation.dto.EVstation_info;
//import nevgation.service.face.StationReportService;
import nevgation.dto.Station_report;
import nevgation.service.face.StationReportService;

@Controller
public class StationReportController {
	private static final Logger logger = LoggerFactory.getLogger(StationReportController.class);
	
	@Autowired private StationReportService stationReportService;
	
	//주유소 제보
	@RequestMapping(value="/map/report", method = RequestMethod.GET)
	public String stationReport(EVstation_info station, Model model) {
		logger.info("/map/report [GET]");
		logger.info("{}", station.getStation_no());
		
		//개발용(원래는 stationReport에 번호와 이름이 들어가 있어야함)
		station.setStation_no(1201);
		station.setStation_name("이편한세상 반월나노시티역아파트 입주자대표회의");
		
		model.addAttribute("stationInfo", station);
		return "map/stationReport";
	}
	
	//주유소 제보
		@RequestMapping(value="/map/report", method = RequestMethod.POST)
		public String stationReportProc(Station_report stationReport) {
			logger.info("/map/report [POST]");
			logger.info("{}", stationReport);
			
			stationReportService.insertReport(stationReport);
			return "redirect:/map/report";
		}
}
