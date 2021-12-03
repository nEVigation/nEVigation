package nevigation.service.face;

import nevigation.dto.Station_Dec;

public interface DecService {

	
	/**
	 * 신고글 처리 
	 * 
	 * @param report
	 */
	public void sendDec(Station_Dec dec);
}
