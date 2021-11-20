package nevigation.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class MainController {


	//로깅 객체
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@RequestMapping(value="/main")
	public void main() {
		logger.info("/main");
	}
	
	@RequestMapping(value="/")
	public String welcome() {
		logger.info("/main");
		return "/main";
	}
}
