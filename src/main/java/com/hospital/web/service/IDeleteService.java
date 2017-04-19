package com.hospital.web.service;

import java.util.Map;

@FunctionalInterface
public interface IDeleteService {
	public int execute(Map<?, ?> map) throws Exception;
}
