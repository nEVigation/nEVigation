package member.dao;

import member.dto.User;

public interface MemberDao {
	
	/**
	 * 주어진 id, pw와 일치하는 데이터가있는지 조회한다 
	 * 
	 * @param user - userEmail, userPw
	 * @return - 조회된 행의 숫자
	 */
	int selectCntUser(User user);
	
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
	User selectUserByEmail(User user);
	
	/**
	 * 회원정보를 user_info에 삽입한다 
	 * @param user - User dto
	 * @return - int
	 */
	int insertUser(User user);
	
	/**
	 * 비밀번호 복구를 위한 임시 토큰 입력
	 * @param email, token
	 */
	void updateToken(User user);
	
	/**
	 * token 이 일치하는 행의 USER_PW를 변경한다
	 * @param password
	 * @param token
	 * @return
	 */
	int updatePassword(User user);

	
	
	
}
