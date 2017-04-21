package com.hospital.web.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.jni.File;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hospital.web.domain.Chart;
import com.hospital.web.domain.Doctor;
import com.hospital.web.domain.Nurse;
import com.hospital.web.domain.Patient;
import com.hospital.web.mapper.Mapper;
import com.hospital.web.service.ChartService;
import com.hospital.web.service.PersonService;


@SessionAttributes("storage")
@RestController
public class ChartController{
	private static final Logger logger = LoggerFactory.getLogger(ChartController.class);
	@Autowired Mapper mapper;
	@Autowired Patient patient;
	@Autowired Doctor doctor;
	@Autowired Nurse nurse;
	@Autowired ChartService chartServie;
	@Autowired PersonService personService;
	@Autowired Chart chart;
	@RequestMapping(value="/get/chart",method=RequestMethod.POST, consumes="application/json")
	public @ResponseBody Map<?,?> getChart( @RequestBody Patient patient) throws Exception {
		logger.info("ChartController getChart(){}", "진입");
		Map<String, Object> map = new HashMap<>();
		map.put("value", patient.getId());
		List<Chart> list= chartServie.chartList(map);
		if(list.isEmpty()){
			map.put("result", "fail");
		}else{
			map.put("result", "success");
			map.put("group", "Patient");
			map.put("key", "pat_id");
			map.put("patient",list.get(0));
			map.put("list", list);
		}
		return map;
	}
	@RequestMapping(value="/post/chart/id",method=RequestMethod.POST)
	public @ResponseBody Map<?, ?> sessionChartId(
			@RequestBody Chart c,HttpSession session)throws Exception{
		Map<String , Object>map=new HashMap<>();
		if(c.getChartId().equals("")){
			session.setAttribute("chartId", c.getChartId());
			map.put("result", "success");
		}else{
			map.put("result", "fail");
		}
		return map;
	} 
	
	@RequestMapping(value="/post/chart/image", method=RequestMethod.POST)
	public @ResponseBody Map<?, ?>fileUpload(MultipartHttpServletRequest request,HttpSession session)throws Exception{
		logger.info("ChartController fileUpload(){}", "진입");
		Map<String , Object> map=new HashMap<>();
		Iterator<String> it=request.getFileNames();
		if(it.hasNext()){
			MultipartFile file=request.getFile(it.next());
			logger.info("fileUpload result:", "success");
			logger.info("upload file name:", file.getName());
			logger.info("upload file size:", file.getSize());
			logger.info("upload file exist:", file.isEmpty());
			logger.info("upload file original name:",file.getOriginalFilename());
			String rootPath=request.getSession().getServletContext().getRealPath("/");
			String uploadPath="/resources/img/";
			String filename=file.getOriginalFilename();
			chart.setChartContents(filename);
			chart.setChartId(session.getAttribute("storage").toString());
			logger.info("chart id:{}", session.getAttribute("storage").toString());
			session.invalidate();
			int rs=chartServie.registerChart(chart);
			if(rs==1){
				java.io.File dest=new java.io.File(rootPath+uploadPath+filename);
				file.transferTo(dest);
					map.put("result", "success");
			}else{
				logger.info("file upload result:","fail");
				map.put("result", "fail");
				}
			}else{
				logger.info("file upload result:","fail");
				
				map.put("chartContent", chart);
			}
		return map;
	}
}
