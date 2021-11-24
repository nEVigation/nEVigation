package member.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.dto.Favorite;

@Controller
public class MapController {
	
	private static final Logger logger = LoggerFactory.getLogger(MapController.class);
	
	@RequestMapping(value="/map", method=RequestMethod.GET)
	public String login(HttpSession session) {
		return null;
	}
	
	@RequestMapping(value="/map", method=RequestMethod.POST)
	public String login(HttpSession session, Favorite fav) {
		logger.debug("fav : {}", fav);
		session.setAttribute("lat", fav.getStation_latitude());
		session.setAttribute("lng", fav.getStation_longitude());
		session.setAttribute("station_name", fav.getStation_name());
		return null;
	}
}