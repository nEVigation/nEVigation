package nevgation.service.face;

import java.util.ArrayList;

import nevgation.dto.Favorite_list;
import nevgation.dto.User_info;

public interface MemberService {
	
	/**
	 * id, pw 정보로 로그인 한다
	 * @param user - userEmail, userPw
	 * @return 1-로그인성공, 2-아이디없음, 3-비밀번호 다름
	 */
	int login(User_info user);
	
	/**
	 * id에 해당하는 유저정보를 조회한다
	 * @param user - userEmail
	 * @return
	 */
	User_info getUserinfo(User_info user);
	
	/**
	 * 입력된 정보로 회원가입을 한다
	 * 
	 * @param user
	 * @return
	 */
	boolean join(User_info user);
	
	/**
	 * 회원가입 화면에서 email의 중복 검사를 수행한다
	 * @param email
	 * @return 
	 */
	int checkEmail(String email);
	
	/**
	 * 비밀번호 초기화 메일 내부 텍스트를 작성한다.
	 * @return
	 */
	String generateTokenContent(String email);
	
	/**
	 * 새로 비밀번호를 설정한다 
	 * @param password
	 * @param token
	 * @return int - 1.성공 2.실패
	 */
	int setPassword(String password, String token);
	
	/**
	 * 입력된 비밀번호를 확인하고 회원탈퇴를 진행한다
	 * @param user - userPw, userEmail(from session)
	 * @return int - 1.성공 0.실패
	 */
	int deleteAccount(User_info user);
	
	/**
	 * 입력된 닉네임으로 회원정보를 변경한다
	 * @param user
	 * @return int - 1.성공 0.실패
	 */
	int changeNick(User_info user);
	
	/**
	 * 비밀번호를 조회하고 일치 시 newPw로 변경한다 
	 * @param user, newPw
	 * @return int - 0-업데이트 실패, 1-업데이트 성공, 2-비밀번호 불일치
	 */
	int changePw(User_info user,String newPw);
	
	/**
	 * 사용자의 차량 충전타입을 변경한다
	 * @param user
	 */
	int changeChargeType(User_info user);
	
	/**
	 * token값이 존재하는지 count한다
	 * @param token
	 * @return int
	 */
	int checkToken(String token);
	
	/**
	 * 즐겨찾기 목록을 조회하여 가져온다.
	 * @param attribute
	 * @return Favorite.dto로 이루어진 ArrayList
	 */
	ArrayList<Favorite_list> getFavoriteByEmail(String userEmail);

	/**
	 * 충전타입 지시자(int)값으로 충전타입이름(String)을 반환한다
	 * @param attribute
	 * @return
	 */
	String getChargeTypeName(Integer chargeTypeNo);
	
	/**
	 * station_no를 받아와서 즐겨찾기 추가
	 * @param favNo
	 * @param favNo2 
	 * @return
	 */
	int addFavorite(int user_no, String name);
	
}
