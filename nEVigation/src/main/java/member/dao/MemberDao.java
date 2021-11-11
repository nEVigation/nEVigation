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
	 * id에 해당하는 user_info 테이블을 조회하여 내용을 반환한다
	 * (비밀번호는 제외한다)
	 * @param user - userEmail
	 * @return - 조회된 User dto
	 */
	User selectUserByEmail(User user);
	
	
}
