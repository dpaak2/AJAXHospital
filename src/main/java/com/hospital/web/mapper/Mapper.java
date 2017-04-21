package com.hospital.web.mapper;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.hospital.web.domain.Admin;
import com.hospital.web.domain.Chart;
import com.hospital.web.domain.Doctor;
import com.hospital.web.domain.Info;
import com.hospital.web.domain.Nurse;
import com.hospital.web.domain.Patient;
import com.hospital.web.domain.Person;
@Repository
public interface Mapper { /*mapper는 람다로 바꿀수 없다 myBatis와 일대일 대응이기 때문*/
	public int registPatient(Object o) throws Exception;
	public int registDoctor(Object o) throws Exception;
	public int registNurse(Object o) throws Exception;
	public int registerChart(Object o)throws Exception;
	
	//마이 바티스는 findOne과 findSome을 구분 짓지 않음
	public Patient findPatient(Map<?, ?>map) throws Exception;
	public Doctor findDoctor(Map<?, ?>map) throws Exception;
	public Nurse findNurse(Map<?, ?>map) throws Exception;
	public Admin findAdmin(Map<?,?>map) throws Exception;
	public List<Patient> findPatients(Map<?,?>map)throws Exception;
	public List<Doctor> findDoctors(Map<?,?>map)throws Exception;
	public List<Nurse> findNurses(Map<?,?>map)throws Exception;
	public List<Chart> chartList(Map<?,?>map)throws Exception;
	public int updatePatient(Patient member) throws Exception;
	public int updateDoctor(Doctor member) throws Exception;
	public int updateNurse(Nurse member) throws Exception;
	public int delete(Map<?, ?> member) throws Exception;
	public int count()throws Exception;
	public int exist(Map<?,?>map)throws Exception;
	
}
