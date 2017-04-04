package com.hospital.web.domain;

import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Component @Data @Lazy
public class Chart {
	@Getter
	@Setter
	private String charID, treatID, docId, patID, nurID, chartContent;
}
