package nevigation.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import nevigation.dao.face.DecDao;
import nevigation.dto.Station_Dec;
import nevigation.service.face.DecService;

@Service
public class DecServiceImpl implements DecService{
	
	@Autowired DecDao decDao;
	
	@Override
	public void sendDec(Station_Dec dec) {
		
		decDao.insertDec(dec);
	}
	
}
