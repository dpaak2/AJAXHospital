package com.hospital.web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/board")
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(PatientController.class);

	@RequestMapping("/list")
	public String goList(){
		logger.info("BoardController -goList() {}","ENTER"); /*최소한 여기까진 들어왔다 라는걸 보여줌 */
			return "public:board/containerList";
	}
	@RequestMapping("/find")
	public String find(@RequestParam(value="search",required=false)String search,
					  @RequestParam(value="pageNO",defaultValue="1")String pageNO){ /*- paging때 쓴다*/
		logger.info("BoardController -find() {}","ENTER"); /*최소한 여기까진 들어왔다 라는걸 보여줌 */
	/*	if(id==nul){}*/
			return "public:board/containerList";
	}

}
