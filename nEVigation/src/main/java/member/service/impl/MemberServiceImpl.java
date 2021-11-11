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
	public boolean login(User user) {
		
		int userCnt = memberDao.selectCntUser(user);
		if (userCnt > 0 ) return true;
		return false;
	}
	
	@Override
	public User getUserinfo(User user) {
		
		User userinfo = memberDao.selectUserByEmail(user);
		logger.debug("userinfo : {}", userinfo);
		return userinfo;
	}
	
	@Override
	public boolean join(User user) {
		
		
		return false;
	}
}
