package member.service.face;

import member.dto.User;

public interface MemberService {
	
	/**
	 * id, pw 정보로 로그인 한다
	 * @param user - userEmail, userPw
	 * @return 1-로그인성공, 2-아이디없음, 3-비밀번호 다름
	 */
	int login(User user);
	
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
	
	/**
	 * 회원가입 화면에서 email의 중복 검사를 수행한다
	 * @param email
	 * @return 
	 */
	int checkEmail(String email);

}
