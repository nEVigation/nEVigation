package nevgation.service.face;

import java.util.List;

import nevgation.dto.EVstation_info;
import nevgation.util.Paging;

public interface MapService {
	/**
	 * EVSTATION_INFO의 정보 전체를 받아옴
	 * 
	 * @return 
	 */
	public List<EVstation_info> ShowAllStation(Paging paging);
	public List<EVstation_info> showSearchStation(String stationName, Paging paging);
	public Paging getPaging(Paging paramData);
	public Paging getPaging(Paging paramData, String SearchData);
	
	public int countAllStation();
}
