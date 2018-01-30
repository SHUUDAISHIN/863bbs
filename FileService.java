package com.soft863.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.soft863.model.File;
import com.soft863.model.Filecomment;
import com.soft863.model.Keep;

public interface FileService {

	List<File> selFilesForShow();
	
	/**
	 * 分页展示文件
	 * @param pageNow
	 * @param model
	 */
	void showFilesByPage(String pageNow,Model model);

	/**
	 * 上传文件到服务器上的操作
	 * @param file
	 * @param request
	 * @return
	 */
	Boolean doFileUpload(MultipartFile file, HttpServletRequest request);

	/**
	 * 添加上传文件信息的记录
	 * @param currtFile
	 * @return
	 */
	int insertSelective(File currtFile);

	/**
	 * 根据文件id获取文件具体信息
	 * @param fileid
	 * @return
	 */
	File selectByPrimaryKey(short fileid);

	/**
	 * 根据文件id获取其下的该文件的评论
	 * @param id
	 * @return
	 */
	List<Filecomment> getSelFileComment(short id);

}
