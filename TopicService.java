package com.soft863.service;

import org.springframework.ui.Model;

public interface TopicService {

	void showTopicsByPage(String pageNow, Model model);

}
