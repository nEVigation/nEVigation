package nevigation.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import nevigation.dto.Station_Dec;
import nevigation.service.face.DecService;

@Controller
public class DecController {

	//로깅 객체
	private static final Logger logger = LoggerFactory.getLogger(DecController.class);
	
	@Autowired private DecService decservice;
		
	@RequestMapping(value="/map/declaration" , method=RequestMethod.GET)
	public void declaration() {
		logger.info("/map/declaration [GET]");
			
	}
	
	@RequestMapping(value="/map/declaration" , method=RequestMethod.POST)
	public String declarationProc(Station_Dec dec, HttpSession session) {
		logger.info("/map/declaration [POST]");
		
		decservice.sendDec(dec);
		
		dec.setUser_no((int)session.getAttribute("user_no"));
		dec.setStation_no((int)session.getAttribute("station_no"));
		dec.setDec_type((String)session.getAttribute("dec_type"));
		
		return "redirect:/map/declaration";
		
	}
}
