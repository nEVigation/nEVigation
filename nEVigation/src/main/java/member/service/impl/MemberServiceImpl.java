package member.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import member.dao.MemberDao;
import member.dto.User;
import member.service.face.MemberService;
import member.util.RandomNumberGenerator;

@Service
public class MemberServiceImpl implements MemberService {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberService.class);
	
	@Autowired private MemberDao memberDao;

	@Override
	public int login(User user) {
		
		int result;
		//아이디 체크
		if (memberDao.selectCntEmail(user.getUserEmail())>0) {
			//1-1. 아이디가 일치 시 
			// ㄴ 아이디+비밀번호 체크
			int userCnt = memberDao.selectCntUser(user);
			if(userCnt > 0) {
				//2-1. 아이디가 일치 비밀번호도 일치 시
				result = 1;
			} else {
				//2-2. 아이디는 일치하지만 비밀번호가 다를 시 
				result = 3;
			}
		} else {
			//1-2. 아이디 불일치 시 
			result = 2;
		}
		return result;
	}
	
	@Override
	public User getUserinfo(User user) {
		
		User userinfo = memberDao.selectUserByEmail(user);
		logger.debug("userinfo : {}", userinfo);
		return userinfo;
	}
	
	@Override
	public boolean join(User user) {
		logger.debug("user : {}",user);
		
		int isEmailExist = memberDao.selectCntEmail(user.getUserEmail());
		if (isEmailExist > 0) {
			logger.debug("이미 등록된 이메일");
			return false;
		} else {
			logger.debug("join start");
			int result = memberDao.insertUser(user);
			if (result > 0) {
				logger.debug("insert complete");
				return true;
			}
			logger.debug("insert error");
		}
		return false;
	}
	
	@Override
	public int checkEmail(String email) {
		logger.debug("checkEmail : {}", email);
		int result = memberDao.selectCntEmail(email);
		logger.debug("count : {}",result);
		return result;
	}
	
	@Override
	public String generateTokenContent(String email) {
		logger.debug("email : {}", email);

		RandomNumberGenerator rng = new RandomNumberGenerator();
		String token = rng.randomString(50);
		logger.debug(token);
		User user = new User();
		user.setUserEmail(email);
		user.setToken(token);
		memberDao.updateToken(user);
		
		String content = 
			("<div style=\"color:black;\">아래 링크를 클릭하시면 비밀번호를 다시 설정할 수 있는 페이지로 이동합니다 <br>"
			+ "<br>"
			+ "http://localhost:8088/password/change?token=" + token +"<br>"
			+ "<br>"
			+ "from nEVigation</div>");
		
		return content;
	}
	
	@Override
	public int setPassword(String password, String token) {
		logger.debug("setPassword()");
		User user = new User();
		user.setUserPw(password);
		user.setToken(token);
		if (memberDao.updatePassword(user) > 0) {
			logger.debug("password changed");
			return 1;
		} else {
			logger.debug("token is not matched!");
			return 0;
		}
	}
	
	@Override
	public int deleteAccount(User user) {
		return memberDao.deleteUser(user);
	}
	
	@Override
	public int changeNick(User user) {
		return memberDao.changeUserNick(user);
	}
	
}
