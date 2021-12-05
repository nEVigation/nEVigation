package nevgation.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import nevgation.dto.EVstation_info;
import nevgation.service.face.MapService;

@RequestMapping(value = "/map")
@Controller
public class MapController {
	
	@Autowired
	private MapService mapService;
	
	@RequestMapping(value = "/main")
	public String MapMain(Model model) {
		System.out.println("/map/main");
		
		List<EVstation_info> allStationList = mapService.ShowAllStation();
		
		model.addAttribute("allStationList", allStationList);
		
		return "MapMain";
	}
}
