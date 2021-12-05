package nevgation.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import nevgation.dao.face.DecDao;
import nevgation.dto.Station_Dec;
import nevgation.service.face.DecService;


@Service
public class DecServiceImpl implements DecService{
	
	@Autowired DecDao decDao;
	
	@Override
	public void sendDec(Station_Dec dec) {
		
		decDao.insertDec(dec);
	}
	
}
