package com.soft863.controller;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.soft863.model.Keep;
import com.soft863.service.KeepService;
@Controller
@Scope("prototype")
@RequestMapping("/keep")
public class KeepController {

	@Autowired
	private KeepService keepService;
	
	/**
	 * 收藏指定文件
	 * @param fileId
	 */
	@RequestMapping("/keepFile")
	public void fileKeep(@RequestParam("fileId") String fileId,HttpSession session){
		Short userid = (Short) session.getAttribute("userid");
		Keep keep = new Keep(userid,Short.parseShort(fileId),new Date());
		int serchOne = this.keepService.selKeepByOther(userid,Short.parseShort(fileId));
		if(serchOne==0){
			int result = this.keepService.insFileKeep(keep);
			if(result>0){
				//TODO
				return;
			}else {
				
			}
		}else {
			return;
		}
		
	}
}
