package com.hospital.web.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.hospital.web.domain.Doctor;
import com.hospital.web.domain.Info;
import com.hospital.web.domain.Nurse;
import com.hospital.web.domain.Patient;
import com.hospital.web.domain.Person;
import com.hospital.web.domain.Enums;
import com.hospital.web.mapper.Mapper;
import com.hospital.web.service.IDeleteService;
import com.hospital.web.service.IGetService;


@RestController
@SessionAttributes("permission")
public class PermissionController {
	private static final Logger logger = LoggerFactory.getLogger(PermissionController.class);
	@Autowired	Mapper mapper;

	@RequestMapping("/test/login")
	public String login() {
		logger.info("Permission -login() {}",
				"ENTER"); /* goLogin이라는 method안으로 진입하였다 */
		logger.info("Permission -login() {}", "ENTER");
		return "public:common/loginForm";
	}

	@RequestMapping(value = "/{permission}/login", method = RequestMethod.POST)
	public String goLogin(@RequestParam("id") String id, @RequestParam("password") String password,
			/** 이미 값을 주입받았다 ,그냥 존재한다 */
			@PathVariable String permission, HttpSession session, Model model) throws Exception {
		logger.info("Permission -goLogin() {}",
				"POST"); /* goLogin이라는 method안으로 진입하였다 */
		logger.info("Permission -id, pw () {}", id + "," + password);
		String movePostion = "";
		switch (permission) {
		case "patient":
			Person<?> person = new Person<Info>(new Patient());
			Patient patient = (Patient) person.getInfo();
			patient.setId(id);
			patient.setPass(password);
			Map<String, Object> map = new HashMap<>();
			map.put("group", patient.getGroup());
			map.put("key", Enums.PATIENT.val());
			map.put("value", id);
			/* ReadService exist=(Map<?,?>paramMap)->mapper.exist(paramMap); */

			/*
			 * ReadService exist=new ReadService() {
			 * 
			 * @Override public Object execute(Map<?, ?> map) throws Exception {
			 * 
			 * return mapper.exist(map); } };
			 */

			IGetService exist = (amap) -> mapper.exist(amap); /* 정의만 된것 */

			Integer count = (Integer) exist.execute(map);/* mapper에 있는 exit를 실행된다 */

			logger.info("Dose id exsit at DB? () {}", count);

			if (count == 0) {
				logger.info("DB RESULT: {}", "ID dose not exsit");
				movePostion = "public:common/loginForm";
			} else {
				/* map.clear(); map을 재활용할꺼임! */

				/*
				 * ReadService findPatient2 = new ReadService(){
				 * 
				 * @Override public Object execute(Object o) throws Exception {
				 * return mapper.findPatient(map); } };
				 */
				IGetService findPatient = (Map<?, ?> paramMap) -> mapper
						.findPatient(map); /* 리턴은 무조건 하는거다 */
				logger.info("DB RESULT: {}", "success");
				patient = (Patient) findPatient.execute(map);
				if (patient.getPass().equals(password)) {
					session.setAttribute("permission", patient);
					model.addAttribute("user",patient); /* patient에 patient객체를 넣어줌 */
					movePostion = "patient:patient/containerDetail";
				} else {
					logger.info("DB RESULT: {}", "password not match");
					movePostion = "public:common/loginForm";

				}
				patient = (Patient) findPatient.execute(map);
			}
			break;

		case "doctor":
			Person<?> docPerson = new Person<Info>(new Doctor());
			Doctor doctor = (Doctor) docPerson.getInfo();
			doctor.setId(id);
			doctor.setPass(password);
			map = new HashMap<>();
			map.put("group", doctor.getGroup());
			map.put("key", Enums.DOCTOR.val());
			map.put("value", id);
			/*
			 * ReadService exist =new ReadService() {
			 * 
			 * @Override public Object execute(Map<?, ?> map) throws Exception {
			 * return mapper.exist(docMap); } };
			 */
			IGetService exitDoctor = (o) -> mapper.exist(o);
			count = mapper.exist(map);
			
			/* Integer docCount = (Integer) docEx.execute(id); */
			logger.info("ID exist? : {}", count);
			if (count == 0) {
				logger.info("DB RESULT : {}", "ID not exist");
				movePostion = "public:common/loginForm";
			} else {
				IGetService findDoctor = (doctMap) -> mapper.findDoctor(doctMap);
				doctor = (Doctor) findDoctor.execute(map);
				if (doctor.getPass().equals(password)) {
					logger.info("DB RESULT : {}", "success");
					session.setAttribute("permission", doctor);
					model.addAttribute("doctor", doctor);
					movePostion = "doctor:doctor/containerDetail";
				} else {
					logger.info("DB RESULT : {}", "password not match");
					movePostion = "public:common/loginForm";
				}
			}
			break;
		case "nurse":
			Person<?> nurPerson = new Person<Info>(new Nurse());
			Nurse nurse = (Nurse) nurPerson.getInfo();
			nurse.setId(id);
			nurse.setPass(password);
			Map<String, Object> nurMap = new HashMap<>(); /* nurse 값을 받아주는곳 */
			nurMap.put("group", nurse.getGroup());
			nurMap.put("key", Enums.NURSE.val());
			nurMap.put("value", id);
			IGetService exsit = (nmap) -> mapper.exist(nmap);
			Integer nurCount = (Integer) mapper.exist(nurMap);
			logger.info("ID exist? : {}", nurCount);

			if (nurCount == 0) {
				logger.info("DB RESULT : {}", "ID not exist");
				movePostion = "public:common/loginForm";
			} else {
				IGetService findNurse = (nurseMap) -> mapper.findDoctor(nurseMap);
				nurse = (Nurse) findNurse.execute(nurMap);
				if (nurse.getPass().equals(password)) {
					logger.info("DB RESULT : {}", "success");
					session.setAttribute("permission", nurse);
					model.addAttribute("nurse", nurse);
					movePostion = "nurse:nurse/containerList";
				} else {
					logger.info("DB RESULT : {}", "password not match");
					movePostion = "public:common/loginForm";
				}
			}
		break;
	}

	return movePostion;

	}
	@RequestMapping("/logout")
	public String logout(HttpSession session) { /* logout */
		session.invalidate(); /* session에 있는값을 다 지우는것 */
		return "redirect:/"; /*
								 * 다른곳을 보내는것 (/)를 사용하게 되면 경로를 알아서 쫒아간다 home
								 * controller
								 */
	}
	
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String update(@RequestParam(value="pageNo",defaultValue="1") int pageNO,
			@RequestParam(value="id",defaultValue="none")String id,
			@RequestParam(value="pass",defaultValue="none")String pass,
			@RequestParam(value="name",defaultValue="none")String name,
			@RequestParam(value="addr",defaultValue="none")String addr,
			@RequestParam(value="nurID",defaultValue="none")String nurID,
			@RequestParam(value="docID",defaultValue="none")String docID,
			@RequestParam(value="jumin",defaultValue="none")String jumin,
			@RequestParam(value="gen",defaultValue="none")String gen,
			@RequestParam(value="phone",defaultValue="none")String phone,
			@RequestParam(value="email",defaultValue="none")String email,
			@RequestParam(value="job",defaultValue="none")String job,
			HttpSession session,Model model
			)throws Exception{
		String resultPage="";
		Person<?> person=new Person<Info>(new Patient());
		Patient patient=(Patient) person.getInfo();
		patient=(Patient) session.getAttribute("permission");
		patient.getId();
		logger.info("PermissionController(){}",patient.getId()+"pat_id enter success");
		patient.setPass(pass);
		patient.getGen();
		patient.setEmail(email);
		patient.setJob("환자");
		patient.getJumin();
		patient.setPhone(phone);
		patient.setDocID(docID);
		patient.setNurID(nurID);
		patient.setAddr(addr);
		patient.getName();
		logger.info("PermissionController(){}","==Patient update enter==");
		int result=mapper.updatePatient(patient);
		if(result==0){
			resultPage= "patient:patient/updateForm";
		}else{
			resultPage="patient:patient/containerDetail";
			logger.info("PermissionController-result==0","==Patient modified success==");

		}
		session.setAttribute("permission", patient);
		return resultPage;
	}
	@RequestMapping(value="/delete",method= RequestMethod.POST)
	public String delete(HttpSession session,
			@RequestParam("id") String id, @RequestParam("password") String password)throws Exception{
		String goDeletePage="";
		Person<?> person = new Person<Info>(new Patient());
		Patient patient= (Patient) person.getInfo();
		patient= (Patient) session.getAttribute("permission");
		String temp= patient.getId();
		logger.info("PermissinoControleer(){}","==tmep값:"+temp+"==delete enter");
		if(temp.equals(id)){
			patient.setId(id);
		}else{
			goDeletePage="patient:patient/deletForm";
		}
		patient.setPass(password);
		logger.info("PermissionController(){}",patient+"==delete DB가기 직전==");
		Map<String,Object> map=new HashMap<>();
		map.put("group", patient.getGroup());
		map.put("key", Enums.PATIENT.val());
		map.put("value", id);
		IDeleteService deletePatient=(patMap)->mapper.delete(patMap);
		int result=deletePatient.execute(map);
		if(result==0){
			goDeletePage= "patient:patient/deleteForm";
		}else{
			session.invalidate();
			goDeletePage="public:common/byePage";
		}
	return goDeletePage;
	}
	
}
