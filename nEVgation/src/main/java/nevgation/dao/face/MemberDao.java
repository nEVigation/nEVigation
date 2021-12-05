package nevgation.dao.face;

import java.util.ArrayList;
import java.util.HashMap;

import nevgation.dto.Favorite_list;
import nevgation.dto.User_info;



public interface MemberDao {
	
	/**
	 * 주어진 id, pw와 일치하는 데이터가있는지 조회한다 
	 * 
	 * @param user - userEmail, userPw
	 * @return - 조회된 행의 숫자
	 */
	int selectCntUser(User_info user);
	
	/**
	 * email 이 user_info에 이미 존재하는지 조회
	 * @param email
	 * @return
	 */
	int selectCntEmail(String email);
	
	/**
	 * id에 해당하는 user_info 테이블을 조회하여 내용을 반환한다
	 * (비밀번호는 제외한다)
	 * @param user - userEmail
	 * @return - 조회된 User dto
	 */
	User_info selectUserByEmail(User_info user);
	
	/**
	 * 회원정보를 user_info에 삽입한다 
	 * @param user - User dto
	 * @return - int
	 */
	int insertUser(User_info user);
	
	/**
	 * 비밀번호 복구를 위한 임시 토큰 입력
	 * @param email, token
	 */
	void updateToken(User_info user);
	
	/**
	 * token 이 일치하는 행의 USER_PW를 변경한다
	 * @param password
	 * @param token
	 * @return
	 */
	int updatePassword(User_info user);
	
	/**
	 * email, pw를 대조하여 행을 삭제한다
	 * @param user
	 * @return
	 */
	int deleteUser(User_info user);
	
	/**
	 * email을 조회하여 user_nick을 변경한다
	 * @param user
	 * @return
	 */
	int changeUserNick(User_info user);
	
	/**
	 * email과 pw가 일치하는 행의 갯수를 반환한다
	 * @param user
	 * @return
	 */
	int checkCntPw(User_info user);
	
	/**
	 * email, userPw가 일치하는 행의 user_pw를  
	 * newPw로 교체한다
	 * @param password(list)
	 * @return
	 */
	int updatePw(HashMap<String, String> password);
	
	/**
	 * userEmail이 일치하는 행의 chargeTypeNo를 업데이트 한다
	 * @param user
	 */
	int updateChargeType(User_info user);
	
	/**
	 * 비밀번호 찾기 모듈이 수행된 후 토큰값을 null로 업데이트 한다
	 * @param user
	 */
	void updateTokenToVoid(User_info user);
	
	/**
	 * token값이 일치하는 userEmail을 반환한다
	 * @return
	 */
	String selectEmailByToken(String token);
	
	/**
	 * token이 일치하는 행의 갯수를 반환한다
	 * @param token
	 * @return
	 */
	int selectCntToken(String token);
	
	/**
	 * userEmail 로  user_no를 조회하여 반환한다
	 * @param userEmail
	 * @return
	 */
	int selectNoByEmail(String userEmail);
	
	/**
	 * userEmail이 일치하는 favorite_list의 목록을
	 * EVSTATION_INFO의 station_name, station_loc 와 조인하여 조회한다 
	 * @param userNo
	 * @return Favorite(favorite_no, station_no, station_name, station_loc)
	 */
	ArrayList<Favorite_list> selectFavoriteByNo(int userNo);
	
	/**
	 * 충전타입 지시자(int)값으로 충전타입이름(String)을 조회한다
	 * @param chargeTypeNo
	 * @return
	 */
	String selectChargeTypeName(Integer chargeTypeNo);

	
}
