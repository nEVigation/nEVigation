package member.service.face;

import member.dto.User;

public interface MemberService {
	
	/**
	 * id, pw 정보로 로그인 한다
	 * @param user - userEmail, userPw
	 * @return
	 */
	boolean login(User user);
	
	/**
	 * id에 해당하는 유저정보를 조회한다
	 * @param user - userEmail
	 * @return
	 */
	User getUserinfo(User user);
	
	/**
	 * 입력된 정보로 회원가입을 한다
	 * 
	 * @param user
	 * @return
	 */
	boolean join(User user);

}
