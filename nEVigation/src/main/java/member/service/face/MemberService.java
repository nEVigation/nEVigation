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
	int deleteAccount(User user);
	
	/**
	 * 입력된 닉네임으로 회원정보를 변경한다
	 * @param user
	 * @return int - 1.성공 0.실패
	 */
	int changeNick(User user);
	
	/**
	 * 비밀번호를 조회하고 일치 시 newPw로 변경한다 
	 * @param user, newPw
	 * @return int - 0-업데이트 실패, 1-업데이트 성공, 2-비밀번호 불일치
	 */
	int changePw(User user,String newPw);
	
	/**
	 * 사용자의 차량 충전타입을 변경한다
	 * @param user
	 */
	int changeChargeType(User user);
	
}
