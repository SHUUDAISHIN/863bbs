package com.soft863.service.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.soft863.dao.FileMapper;
import com.soft863.dao.FilecommentMapper;
import com.soft863.model.File;
import com.soft863.model.Filecomment;
import com.soft863.model.Keep;
import com.soft863.model.PageBean;
import com.soft863.service.FileService;
@Service
public class FileServiceImpl implements FileService{

	@Autowired
	private FileMapper fileMapper;
	@Autowired
	private FilecommentMapper filecommentMapper;
	
	public List<File> selFilesForShow() {
		List<File> files = fileMapper.selAllFiles();
		return files;
	}

	/**
	 * 
	 */
	public void showFilesByPage(String pageNow,Model model) {
		int count = fileMapper.getFilesCount();//获取所有的数据总数
		List<Map<String,Object>> files = new ArrayList<Map<String,Object>>();
		PageBean pb = null;
		if(pageNow !=null ){
			pb = new PageBean(count, Integer.parseInt(pageNow));
		}else{
			pb = new PageBean(count,1);
		}
		files = fileMapper.selectFilesByPage(pb.getPageNow(), pb.getPageSize());
		model.addAttribute("pb", pb);
		model.addAttribute("files", files);
	}

	/**
	 * 
	 */
	public Boolean doFileUpload(MultipartFile file ,HttpServletRequest request){
		String path = request.getSession().getServletContext().getRealPath("/")+"upload/";
		String filename = file.getOriginalFilename();
		if(!checkFile(filename)){
			return false;
		}
		java.io.File targetFile = new java.io.File(path,filename);
		if(!targetFile.exists()){
			targetFile.mkdirs();
		}
		try {
			file.transferTo(targetFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return true;
	}
	
	/**
	 * 判断上传的文件类型是否符合要求
	 * @param filename
	 * @return
	 */
	private boolean checkFile(String filename){
		String suffixList = "txt,pdf,zip,rar,7z,docx,doc,xls,xlsx";
		String suffix = filename.substring(filename.lastIndexOf(".")+1, filename.length());
		if(suffixList.contains(suffix.trim().toLowerCase())){
			return true;
		}
		return false;
	}

	/**
	 * 
	 */
	@Transactional(rollbackFor=Exception.class)
	public int insertSelective(File currtFile) {
		return fileMapper.insertSelective(currtFile);
	}

	/**
	 * 
	 */
	public File selectByPrimaryKey(short fileid) {
		return fileMapper.selectByPrimaryKey(fileid);
	}

	/**
	 * 
	 */
	public List<Filecomment> getSelFileComment(short id) {
		// TODO Auto-generated method stub
		return filecommentMapper.selectByFileId(id);
	}

	
}
