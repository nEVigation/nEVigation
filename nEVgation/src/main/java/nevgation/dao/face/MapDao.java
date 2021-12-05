package nevgation.dao.face;

import java.util.List;

import nevgation.dto.EVstation_info;

public interface MapDao {
	public List<EVstation_info> selectAllStation();
	//public List<EVstation_info> selectStationByChargeType(int chargeType);
	public List<EVstation_info> selectStationByStationName(String stationName);
	
	public int selectAllStationCnt();
}


