package com.hospital.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.hospital.web.domain.Admin;
import com.hospital.web.domain.Command;
import com.hospital.web.domain.Doctor;
import com.hospital.web.domain.Info;
import com.hospital.web.domain.Nurse;
import com.hospital.web.domain.Patient;
import com.hospital.web.domain.Person;
import com.hospital.web.mapper.Mapper;
import com.hospital.web.service.PersonService;

import jdk.nashorn.internal.scripts.JO;

@RestController
public class PersonController {
	private static final Logger logger = LoggerFactory.getLogger(PersonController.class);
	@Autowired
	Mapper mapper;
	@Autowired
	Doctor doctor;
	@Autowired
	Patient patient;
	@Autowired
	Nurse nurse;
	@Autowired
	PersonService personService;

	@RequestMapping(value = "/post/patient", method = RequestMethod.POST, consumes = "application/json")
	public @ResponseBody Map<?, ?> register(@RequestBody Patient patient) throws Exception {
		logger.info("PersonController() {}", "==personController-register진입");
		Map<String, String> map = new HashMap<>();

		/*
		 * switch (group) { case "patient": map = postPatient(patient);
		 * logger.info("PersonController() {}", patient + "register진입"); break;
		 * case "doctor": map = postDoctor(patient);
		 * logger.info("PersonController() {}", doctor + "register진입"); break;
		 * case "nurse": map = postNurse(patient);
		 * logger.info("PersonController() {}", nurse + "register진입"); break;
		 * case "admin": map = postAdmin(patient);
		 * logger.info("PersonController() {}", "register진입"); break; default:
		 * break;
		 */
		/* } */
		map.put("name", patient.getName());
		return map;
	}

	@RequestMapping("/get/{group}/{target}")
	public @ResponseBody Object get(@PathVariable String group, @PathVariable String target) {
		Object o = null;
		switch (group) {
		case "patient":
			logger.info("group.equals({})", group);
			o = getPatient();
			patient.setId("hong");
			patient.setName("홍길동");
			patient.setPass("1234");
			o = patient;
			break;
		case "doctor":
			logger.info("group.equals({})", group);
			o = getDoctor();
			break;
		case "nurse":
			logger.info("group.equals({})", group);
			o = getNurse();
			break;
		case "admin":
			logger.info("group.equals({})", group);
			o = getAdmin();
			break;
		}
		return o;
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST, consumes = "application/json")
	public @ResponseBody Map<?, ?> login(@RequestBody Map<String, String> paramMap) throws Exception {
		Map<String, Object> map = new HashMap<>();
		logger.info("PersonController(){} login", "enter");
		String id = paramMap.get("id");
		String pass = paramMap.get("pass");
		String name = paramMap.get("name");
		System.out.println("넘어온 아이디: " + id);
		System.out.println("넘어온 password:" + pass);
		String[] gArr = { "Patient/pat_id/" + id, "Doctor/doc_id/" + id, "Nurse/nur_id/" + id, "Admin/admin_id/" + id };
		int rs = 0;
		String target = "";
		for (int i = 0; i < gArr.length; i++) {
			String[] strArr = gArr[i].split("/");
			paramMap.put("group", strArr[0]);
			paramMap.put("idType", strArr[1]);
			paramMap.put("id", strArr[2]);
			rs = personService.exist(paramMap);
			if (rs != 0) {
				target = gArr[i];
				break;
			}
		}

		if (target.equals("")) {
			map.put("result", "fail");
		} else {
			map.put("result", "success");
			String[] arr = target.split("/");
			switch (arr[0]) {
			case "Patient":
				paramMap.put("group", arr[0]);
				paramMap.put("key", arr[1]);
				paramMap.put("value", arr[2]);
				Patient patient = personService.getPatient(paramMap);
				map.put("name", patient.getName());
				map.put("group", "고객");
				map.put("patient", personService.getPatient(paramMap));
				break;
		
			}

		}
		return map;
	}

	
	@RequestMapping(value = "/list/{group}", method = RequestMethod.POST, consumes = "application/json")
	public @ResponseBody List<?> list(@PathVariable String group, @RequestBody Command command) {
		List<?> list = new ArrayList<>();
		switch (group) {
		case "patient":
			logger.info("group.equals({})", group);
			list = getPatients();
			break;
		case "doctor":
			logger.info("group.equals({})", group);
			list = getDoctors();
			break;
		case "nurse":
			logger.info("group.equals({})", group);
			list = getNurses();
			break;
		case "admin":
			logger.info("group.equals({})", group);
			list = getAdmins();
			break;
		}
		return list;
	}

