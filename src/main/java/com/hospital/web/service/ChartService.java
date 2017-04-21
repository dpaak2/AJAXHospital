package com.hospital.web.service;

import java.util.List;
import java.util.Map;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hospital.web.domain.Chart;
import com.hospital.web.mapper.Mapper;

@Service
public class ChartService {
	private static final Logger logger = org.slf4j.LoggerFactory.getLogger(ChartService.class);
	@Autowired
	Mapper mapper;
	@Transactional     /*쿼리문 실행되면 에러나거나 취소되면 롤백이 되는 기능이다 AOP가 된다*/
	@SuppressWarnings("unchecked")
	public List<Chart> chartList(Map<?, ?> paramMap) throws Exception {
		logger.info("chartService-chartList(){}","ENTER");
		IGetService service = (map) -> mapper.chartList(map);
		List<Chart> list= (List<Chart>) service.execute(paramMap);
		logger.info("chartService-chartList(){}",list);
		return list;
	}
	public int registerChart(Chart o)throws Exception{
		IPostService service= (param)->mapper.registerChart(param);
		return service.execute(o);
	}
}
