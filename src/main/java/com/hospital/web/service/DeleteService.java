package com.hospital.web.service;

import java.util.Map;

@FunctionalInterface
public interface DeleteService {
	public int execute(Map<?, ?> map) throws Exception;
}
