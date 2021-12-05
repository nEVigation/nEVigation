package nevgation.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import nevgation.dto.Car_info;
import nevgation.dto.EVstation_info;
import nevgation.dto.Station_Dec;
import nevgation.dto.Station_report;
import nevgation.dto.Station_review;
import nevgation.dto.User_info;
import nevgation.service.face.AdminService;
import nevgation.util.Paging;


@Controller
@RequestMapping(value="/admin")
public class adminController {
	
	private static final Logger logger = LoggerFactory.getLogger(adminController.class);
	
	@Autowired private AdminService adminService;
	
	@RequestMapping(value="/userInfoList")
	public void userInfoList(Paging paramData, Model model) {
		logger.info("/admin/userInfoList");
		
		//페이징 계산
		Paging paging = adminService.getPaging("User_info", paramData );
		logger.info("{}", paging);
		
		List<User_info> userList = adminService.userInfoList(paging);
		for(User_info u : userList) {
			logger.info("{}", u);
		}
		
		model.addAttribute("currentPage", "userInfo");
		model.addAttribute("paging", paging);
		model.addAttribute("list", userList);
	}
	
	@RequestMapping(value="/userInfo")
	public String userInfo(User_info userInfo, Model model, HttpSession session) {
		logger.info("/admin/userInfo 파라미터 {}", userInfo);
		
		if( userInfo.getUser_no() < 1 ) {
			return "redirect:/admin/userInfoList";
		}
		
		userInfo = adminService.view(userInfo);
		logger.info("/admin/userInfo 상세보기 {}", userInfo);
		
		String chargeType = adminService.selectChargeType(userInfo);
		
		//모델값 전달
		model.addAttribute("currentPage", "userInfo");
		model.addAttribute("chargeType", chargeType);
		model.addAttribute("viewBoard", userInfo);
		
		return "admin/userInfo";
		
	}
	
	@RequestMapping(value="/userDelete")
	public String userDelete(User_info userInfo) {
		logger.info("/admin/userDelete 파라미터 {}");
		
		if( userInfo.getUser_no() > 1 ) {
			adminService.deleteUser(userInfo);
		}
		
		return "redirect: /admin/userInfoList";
	}
	
	@RequestMapping(value="/userBlock")
	public String userBlock(User_info userInfo) {
		logger.info("/admin/userBlock 파라미터 {}");
		
		if( userInfo.getUser_no() < 1 ) {
			return "redirect:/admin/userInfoList";
		}
		
		adminService.blockUser(userInfo);
		return "admin/alertUpdate";
	}
	
	@RequestMapping(value="/userUnblock")
	public String userUnlock(User_info userInfo) {
		logger.info("/admin/userBlock 파라미터 {}");
		
		if( userInfo.getUser_no() < 1 ) {
			return "redirect:/admin/userInfoList";
		}
		
		adminService.unblockUser(userInfo);
		return "admin/alertUpdate";
	}
	
	@RequestMapping(value="/EVstationInfoList")
	public void EVstationInfoList(Paging paramData, Model model) {
		logger.info("/admin/EVstationInfoList");
		
		//페이징 계산
		Paging paging = adminService.getPaging("EVstationInfoList", paramData );
		logger.info("{}", paging);
		
		List<EVstation_info> EVstationList = adminService.EVstationInfoList(paging);
		for(EVstation_info e : EVstationList) {
			logger.info("{}", e);
		}
		
		model.addAttribute("currentPage", "EVstationInfo");
		model.addAttribute("paging", paging);
		model.addAttribute("list", EVstationList);
		
	}
	
	@RequestMapping(value="/EVstationInfo")
	public String EVstationInfo(EVstation_info evstationInfo, Model model, HttpSession session) {
		logger.info("/admin/EVstationInfo 파라미터 {}", evstationInfo);
		
		if( evstationInfo.getStation_no() < 1 ) {
			return "redirect:/admin/EVstationInfoList";
		}
		
		evstationInfo = adminService.viewEVstation(evstationInfo);
		logger.info("/admin/EVstationInfo 상세보기 {}", evstationInfo);
		
		String chargerType = evstationInfo.getQuick_charger_type();
		chargerType = chargerType.replace("+", ", ");
		evstationInfo.setQuick_charger_type(chargerType);
		
		//모델값 전달
		model.addAttribute("currentPage", "EVstationInfo");
		model.addAttribute("viewBoard", evstationInfo);
		
		return "admin/EVstationInfo";
	}
	
