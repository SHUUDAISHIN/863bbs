package com.soft863.service.impl;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soft863.dao.UserMapper;
import com.soft863.service.UserService;
@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserMapper userMapper;
	
	public short checkUser(String name, String password) {
		short login = userMapper.selectByLogin(name, password);
		return login;
	}

	public int checkUserName(String name) {
		int result = userMapper.selectByName(name);
		return result;
	}

}
