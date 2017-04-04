package com.hospital.web.service;

import org.springframework.stereotype.Component;

@Component
public interface ExistService {
	public int exist(Object o)throws Exception;   /*람다로 가는길 입니다*/

}
