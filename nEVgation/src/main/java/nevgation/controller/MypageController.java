package nevgation.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import nevgation.dto.Favorite_list;
import nevgation.dto.User_info;
import nevgation.service.face.MemberService;


@Controller
@RequestMapping(value="/mypage")
public class MypageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@Autowired private MemberService memberService;
	
	@RequestMapping(value="", method=RequestMethod.GET)
	public ModelAndView mypageMain(HttpSession session) {
		logger.debug("/mypage");
		session.setAttribute("chargeTypeName", 
				(String)memberService.getChargeTypeName((Integer)session.getAttribute("chargeType")) );
		ModelAndView mav = new ModelAndView();
		ArrayList<Favorite_list> list = new ArrayList<>();
		list = memberService.getFavoriteByEmail((String)session.getAttribute("id"));
		mav.setViewName("/mypage");
		mav.addObject("list", list);
		logger.debug("list : {}", list);
		return mav;
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public void deleteAccount(HttpSession session) {
		logger.debug("/mypage/delete [GET]");
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public String deleteAccountProc(HttpSession session, User_info user, RedirectAttributes ra) {
		logger.debug("/mypage/delete [POST]");
		if((boolean) session.getAttribute("login")) {
			user.setUser_email((String)session.getAttribute("id"));
			if (memberService.deleteAccount(user)>0) {
				logger.debug("delete account complete");
				return "redirect:/main";
			} else {
				logger.debug("잘못된 비밀번호 입력");
				ra.addFlashAttribute("status", "잘못된 비밀번호를 입력하셨습니다");
				return "redirect:/mypage/delete";
			}
		} else {
			logger.debug("no valid login information");
			return "redirect:/main";
		}
	}
	
	@RequestMapping(value="/chgnick", method=RequestMethod.GET)
	public void changeNick(HttpSession session) {
		logger.debug("/mypage/chgnick [GET]");
	}
	
	@RequestMapping(value="/chgnick", method=RequestMethod.POST)
	public String changeNickProc(HttpSession session, User_info user) {
		logger.debug("/mypage/chgnick [POST]");
		if((boolean) session.getAttribute("login")) {
			user.setUser_email((String)session.getAttribute("id"));
			if (memberService.changeNick(user)>0) {
				logger.debug("nickname changed");
				session.setAttribute("nick", user.getUser_nick());
				return "redirect:/mypage";
			} else {
				logger.debug("알 수 없는 에러 발생(Update실패)");
				return "redirect:/mypage";
			}
		} else {
			logger.debug("no valid login information");
			return "redirect:/main";
		}
	}
	
	@RequestMapping(value="/chgpw", method=RequestMethod.GET)
	public void changePw(HttpSession session) {
		logger.debug("/mypage/chgpw [GET]");
	}
	@RequestMapping(value="/chgpw", method=RequestMethod.POST)
	public String changePw(HttpSession session, User_info user, String new_pw, RedirectAttributes ra) {
		logger.debug("/mypage/chgpw [POST]");
		//0-업데이트 실패, 1-업데이트 성공, 2-비밀번호 불일치
		int result;
		if((boolean) session.getAttribute("login")) {
			user.setUser_email((String)session.getAttribute("id"));
			result = memberService.changePw(user, new_pw); 
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
	public String changeCar(HttpSession session, User_info user) {
		logger.debug("/mypage/chgcar [POST]");
		logger.debug("charge_type_no : {}",user.getCharge_type_no());
		if((boolean) session.getAttribute("login")) {
			user.setUser_email((String)session.getAttribute("id"));
			if(memberService.changeChargeType(user)>0) {
				session.setAttribute("chargeType", user.getCharge_type_no());
				return "redirect:/mypage/chgcar";
			} else {
				logger.debug("charge type change failed");
				return "redirect:/mypage/chgcar";
			}
		} else {
			logger.debug("no valid login information");
			return "redirect:/member/login";
		}
	}
	
//	@RequestMapping(value="/favorite", method=RequestMethod.GET)
//	public ModelAndView favoriteSts(HttpSession session) {
//		logger.debug("/mypage/favorite [GET]");
//		ModelAndView mav = new ModelAndView();
//		ArrayList<Favorite> list = new ArrayList<>();
//		list = memberService.getFavoriteByEmail((String)session.getAttribute("id"));
//		
//		mav.setViewName("/mypage/favorite");
//		mav.addObject("list", list);
//		
//		logger.debug("list : {}", list);
//		
//		return mav;
//	}
}
