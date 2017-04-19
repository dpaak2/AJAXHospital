package com.hospital.web.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.hospital.web.composite.Complex;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
//	@Autowired ContextDTO context;
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Model model) {
		logger.info("Welcome{}!!","home"); /*method�� �ش�? */
 		model.addAttribute("context",Complex.ContextFactory.cerate());
		return "index";
	}
	@RequestMapping(value="/home")
	public String home(){
		logger.info("진입: ","success");
		return "public:common/container";
	}
	@RequestMapping(value="/permission/form")   /*notiles 쓰는곳*/
	public String login(){
		return "common/permission.jsp";
	}
}
