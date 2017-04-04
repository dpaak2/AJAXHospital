package com.hospital.web.domain;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
@Component @Data @Lazy
public class Doctor extends Info{
	@Getter@Setter
	private String majorTreat, position; /*디비에 종속 되지 않을것*/
//일대 다 구조이기 때문이다 , 리스트로 가지고 와야 한다 
	
	
	@Override
	public String getGroup() {
		return "Doctor";
	}

}
