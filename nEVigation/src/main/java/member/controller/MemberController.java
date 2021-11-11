package member.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.dto.User;
import member.service.face.MemberService;

@Controller
@RequestMapping(value="/member")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired private MemberService memberService;
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public void login() {
		logger.debug("/member/login");
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String loginProc(User user, HttpSession session) {
		logger.debug("User : {}", user);
		
		boolean isLogin = memberService.login(user);
		
		if (isLogin) {
			session.setAttribute("login", true);
			session.setAttribute("id", user.getUserEmail());
			User userinfo = memberService.getUserinfo(user);
			session.setAttribute("nick", userinfo.getUserNick());
			session.setAttribute("chargeType", userinfo.getChargeTypeNo());
		}
		
		return "redirect:/main";
	}
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public void join() {
		logger.debug("/member/join");
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String joinProc(User user) {
		logger.debug("USer : {}", user);
		
		boolean isJoin = memberService.join(user);
		
		if(isJoin) {
			logger.info("회원가입 성공");
			return "redirect:/main";
		} else {
			logger.info("회원가입 실패");
			return "redirect:/member/join";
		}
	}
	
}
