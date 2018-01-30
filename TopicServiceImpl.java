package com.soft863.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.soft863.dao.TopicMapper;
import com.soft863.model.PageBean;
import com.soft863.service.TopicService;
@Service
public class TopicServiceImpl implements TopicService{

	@Autowired
	private TopicMapper topicMapper;
	
	public void showTopicsByPage(String pageNow, Model model) {
		// TODO Auto-generated method stub
		int count = topicMapper.getTopicsCount();
		List<Map<String,Object>> topics = new ArrayList<Map<String,Object>>();
		PageBean pb = null ;
		if(pageNow != null){
			pb = new PageBean(count, Integer.parseInt(pageNow));
		}else {
			pb = new PageBean(count, 1);
		}
		topics = topicMapper.selectTopicsByPage(pb.getPageNow(), pb.getPageSize());
		model.addAttribute("pb", pb);
		model.addAttribute("topics", topics);
	}

}