	@RequestMapping(value="/stationActivation")
	public String stationActivation(EVstation_info evstationInfo) {
		logger.info("/admin/stationActivation");
		logger.info("{}", evstationInfo.getStation_no());
		
		if( evstationInfo.getStation_no() > 1 ) {
			adminService.activationStation(evstationInfo);
		}
		return "admin/alertUpdate";
	}
	
	@RequestMapping(value="/statioDisabled")
	public String stationDisabled(EVstation_info evstationInfo) {
		logger.info("/admin/decDisabled");
		logger.info("{}", evstationInfo.getStation_no());
		
		Station_Dec stationDec = new Station_Dec();
		stationDec.setStation_no(evstationInfo.getStation_no());
		if( stationDec.getStation_no() > 1 ) {
			adminService.disabledStation(stationDec);
		}
		return "admin/alertUpdate";
	}
	
	@RequestMapping(value="/stationDelete")
	public String stationDelete(EVstation_info evstationInfo) {
		logger.info("/admin/stationDelete");
//		logger.info("{}", evstationInfo.getStation_no());
		
		adminService.deleteStation(evstationInfo);
		
		return "redirect:/admin/EVstationInfoList";
	}
	
	@RequestMapping(value="/updateStation", method=RequestMethod.GET)
	public String stationUpdate(EVstation_info evstationInfo, Model model) {
		logger.info("/admin/updateStation");
		logger.info("{}", evstationInfo.getStation_no());
		
		if( evstationInfo.getStation_no() < 1 ) {
			return "redirect:/admin/EVstationInfoList";
		}
		
		evstationInfo = adminService.viewEVstation(evstationInfo);
		logger.info("/admin/EVstationInfo 상세보기 {}", evstationInfo);
		
		List<Car_info> carInfoList = adminService.selectCarInfo();
		for(Car_info c : carInfoList) {
			logger.info("{}", c);
		}
		
		//모델값 전달
		model.addAttribute("currentPage", "EVstationInfo");
		model.addAttribute("viewBoard", evstationInfo);
		model.addAttribute("list", carInfoList);
		
		return "admin/EVstationUpdate";
	}
	
	@RequestMapping(value="/updateStation", method=RequestMethod.POST)
	public String stationUpdateProc(EVstation_info station, @RequestParam HashMap<String, Object> cntMap,HttpServletRequest req) {
		logger.info("/admin/updateStation");
		station.setStation_start_time((String) req.getParameter("stationStartTime"));
		station.setStation_end_time((String) req.getParameter("stationEndTime"));
		
		if(req.getParameter("slowCharger") == null) {
			station.setSlow_charger(0);
			station.setSlow_charger_cnt(0);
		}else {
			if(req.getParameter("slowCharger").contentEquals("slowOn")) {
				station.setSlow_charger(1);
				int slowCnt = Integer.parseInt(req.getParameter("slowChargerCnt"));
				station.setSlow_charger_cnt(slowCnt);
			}
		}
		if(req.getParameter("quickCharger") == null) {
			station.setQuick_charger(0);
			station.setQuick_charger_cnt(0);
		}else {
			if(req.getParameter("quickCharger").contentEquals("fastOn")) {
				station.setQuick_charger(1);
				int quickCnt = Integer.parseInt(req.getParameter("quickChargerCnt"));
				station.setQuick_charger_cnt(quickCnt);
			}
		}
		
		String cnt = cntMap.get("arrayParam").toString();
		cnt = cnt.replace(",", "+");
		logger.info("{}",cnt);
		station.setQuick_charger_type(cnt);
		
		if(req.getParameter("parkingFeeExist") == null) {
			station.setParking_fee(0);
		}else {
			if(req.getParameter("parkingFeeExist").contentEquals("parkOn")) {
				station.setParking_fee(1);
			}
		}
		station.setStation_state(1);

		logger.info("{}", station);
		adminService.updateStation(station);
		
		return "redirect: /admin/EVstationInfo?station_no="+station.getStation_no();
	}
	
