package nevgation.dao.face;

import java.util.List;
import java.util.Map;

import nevgation.dto.EVstation_info;
import nevgation.util.Paging;

public interface MapDao {
	public List<EVstation_info> selectAllStation(Paging paging);
	//public List<EVstation_info> selectStationByChargeType(int chargeType);
	public List<EVstation_info> selectStationByStationName(Map<String, Object> Data);

	public int selectAllStationCnt();
	public int selectStationByStationNameCnt(String stationName);
}


