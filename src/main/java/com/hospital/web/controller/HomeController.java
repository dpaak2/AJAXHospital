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
import com.hospital.web.domain.Context;

/**
 * Handles requests for the application home page.
 */
@Controller
@SessionAttributes("context")
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
//	@Autowired ContextDTO context;
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(HttpSession session) {
		
		logger.info("Welcome{}!!","home"); /*method�� �ش�? */

 		session.setAttribute("context",Complex.ContextFactory.cerate());
		return "index";
	}
	
	@RequestMapping()
	public String home(){
		return "public:common/container";
	}
}
