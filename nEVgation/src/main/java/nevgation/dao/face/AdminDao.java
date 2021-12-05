package nevgation.dao.face;

import java.util.List;

import nevgation.dto.Car_info;
import nevgation.dto.EVstation_info;
import nevgation.dto.Station_Dec;
import nevgation.dto.Station_report;
import nevgation.dto.Station_review;
import nevgation.dto.User_info;
import nevgation.util.Paging;

public interface AdminDao {

	/**
	 * 전체 회원 수를 조회한다
	 * 
	 * @return 전체 회원수
	 */
	public int selectUserAll();
	
	/**
	 * 전체 회원 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 회원 목록
	 */
	public List<User_info> selectUserList(Paging paging);

	/**
	 * 전체 주유소 수를 조회한다
	 * 
	 * @return 전체 주유소 수
	 */
	public int selectEVstationAll();

	/**
	 * 전체 주유소 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 주유소 목록
	 */
	public List<EVstation_info> selectEVstationList(Paging paging);

	/**
	 * 전체 주유소 리뷰 수를 조회한다
	 * 
	 * @return 전체 주유소 리뷰 수
	 */
	public int selectstationReportAll();
	
	/**
	 * 전체 주유소 리뷰 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 주유소 리뷰 목록
	 */
	public List<Station_report> selectstationReportList(Paging paging);

	/**
	 * 전체 주유소 신고 수를 조회한다
	 * 
	 * @return 전체 주유소 신고 수
	 */
	public int selectstationDecAll();

	/**
	 * 전체 주유소 신고 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 주유소 신고 목록
	 */
	public List<Station_Dec> selectstationDecList(Paging paging);

	/**
	 * 전체 주유소 리뷰 수를 조회한다
	 * 
	 * @return 전체 주유소 리뷰 수
	 */
	public int selectstationReviewAll();
	
	/**
	 * 전체 주유소 리뷰 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 주유소 리뷰 목록
	 */
	public List<Station_review> selectstationReviewList(Paging paging);

	/**
	 * 회원 번호를 이용하여 회원을 조회한다
	 * 
	 * @param userInfo - 조회하려는 회원의 번호 객체
	 * @return 조회된 회원 정보
	 */
	public User_info selectUserByUserno(User_info userInfo);
	
	/**
	 * 회원 번호를 이용하여 회원 블락
	 * @param userInfo - 블락하려는 회원의 번호 객체
	 */
	public void blockUser(User_info userInfo);
	
	/**
	 * 회원 번호를 이용하여 회원 블락 해제
	 * @param userInfo - 블락을 해제하려는 회원의 번호 객체
	 */
	public void unblockUser(User_info userInfo);
	
	//회원 삭제
	public void deleteReportByUserNo(User_info userInfo);
	public void deleteDecByUserNo(User_info userInfo);
	public void deleteReviewByUserNo(User_info userInfo);
	/**
	 * 회원번호를 이용하여 회원 삭제
	 * @param userInfo - 삭제하려는 회원의 번호 객체
	 */
	public void deleteUser(User_info userInfo);

	//충전소 삭제
	public void deleteReportBystationNo(EVstation_info evstationInfo);
	public void deleteDecBystationNo(EVstation_info evstationInfo);
	public void deleteReviewBystationNo(EVstation_info evstationInfo);
	/**
	 * 충전소 번호를 통해 충전소 삭제
	 * @param evstationInfo 삭제할 충전소 번호를 가진 객체
	 */
	public void deleteStation(EVstation_info evstationInfo);
	
	/**
	 * 주유소 정보 수정
	 * @param station - 수정된 주유소 정보를 가진 객체
	 */
	public void updateStation(EVstation_info station);
	
	/**
	 * 충전소 번호를 통해 충전소 활성화
	 * @param evstationInfo - 활성화할 충전소 번호를 가진 객체
	 */
	public int activationStation(EVstation_info evstationInfo);
	
	/**
	 * 충전타입 번호를 이용하여 충전타입을 조회한다
	 * 
	 * @param userInfo - 조회하려는 충전타입의 번호 객체
	 * @return 조회된 충전타입 정보
	 */
	public String selectChargeTypeByChargeNO(User_info userInfo);

	/**
	 * 충전소 추가
	 * @param station_추가할 충전소 정보가 저장되어있는 객체
	 */
	public void insertEVstation(EVstation_info station);
	
	/**
	 * 주유소 번호를 이용하여 회원을 조회한다
	 * 
	 * @param EVstationInfo - 조회하려는 주유소의 번호 객체
	 * @return 조회된 주유소 정보
	 */
	public EVstation_info selectEVstationByStationno(EVstation_info evstationInfo);

	/**
	 * 주유소 제보 게시물 번호를 이용하여 회원을 조회한다
	 * 
	 * @param EVstationInfo - 조회하려는 주유소 제보 게시물의 번호 객체
	 * @return 조회된 주유소 제보 게시물 정보
	 */
	public Station_report selectStationReportByReportNo(Station_report stationReport);

	/**
	 * 주유소 제보 게시물 확인 여부 변경
	 * @param report_no - 조회하려는 주유소 제보 게시물의 번호
	 */
	public void checkReportByReportNo(int report_no);

	/**
	 * 주유소 제보 게시물 삭제
	 * @param stationReport - 삭제하려는 주유소 제보 게시물의 번호
	 */
	public void deleteReport(Station_report stationReport);
	
	/**
	 * 유저번호로 유저 닉네임 조회
	 * @param user_no - 조회할 유저의 유저 번호
	 * @return 조회된 유저 닉네임
	 */
	public String selectUserNickByUserNO(int user_no);

	/**
	 * 주유소 번호로 주유소 이름 조회
	 * @param station_no - 조회할 주유소 번호
	 * @return 조회한 주유소 이름
	 */
	public String selectStationNameByStationNo(int station_no);

	/**
	 * 주유소 신고 게시물 번호로 게시물 조회
	 * @param stationDec - 조회할 게시물의 게시물 번호
	 * @return 조회된 주유소 신고 게시물 상세 정보
	 */
	public Station_Dec selectStationDecByDecNo(Station_Dec stationDec);

	/**
	 * 비활성화 할 게시물 번호로 게시물 비활성화
	 * @param stationDec - 비활성화할 게시물의 게시물 번호
	 */
	public void disabledStation(Station_Dec stationDec);
	
	/**
	 * 주유소 리뷰 게시물 번호로 게시물 조회
	 * @param stationReview - 조회할 게시물의 게시물 번호
	 * @return 조회된 쥬유소 리뷰 게시물 상세 정보
	 */
	public Station_review selectStationReviewByReviewNo(Station_review stationReview);

	/**
	 * 주유소 리뷰 게시물 번호로 게시물 삭제
	 * @param stationReview - 삭제할 게시물의 게시물 번호
	 */
	public void deleteReview(Station_review stationReview);

	/**
	 * 충전기 리스트 조회
	 * @return 충전기 리스트
	 */
	public List<Car_info> selectCarInfoList();
}
