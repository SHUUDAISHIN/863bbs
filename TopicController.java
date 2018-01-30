package com.soft863.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.soft863.service.TopicService;

@Controller
@Scope("prototype")
@RequestMapping("/topic")
public class TopicController {

	@Autowired
	private TopicService topicService;
	
	/**
	 * 分页展示用户的帖子，供其他用户点击
	 * @param pageNow
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/showTopic")
	public String getFilesShow(String pageNow,Model model,HttpSession session){
		String login = (String) session.getAttribute("name");
		if(login==null || "".equals(login)){
			return "redirect:/main.jsp";
		}
		this.topicService.showTopicsByPage(pageNow,model);
		return "bbs";
	}
}
