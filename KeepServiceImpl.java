package com.soft863.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soft863.dao.KeepMapper;
import com.soft863.model.Keep;
import com.soft863.service.KeepService;
@Service
public class KeepServiceImpl implements KeepService{

	@Autowired
	private KeepMapper keepMapper;

	/**
	 * 将指定收藏文件插入keep表中
	 * @param keep
	 * @return 
	 */
	public int insFileKeep(Keep keep) {
		// TODO Auto-generated method stub
		return keepMapper.insertFileKeep(keep);
	}

	/**
	 * 查询出是否当前用户收藏过这个文件
	 * @param userid
	 * @param parseShort
	 * @return
	 */
	public int selKeepByOther(Short userid, short parseShort) {
		// TODO Auto-generated method stub
		return keepMapper.selKeepByOther(userid,parseShort);
	}

}
