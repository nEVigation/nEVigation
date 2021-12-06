package nevgation.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import nevgation.dto.EVstation_info;
import nevgation.service.face.MapService;
import nevgation.util.Paging;

@RequestMapping(value = "/map")
@Controller
public class MapController {
	
	@Autowired
	private MapService mapService;
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String MapMain(Paging paramData, Model model) {
		System.out.println("/map/main");
		
		Paging paging = mapService.getPaging(paramData);
		
		List<EVstation_info> allStationList = mapService.ShowAllStation(paging);
		
		model.addAttribute("allStationList", allStationList);
		model.addAttribute("paging", paging);
		
		return "map/MapMain";
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String MapSearch(Paging paramData, String searchStationName, Model model) {
		System.out.println("/map/search");
		
		Paging paging = mapService.getPaging(paramData, "%" + searchStationName + "%");
		
		List<EVstation_info> searchStationList = mapService.showSearchStation("%" + searchStationName + "%", paging);
		
		model.addAttribute("searchStationName", searchStationName);
		model.addAttribute("searchStationList", searchStationList);
		model.addAttribute("paging", paging);
		
		return "map/MapSearch";
	}
}
