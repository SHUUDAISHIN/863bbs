package com.soft863.service;

import com.soft863.model.Keep;

public interface KeepService {

	/**
	 * 将指定收藏文件插入keep表中
	 * @param keep
	 * @return 
	 */
	int insFileKeep(Keep keep);

	/**
	 * 查询出是否当前用户收藏过这个文件
	 * @param userid
	 * @param parseShort
	 * @return
	 */
	int selKeepByOther(Short userid, short parseShort);
}
