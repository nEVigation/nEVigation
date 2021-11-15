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
@RequestMapping(value="/mypage")
public class MypageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@Autowired private MemberService memberService;
	
	@RequestMapping(value="", method=RequestMethod.GET)
	public void mypageMain(HttpSession session) {
		logger.debug("/mypage");
		
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public void deleteAccount(HttpSession session) {
		logger.debug("/mypage/delete [GET]");
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public String deleteAccountProc(HttpSession session, User user) {
		logger.debug("/mypage/delete [POST]");
		if((boolean) session.getAttribute("login")) {
			user.setUserEmail((String)session.getAttribute("id"));
			if (memberService.deleteAccount(user)>0) {
				logger.debug("delete account complete");
				return "redirect:/mainpage";
			} else {
				logger.debug("잘못된 비밀번호 입력");
				return "redirect:/mypage/delete";
			}
		} else {
			logger.debug("잘못된 접근(로그인 세션 없음)");
			return "redirect:/mainpage";
		}
	}
	
	@RequestMapping(value="/chgnick", method=RequestMethod.GET)
	public void changeNick(HttpSession session) {
		logger.debug("/mypage/chgnick [GET]");
	}
	
	@RequestMapping(value="/chgnick", method=RequestMethod.POST)
	public String changeNickProc(HttpSession session, User user) {
		logger.debug("/mypage/chgnick [POST]");
		if((boolean) session.getAttribute("login")) {
			user.setUserEmail((String)session.getAttribute("id"));
			if (memberService.changeNick(user)>0) {
				logger.debug("nickname changed");
				return "redirect:/mypage";
			} else {
				logger.debug("알 수 없는 에러 발생(Update실패)");
				return "redirect:/mypage";
			}
		} else {
			logger.debug("잘못된 접근(로그인 세션 없음)");
			return "redirect:/mainpage";
		}
	}
	
	@RequestMapping(value="/chgcar", method=RequestMethod.GET)
	public void changeCar(HttpSession session) {
		logger.debug("/mypage/chgcar [GET]");
	}
	@RequestMapping(value="/chgcar", method=RequestMethod.POST)
	public void changeCar(HttpSession session, User user) {
		logger.debug("/mypage/chgcar [POST]");
	}
	
	@RequestMapping(value="/chgpw", method=RequestMethod.GET)
	public void changePw(HttpSession session) {
		logger.debug("/mypage/chgpw [GET]");
	}
	@RequestMapping(value="/chgpw", method=RequestMethod.POST)
	public void changePw(HttpSession session, User user) {
		logger.debug("/mypage/chgpw [POST]");
	}
	
	@RequestMapping(value="/favorite", method=RequestMethod.GET)
	public void favoriteSts(HttpSession session) {
		logger.debug("/mypage/favorite [GET]");
	}
	
}
