package nevgation.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import nevgation.dao.face.AdminDao;
import nevgation.dto.Car_info;
import nevgation.dto.EVstation_info;
import nevgation.dto.Station_Dec;
import nevgation.dto.Station_report;
import nevgation.dto.Station_review;
import nevgation.dto.User_info;
import nevgation.service.face.AdminService;
import nevgation.util.Paging;

@Service
public class AdminServiceImpl implements AdminService {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminServiceImpl.class);
	
	@Autowired private AdminDao adminDao;
	
	//리스트
	@Override
	public Paging getPaging(String listName, Paging paramData) {
		logger.info("pagging 계산");
		
		//총 게시글 수 조회
		int totalCount = 0; 
		
		if(listName=="User_info") {
			totalCount = adminDao.selectUserAll();
		}
		if(listName=="EVstationInfoList") {
			totalCount = adminDao.selectEVstationAll();
		}
		if(listName=="stationReportList") {
			totalCount = adminDao.selectstationReportAll();
		}
		if(listName=="stationDecList") {
			totalCount = adminDao.selectstationDecAll();
		}
		if(listName=="stationReviewList") {
			totalCount = adminDao.selectstationReviewAll();
		}
				
		//페이징 계산
		Paging paging = new Paging(totalCount, paramData.getCurPage());
				
		return paging;
	}
	
	@Override
	public List<User_info> userInfoList(Paging paging) {
		logger.info("user 조회");
		return adminDao.selectUserList(paging);
	}
	
	@Override
	public List<EVstation_info> EVstationInfoList(Paging paging) {
		logger.info("EVstation 조회");
		return adminDao.selectEVstationList(paging);
	}
	
	@Override
	public List<Station_report> stationReportList(Paging paging) {
		logger.info("stationReport 조회");
		return adminDao.selectstationReportList(paging);
	}
	
	@Override
	public List<Station_Dec> stationDecList(Paging paging) {
		logger.info("stationDec 조회");
		return adminDao.selectstationDecList(paging);
	}
	
	@Override
	public List<Station_review> stationReviewList(Paging paging) {
		logger.info("stationReview 조회");
		return adminDao.selectstationReviewList(paging);
	}
	
	//추가
	@Override
	public void addEVstation(EVstation_info station) {
		adminDao.insertEVstation(station);
	}
	
	//수정
	@Override
	public void updateStation(EVstation_info station) {
		adminDao.updateStation(station);
	}
	
	//자세히 보기
	@Override
	public User_info view(User_info userInfo) {
		return  adminDao.selectUserByUserno(userInfo);
	}
	
	@Override
	public EVstation_info viewEVstation(EVstation_info evstationInfo) {
		return adminDao.selectEVstationByStationno(evstationInfo);
	}
	
	@Override
	public Station_report viewstationReport(Station_report stationReport) {
		return adminDao.selectStationReportByReportNo(stationReport);
	}
	
	@Override
	public Station_Dec viewstationDec(Station_Dec stationDec) {
		return adminDao.selectStationDecByDecNo(stationDec);
	}
	
	@Override
	public Station_review viewstationReview(Station_review stationReview) {
		return adminDao.selectStationReviewByReviewNo(stationReview);
	}
	
	//삭제
	@Override
	public void deleteUser(User_info userInfo) {
		adminDao.deleteReportByUserNo(userInfo);
		adminDao.deleteDecByUserNo(userInfo);
		adminDao.deleteReviewByUserNo(userInfo);
		adminDao.deleteUser(userInfo);
	}
	
	@Override
	public void deleteReview(Station_review stationReview) {
		adminDao.deleteReview(stationReview);
	}
	
	@Override
	public void deleteReport(Station_report stationReport) {
		adminDao.deleteReport(stationReport);
	}
	
	@Override
	public void deleteStation(EVstation_info evstationInfo) {
		adminDao.deleteDecBystationNo(evstationInfo);
		adminDao.deleteReportBystationNo(evstationInfo);
		adminDao.deleteReviewBystationNo(evstationInfo);
		adminDao.deleteStation(evstationInfo);
	}
	
	//유저 닉네임 조회
	@Override
	public String selectNickByUserNo(int user_no) {
		return adminDao.selectUserNickByUserNO(user_no);
	}
	
	//활성화 여부 변경
	@Override
	public void blockUser(User_info userInfo) {
		adminDao.blockUser(userInfo);
	}
	
	@Override
	public void unblockUser(User_info userInfo) {
		adminDao.unblockUser(userInfo);
	}
	
	@Override
	public void disabledStation(Station_Dec stationDec) {
		adminDao.disabledStation(stationDec);
	}
	
	@Override
	public void activationStation(EVstation_info evstationInfo) {
		adminDao.activationStation(evstationInfo);
	}
	
	//주유소 이름 조회
	@Override
	public String selectStationNameByStationNo(int station_no) {
		return adminDao.selectStationNameByStationNo(station_no);
	}
	
	//충전타입 정보
	@Override
	public String selectChargeType(User_info userInfo) {
		return adminDao.selectChargeTypeByChargeNO(userInfo);
	}
	
	//확인 여부 변경
	@Override
	public void checkReport(int report_no) {
		adminDao.checkReportByReportNo(report_no);
	}
	
	@Override
	public List<Car_info> selectCarInfo() {
		return adminDao.selectCarInfoList();
	}
}
