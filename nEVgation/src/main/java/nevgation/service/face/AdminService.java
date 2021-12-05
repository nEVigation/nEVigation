package nevgation.service.face;

import java.util.List;

import nevgation.dto.Car_info;
import nevgation.dto.EVstation_info;
import nevgation.dto.Station_Dec;
import nevgation.dto.Station_report;
import nevgation.dto.Station_review;
import nevgation.dto.User_info;
import nevgation.util.Paging;

public interface AdminService {
	
	/**
	 * 게시글 목록을 위한 페이징 객체를 생성한다
	 * 
	 * 	파라미터 객체의 curPage(현재 페이지)
	 * 	DB에서 조회한 totalCount(총 게시글 수)
	 * 
	 * 	두 가지 데이터를 활용하여 페이징객체를 생성하여 반환한다
	 * 
	 * @param paramData - curPage를 저장하고있는 객체
	 * @param listName - 페이징을 계산할 리스트 이름
	 * @return 계산이 완료된 Paging객체
	 */
	public Paging getPaging(String listName, Paging paramData);

	/**
	 * 회원목록 조회
	 * @param paging - 페이징 정보 객체
	 * @return 회원 목록
	 */
	public List<User_info> userInfoList(Paging paging);

	/**
	 * 게시글 목록을 위한 페이징 객체를 생성한다
	 * 
	 * 	파라미터 객체의 curPage(현재 페이지)
	 * 	DB에서 조회한 totalCount(총 게시글 수)
	 * 
	 * 	두 가지 데이터를 활용하여 페이징객체를 생성하여 반환한다
	 * 
	 * @param paramData - curPage를 저장하고있는 객체
	 * @param listName - 페이징을 계산할 리스트 이름
	 * @return 계산이 완료된 Paging객체
	 */
	public List<EVstation_info> EVstationInfoList(Paging paging);

	/**
	 * 게시글 목록을 위한 페이징 객체를 생성한다
	 * 
	 * 	파라미터 객체의 curPage(현재 페이지)
	 * 	DB에서 조회한 totalCount(총 게시글 수)
	 * 
	 * 	두 가지 데이터를 활용하여 페이징객체를 생성하여 반환한다
	 * 
	 * @param paramData - curPage를 저장하고있는 객체
	 * @param listName - 페이징을 계산할 리스트 이름
	 * @return 계산이 완료된 Paging객체
	 */
	public List<Station_report> stationReportList(Paging paging);

	/**
	 * 게시글 목록을 위한 페이징 객체를 생성한다
	 * 
	 * 	파라미터 객체의 curPage(현재 페이지)
	 * 	DB에서 조회한 totalCount(총 게시글 수)
	 * 
	 * 	두 가지 데이터를 활용하여 페이징객체를 생성하여 반환한다
	 * 
	 * @param paramData - curPage를 저장하고있는 객체
	 * @param listName - 페이징을 계산할 리스트 이름
	 * @return 계산이 완료된 Paging객체
	 */
	public List<Station_Dec> stationDecList(Paging paging);

	/**
	 * 게시글 목록을 위한 페이징 객체를 생성한다
	 * 
	 * 	파라미터 객체의 curPage(현재 페이지)
	 * 	DB에서 조회한 totalCount(총 게시글 수)
	 * 
	 * 	두 가지 데이터를 활용하여 페이징객체를 생성하여 반환한다
	 * 
	 * @param paramData - curPage를 저장하고있는 객체
	 * @param listName - 페이징을 계산할 리스트 이름
	 * @return 계산이 완료된 Paging객체
	 */
	public List<Station_review> stationReviewList(Paging paging);

	/**
	 * 회원정보 상세보기
	 * 
	 * @param userInfo - 상세 조회할 회원 번호 DTO
	 * @return 조회된 상세 회원 정보
	 */
	public User_info view(User_info userInfo);
	