	@RequestMapping(value="/EVstationAdd", method = RequestMethod.GET)
	public void stationAdd(Model model) {
		logger.info("/admin/EVstationAdd");
		
		List<Car_info> carInfoList = adminService.selectCarInfo();
		for(Car_info c : carInfoList) {
			logger.info("{}", c);
		}
		
		model.addAttribute("currentPage", "stationAdd");
		model.addAttribute("list", carInfoList);
	}
	
	@RequestMapping(value="/EVstationAdd", method = RequestMethod.POST)
	public String stationAddProc(EVstation_info station, @RequestParam HashMap<String, Object> cntMap,HttpServletRequest req) {
		
		station.setStation_start_time((String) req.getParameter("stationStartTime"));
		station.setStation_end_time((String) req.getParameter("stationEndTime"));
		
		if(req.getParameter("slowCharger") == null) {
			station.setSlow_charger(0);
			station.setSlow_charger_cnt(0);
		}else {
			if(req.getParameter("slowCharger").contentEquals("slowOn")) {
				station.setSlow_charger(1);
				int slowCnt = Integer.parseInt(req.getParameter("slowChargerCnt"));
				station.setSlow_charger_cnt(slowCnt);
			}
		}
		if(req.getParameter("quickCharger") == null) {
			station.setQuick_charger(0);
			station.setQuick_charger_cnt(0);
		}else {
			if(req.getParameter("quickCharger").contentEquals("fastOn")) {
				station.setQuick_charger(1);
				int quickCnt = Integer.parseInt(req.getParameter("quickChargerCnt"));
				station.setQuick_charger_cnt(quickCnt);
			}
		}
		
		String cnt = cntMap.get("arrayParam").toString();
		cnt = cnt.replace(",", "+");
		logger.info("{}",cnt);
		station.setQuick_charger_type(cnt);
		
		if(req.getParameter("parkingFeeExist") == null) {
			station.setParking_fee(0);
		}else {
			if(req.getParameter("parkingFeeExist").contentEquals("parkOn")) {
				station.setParking_fee(1);
			}
		}
		station.setStation_state(1);

		logger.info("{}", station);
		
		adminService.addEVstation(station);
		return "redirect: /admin/EVstationInfoList";
	}
	
	@RequestMapping(value="/stationReportList")
	public void stationReportList(Paging paramData, Model model) {
		logger.info("/admin/stationReportList");
		
		//페이징 계산
		Paging paging = adminService.getPaging("stationReportList", paramData );
		logger.info("{}", paging);
		
		List<Station_report> stationReportList = adminService.stationReportList(paging);
		for(Station_report r : stationReportList) {
			logger.info("{}", r);
		}
		
		model.addAttribute("currentPage", "stationReport");
		model.addAttribute("paging", paging);
		model.addAttribute("list", stationReportList);
		
	}
	
	@RequestMapping(value="/stationReport")
	public String stationReport(Station_report stationReport, Model model, HttpSession session) {
		logger.info("/admin/stationReport 파라미터 {}", stationReport);
		
		if( stationReport.getReport_no() < 1 ) {
			return "redirect:/admin/stationReportList";
		}
		
		stationReport = adminService.viewstationReport(stationReport);
		logger.info("/admin/stationReport 상세보기 {}", stationReport);
		
		if(stationReport.getReport_check() == 0) {
			stationReport.setReport_check(1);
			adminService.checkReport(stationReport.getReport_no());
		}
		
		String userNick = adminService.selectNickByUserNo(stationReport.getUser_no());
		String stationName = adminService.selectStationNameByStationNo(stationReport.getStation_no());
		
		//모델값 전달
		model.addAttribute("currentPage", "stationReport");
		model.addAttribute("viewBoard", stationReport);
		model.addAttribute("userNick", userNick);
		model.addAttribute("stationName", stationName);
		
		return "admin/stationReport";
	}
	
