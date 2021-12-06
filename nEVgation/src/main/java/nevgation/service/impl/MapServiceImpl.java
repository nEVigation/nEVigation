package nevgation.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import nevgation.dao.face.MapDao;
import nevgation.dto.EVstation_info;
import nevgation.service.face.MapService;
import nevgation.util.Paging;

@Service
public class MapServiceImpl implements MapService {

	@Autowired
	private MapDao mapDao;
	
	@Override
	public List<EVstation_info> ShowAllStation(Paging paging) {
		List<EVstation_info> allStation = mapDao.selectAllStation(paging);
		
		if(allStation != null)
			return allStation;
		
		return null;
	}

	@Override
	public int countAllStation() {
		return mapDao.selectAllStationCnt();
	}

	@Override
	public List<EVstation_info> showSearchStation(String stationName, Paging paging) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("stationName", stationName);
		map.put("startNo", paging.getStartNo());
		map.put("endNo", paging.getEndNo());
		
		List<EVstation_info> searchStation = mapDao.selectStationByStationName(map);
		
		if(searchStation != null)
			return searchStation;
		
		return null;
	}

	@Override
	public Paging getPaging(Paging paramData) {
		int totalCount = 0;
		int listCount = 5;
		int pageCount = 5;
		
		totalCount = mapDao.selectAllStationCnt();
		
		Paging paging = new Paging(totalCount, paramData.getCurPage(), listCount, pageCount);
		
		return paging;
	}

	@Override
	public Paging getPaging(Paging paramData, String SearchData) {
		
		int totalCount = 0;
		int listCount = 5;
		int pageCount = 5;
		
		totalCount = mapDao.selectStationByStationNameCnt(SearchData);
		
		Paging paging = new Paging(totalCount, paramData.getCurPage(), listCount, pageCount);
		
		return paging;
	}

}
