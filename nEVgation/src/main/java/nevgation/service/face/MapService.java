package nevgation.service.face;

import java.util.List;

import nevgation.dto.EVstation_info;

public interface MapService {
	/**
	 * EVSTATION_INFO의 정보 전체를 받아옴
	 * 
	 * @return 
	 */
	public List<EVstation_info> ShowAllStation();
	public List<EVstation_info> showSearchStation(String stationName);
	
	public int countAllStation();
}