	/**
	 * 유저 블락
	 * @param userInfo 블락할 유저의 유저번호가 들어있는 객체
	 */
	public void blockUser(User_info userInfo);

	/**
	 * 유저 블락 해제
	 * @param userInfo 블락을 해제할 유저의 유저번호가 들어있는 객체
	 */
	public void unblockUser(User_info userInfo);
	
	/**
	 * 유저 삭제
	 * @param userInfo 삭제할 유저의 유저번호가 들어있는 객체
	 */
	public void deleteUser(User_info userInfo);
	
	/**
	 * 주유소정보 상세보기
	 * 
	 * @param evstationInfo - 상세 조회할 주유소 번호 DTO
	 * @return 조회된 상세 주유소 정보
	 */
	public EVstation_info viewEVstation(EVstation_info evstationInfo);
	
	/**
	 * 주유소 삭제
	 * @param evstationInfo - 삭제할 주유소 번호 객체
	 */
	public void deleteStation(EVstation_info evstationInfo);

	/**
	 * 주유소 수정
	 * @param station - 수정할 주유소 정보가 담긴 객체
	 */
	public void updateStation(EVstation_info station);

	/**
	 * 주유소 활성화
	 * @param evstationInfo - 활성화할 주유소 번호 객체
	 */
	public void activationStation(EVstation_info evstationInfo);
	
	/**
	 * 충전타입 정보
	 * 
	 * @param userInfo - 조회할 충전타입 번호 DTO
	 * @return 조회된 충전 타입 정보
	 */
	public String selectChargeType(User_info userInfo);

	/**
	 * 충전소 추가
	 * @param station 추가할 충전소 정보가 저장되어 있는 객체
	 */
	public void addEVstation(EVstation_info station);
	
	/**
	 * 주유소 제보 정보 상세보기
	 * 
	 * @param evstationInfo - 상세 조회할 주유소 제보 게시물 번호 DTO
	 * @return 조회된 상세 주유소 제보 정보
	 */
	public Station_report viewstationReport(Station_report stationReport);

	/**
	 * 주유소 제보 정보 확인여부 변경
	 * @param report_no - 상세 조회할 주유소 제보 게시물 번호 DTO
	 */
	public void checkReport(int report_no);

	/**
	 * 주유소 제보 정보 삭제
	 * @param stationReport - 삭제할 주유소 제보 게시물 번호를 가진 객체
	 */
	public void deleteReport(Station_report stationReport);
	
	/**
	 * 
	 * 유저번호로 유저닉네임 조회
	 * 
	 * @param user_no - 조회할 유저의 유저 번호
	 * @return 조회된 userNick
	 */
	public String selectNickByUserNo(int user_no);

	/**
	 * 주유소 번호로 주유소 이름 조회
	 * @param station_no - 조회할 주유소 번호
	 * @return - 조회된 주유소의 이름
	 */
	public String selectStationNameByStationNo(int station_no);

	/**
	 * 주유소 신고 정보 상세 조회
	 * @param stationDec - 조회할 게시글의 번호를 가진 객체
	 * @return -조회된 게시글의 상세 정보
	 */
	public Station_Dec viewstationDec(Station_Dec stationDec);

	/**
	 * 주유소 비활성화
	 * @param stationDec - 비활성화할 게시글 번호를 가진 객체
	 */
	public void disabledStation(Station_Dec stationDec);
	
	/**
	 * 주유소 리뷰 정보 상세 조회
	 * @param stationReview - 조회할 게시글의 번호를 가진 객체
	 * @return - 조회된 리뷰 게시글의 상세 정보
	 */
	public Station_review viewstationReview(Station_review stationReview);

	/**
	 * 주우소 리뷰 삭제
	 * @param stationReview - 삭제할 게시글 번호를 가진 객체
	 */
	public void deleteReview(Station_review stationReview);
	
	/**
	 * 충전기 타입
	 * @return 충전기 타입 리스트
	 */
	public List<Car_info> selectCarInfo();

}