	@RequestMapping(value = "/put/{group}/", method = RequestMethod.POST, consumes = "application/json")
	public @ResponseBody Map<?, ?> put(@PathVariable String group,
			@SuppressWarnings("rawtypes") @RequestBody Person target) throws Exception {
		Map<?, ?> map = new HashMap<>();
		switch (group) {
		case "patinet":
			map = putPatient(target);
			break;
		case "doctor":
			map = putDoctor(target);
			break;
		case "nurse":
			map = putNurse(target);
			break;
		case "admin":
			map = putAdmin(target);
			break;
		}
		return map;
	}

	@RequestMapping(value = "/put/{group}/{target}", method = RequestMethod.POST, consumes = "application/json")
	public @ResponseBody Map<?, ?> delete(@PathVariable String group, @PathVariable String target,
			@RequestBody Map<?, ?> param) throws Exception {
		Map<?, ?> map = new HashMap<>();
		switch (group) {
		case "patinet":
			map = deletePatient(target);
			break;
		case "doctor":
			map = deleteDoctor(target);
			break;
		case "nurse":
			map = deleteNurse(target);
			break;
		case "admin":
			map = deleteAdmin(target);
			break;
		}
		return map;
	}

	private Map<?, ?> postPatient(Object o) {
		Map<?, ?> map = new HashMap<>();
		Person<?> person = new Person<Info>(new Patient());
		Patient patient = (Patient) person.getInfo();
		patient.getId();
		patient.setJob("환자");
		patient.getGen();
		patient.getJumin();
		patient.getName();
		return map;
	}

	private Map<?, ?> postDoctor(Object o) {
		Map<?, ?> map = new HashMap<>();
		Person<?> person = new Person<Info>(new Doctor());
		Doctor doctor = (Doctor) person.getInfo();
		return map;
	}

	private Map<?, ?> postNurse(Object o) {
		Map<?, ?> map = new HashMap<>();
		Person<?> person = new Person<Info>(new Nurse());
		Nurse nurse = (Nurse) person.getInfo();
		return map;
	}

	private Map<?, ?> postAdmin(Object o) {
		Map<?, ?> map = new HashMap<>();
		return map;
	}

	private Doctor getDoctor() {
		Doctor doctor = new Doctor();
		return doctor;
	}

	private Patient getPatient() {
		Patient patient = new Patient();
		return patient;
	}

	private Nurse getNurse() {
		Nurse nurse = new Nurse();
		return nurse;
	}

	private Admin getAdmin() {
		Admin admin = new Admin();
		return admin;
	}

	private List<Doctor> getDoctors() {
		List<Doctor> list = new ArrayList<>();
		return list;
	}

	private List<Patient> getPatients() {
		List<Patient> list = new ArrayList<>();
		return list;
	}

	private List<Nurse> getNurses() {
		List<Nurse> list = new ArrayList<>();
		return list;
	}

	private List<Admin> getAdmins() {
		List<Admin> list = new ArrayList<>();
		return list;
	}

	private Map<?, ?> putDoctor(Object target) {
		Map<?, ?> map = new HashMap<>();
		return map;
	}

	private Map<?, ?> putPatient(Object target) {
		Map<?, ?> map = new HashMap<>();
		return map;
	}

	private Map<?, ?> putNurse(Object target) {
		Map<?, ?> map = new HashMap<>();
		return map;
	}

	private Map<?, ?> putAdmin(Object target) {
		Map<?, ?> map = new HashMap<>();
		return map;
	}

	private Map<?, ?> deleteDoctor(String target) {
		Map<?, ?> map = new HashMap<>();
		return map;
	}

	private Map<?, ?> deletePatient(String target) {
		Map<?, ?> map = new HashMap<>();
		return map;
	}

	private Map<?, ?> deleteNurse(String target) {
		Map<?, ?> map = new HashMap<>();
		return map;
	}

	private Map<?, ?> deleteAdmin(String target) {
		Map<?, ?> map = new HashMap<>();
		return map;
	}

}
