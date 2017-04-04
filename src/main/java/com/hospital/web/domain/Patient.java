package com.hospital.web.domain;

import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;

import lombok.Data;

@Component @Data @Lazy

public class Patient extends Info {
	private String job, jumin, addr,docID,nurID; /* DB대로 팔로우 하지 않기 위해 팻을뺌 */
	private Doctor doctor;
	private Nurse nurse;

	@Override
	public String getGroup() {
		return "Patient"; /* db이름과 일치시키는것이 좋다 */
	}

}
