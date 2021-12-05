package nevgation.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import nevgation.dao.face.MapDao;
import nevgation.dto.EVstation_info;
import nevgation.service.face.MapService;

@Service
public class MapServiceImpl implements MapService {

	@Autowired
	private MapDao mapDao;
	
	@Override
	public List<EVstation_info> ShowAllStation() {
		List<EVstation_info> allStation = mapDao.selectAllStation();
		
		if(allStation != null)
			return allStation;
		
		return null;
	}

	@Override
	public int countAllStation() {
		return mapDao.selectAllStationCnt();
	}

	@Override
	public List<EVstation_info> showSearchStation(String stationName) {
		List<EVstation_info> allStation = mapDao.selectStationByStationName(stationName);
		
		if(allStation != null)
			return allStation;
		
		return null;
	}

}
