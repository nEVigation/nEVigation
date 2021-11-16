package member.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
			logger.debug("no valid login information");
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
			logger.debug("no valid login information");
			return "redirect:/mainpage";
		}
	}
	
	@RequestMapping(value="/chgpw", method=RequestMethod.GET)
	public void changePw(HttpSession session) {
		logger.debug("/mypage/chgpw [GET]");
	}
	@RequestMapping(value="/chgpw", method=RequestMethod.POST)
	public String changePw(HttpSession session, User user, String newPw, RedirectAttributes ra) {
		logger.debug("/mypage/chgpw [POST]");
		//0-업데이트 실패, 1-업데이트 성공, 2-비밀번호 불일치
		int result;
		if((boolean) session.getAttribute("login")) {
			user.setUserEmail((String)session.getAttribute("id"));
			result = memberService.changePw(user, newPw); 
		} else {
			logger.debug("no valid login information");
			return "redirect:/member/login";
		}
		if(result == 1) {
			ra.addFlashAttribute("status", "비밀번호 변경 완료");
			return "redirect:/mypage";
		} else if (result == 2) {
			ra.addFlashAttribute("status", 2);
			return "redirect:/mypage/chgpw";
		} else if (result == 0) {
			return "redirect:/error";
		}
		
		return "redirect:/main";
	}
	
	@RequestMapping(value="/chgcar", method=RequestMethod.GET)
	public void changeCar(HttpSession session) {
		logger.debug("/mypage/chgcar [GET]");
	}
	@RequestMapping(value="/chgcar", method=RequestMethod.POST)
	public void changeCar(HttpSession session, User user) {
		logger.debug("/mypage/chgcar [POST]");
	}
	
	
	@RequestMapping(value="/favorite", method=RequestMethod.GET)
	public void favoriteSts(HttpSession session) {
		logger.debug("/mypage/favorite [GET]");
	}
	
}
