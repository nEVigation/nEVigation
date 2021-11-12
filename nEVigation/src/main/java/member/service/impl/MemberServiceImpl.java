package member.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import member.dao.MemberDao;
import member.dto.User;
import member.service.face.MemberService;

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
}
