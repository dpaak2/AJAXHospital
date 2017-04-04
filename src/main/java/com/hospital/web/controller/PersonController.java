package com.hospital.web.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hospital.web.domain.Admin;
import com.hospital.web.domain.Command;
import com.hospital.web.domain.Doctor;
import com.hospital.web.domain.Info;
import com.hospital.web.domain.Nurse;
import com.hospital.web.domain.Patient;
import com.hospital.web.domain.Person;
import com.hospital.web.mapper.Mapper;

@Controller

public class PersonController {
	private static final Logger logger = LoggerFactory.getLogger(PatientController.class);
	@Autowired	Mapper mapper; /*이 안에 있는 지역변수에 공급해주라는 뜻 */

	@RequestMapping(value = "/register/{type}", method = RequestMethod.POST) 
	/*등록하러 왔다 등록하는 사람은 $ type} 전부 경로로 제어 한다. ,get방식과 Post방식도  쓸수  있게  됨 */
	public String register(@PathVariable String type,
			@RequestBody Map<String, Object> map, /* JSON을 map으로 바꿔주는것 ,
													 * map을 사용하면 화면에서 어떤 빈을 썼는지
													 * 생각할 필요가 없다.
													 *//* 범용적으로 쓰는 패턴 *//*
																	 * @ModelAttribute
																	 * Patient
																	 * patient
																	 */
			/*컨맨드 객체를 파라미터로 넘긴다*/
			Command command) throws Exception {
		String movePosition = "";
		logger.info("PersonController -register() {}", "ENTER");
		logger.info("PersonController -param value check () {}", "ENTER");
		command.process(map);

		if (type.equals("")) {
			type = "patient";
		}
		map.put("type", type); /* why? */
		Person<?> person = command.process(map).getPersonInfo();/*이안에는 온갖 모든것이 다 저장된다 , */
		/*
		 * command가 진행을 해서 person 타입의 person으로 받을수 있다 , 내부적으로 알아서 command에 의해서
		 * 결정되고 mybatis로
		 */
		int result = 0;
		switch (map.get("type").toString()) {
		case "patient":
			result = mapper.registerPatient(person);
			break;
		case "doctor":
			person = new Person<Info>(new Doctor());
			Doctor doctor = (Doctor) person.getInfo();
			result = mapper.registerPatient(person);
			break;
		case "Nurse":
			person = new Person<Info>(new Nurse());
			Nurse nurse = (Nurse) person.getInfo();
			result = mapper.registerPatient(person);
			break;
		case "admin":
			person = new Person<Info>(new Admin());
			Admin admin = (Admin) person.getInfo();
			result = mapper.registerPatient(person);
			break;

		default:
			break;
		}

		if (result == 1) {
			return "public:common/loginForm";
		} else {
			return "redirect:/{" + type + "}/registForm";
		}
	}

	@RequestMapping("/detail/{docID}") /* docID-id 가 된다 */
	public String detail(@PathVariable String docID) { /* 표시는해줘야 한다 */
		logger.info("PersonController-detail() {}", "ENTER");
		// docID=request.getParameter("id"); - 내가 가지고 오는것은
		if (docID.equals("")) {
			return "redirect:/{permission}/login";
		} /* session에 값이 있는지 체크해야 한다. */
		return "doctor:doctor/containerDetail";
	}
}