	@RequestMapping(value="/reportDelete")
	public String stationReportDelete(Station_report stationReport) {
		logger.info("/admin/reportDelete");
		
		if( stationReport.getReport_no() > 1 ) {
			adminService.deleteReport(stationReport);
		}
		
		return "redirect:/admin/stationReportList";
	}
	
	@RequestMapping(value="/stationDecList")
	public void stationDecList(Paging paramData, Model model) {
		logger.info("/admin/stationReportList");
		
		//페이징 계산
		Paging paging = adminService.getPaging("stationDecList", paramData );
		logger.info("{}", paging);
		
		List<Station_Dec> stationDecList = adminService.stationDecList(paging);
		for(Station_Dec d : stationDecList) {
			logger.info("{}", d);
		}
		
		model.addAttribute("currentPage", "stationDec");
		model.addAttribute("paging", paging);
		model.addAttribute("list", stationDecList);
	}
	
	@RequestMapping(value="/stationDec")
	public String stationDec(Station_Dec stationDec, Model model, HttpSession session) {
		logger.info("/admin/stationDec 파라미터 {}", stationDec);
		
		if( stationDec.getDec_no() < 1 ) {
			return "redirect:/admin/stationDecList";
		}
		
		stationDec = adminService.viewstationDec(stationDec);
		logger.info("/admin/stationDec 상세보기 {}", stationDec);
		
		String userNick = adminService.selectNickByUserNo(stationDec.getUser_no());
		String stationName = adminService.selectStationNameByStationNo(stationDec.getStation_no());
		
		//모델값 전달
		model.addAttribute("currentPage", "stationDec");
		model.addAttribute("viewBoard", stationDec);
		model.addAttribute("userNick", userNick);
		model.addAttribute("stationName", stationName);
		
		return "admin/stationDec";
	}
	
	@RequestMapping(value="/decDisabled")
	public String stationDecDisabled(Station_Dec stationDec) {
		logger.info("/admin/decDisabled");
		logger.info("{}", stationDec.getStation_no());
		
		if( stationDec.getStation_no() > 1 ) {
			adminService.disabledStation(stationDec);
		}

		return "admin/alertUpdate";
	}
	
	@RequestMapping(value="/stationReviewList")
	public void stationReviewList(Paging paramData, Model model) {
		logger.info("/admin/stationReviewList");
		
		//페이징 계산
		Paging paging = adminService.getPaging("stationReviewList", paramData );
		logger.info("{}", paging);
		
		List<Station_review> stationReviewList = adminService.stationReviewList(paging);
		for(Station_review r : stationReviewList) {
			logger.info("{}", r);
		}
		
		model.addAttribute("currentPage", "stationReview");
		model.addAttribute("paging", paging);
		model.addAttribute("list", stationReviewList);
	}

	@RequestMapping(value="/stationReview")
	public String stationReview(Station_review stationReview, Model model, HttpSession session) {
		logger.info("/admin/stationReport 파라미터 {}", stationReview);
		
		if( stationReview.getReview_no() < 1 ) {
			return "redirect:/admin/stationReviewList";
		}
		
		stationReview = adminService.viewstationReview(stationReview);
		logger.info("/admin/stationReview 상세보기 {}", stationReview);
		
		String userNick = adminService.selectNickByUserNo(stationReview.getUser_no());
		String stationName = adminService.selectStationNameByStationNo(stationReview.getStation_no());
		
		//모델값 전달
		model.addAttribute("currentPage", "stationReview");
		model.addAttribute("viewBoard", stationReview);
		model.addAttribute("userNick", userNick);
		model.addAttribute("stationName", stationName);
		
		return "admin/stationReview";
	}
	
	@RequestMapping(value="/reviewDelete")
	public String stationReviewDelete(Station_review stationReview) {
		logger.info("/admin/reviewDelete");
		
		if( stationReview.getReview_no() > 1 ) {
			adminService.deleteReview(stationReview);
		}
		
		return "redirect:/admin/stationReviewList";
	}
	
	@RequestMapping(value="/unprivilegedUser")
	public void  unprivilegedUser() {
		logger.debug("/admin/unprivilegedUser");
	}
}
