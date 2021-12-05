package nevgation.service.face;

import nevgation.dto.Station_Dec;

public interface DecService {

	
	/**
	 * 신고글 처리 
	 * 
	 * @param report
	 */
	public void sendDec(Station_Dec dec);
}
