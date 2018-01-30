package com.soft863.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.soft863.model.File;
import com.soft863.model.Filecomment;
import com.soft863.service.FileService;

@Controller
@Scope("prototype")
@RequestMapping("/file")
public class FileController {

	@Autowired
	private FileService fileServer;

	/**
	 * 文件分享分页展示，供其他用户下载
	 * @param pageNow
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/showfile")
	public String getFilesShow(/*@RequestParam("pageNow")*/ String pageNow,Model model,HttpSession session){
		//List<File> list = fileServer.selFilesForShow();
		String login = (String) session.getAttribute("name");
		if(login==null || "".equals(login)){
			return "redirect:/main.jsp";
		}
		this.fileServer.showFilesByPage(pageNow,model);
		return "login";
	}
	
	/**
	 * 跳转到上传资料页面
	 * @param session
	 * @return
	 */
	@RequestMapping("/toUpload")
	public String toUpload(HttpSession session){
		String login = (String) session.getAttribute("name");
		if(login==null || "".equals(login)){
			return "redirect:/main.jsp";
		}
		return "upload";
	}
	
	/**
	 * 进行上传文件操作和插入文件上传记录操作
	 * @param file
	 * @param currtFile
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping("/upload")
	public ModelAndView fileUpload(@RequestParam("file") MultipartFile file ,File currtFile,HttpServletRequest request,HttpSession session){
		ModelAndView m = null ;
		String login = (String) session.getAttribute("name");
		if(login==null || "".equals(login)){
			m = new ModelAndView("redirect:/main.jsp");
			return m ;
		}else {
			m = new ModelAndView("upload");
			currtFile.setUserId((Short) session.getAttribute("userid"));
			currtFile.setFileTime(new Date());
			currtFile.setFileUrl(request.getContextPath()+"/upload/"+file.getOriginalFilename());
			if(!file.isEmpty()){
				Boolean what = this.fileServer.doFileUpload(file,request);
				if(what){
					/*
					 * 将该条上传记录存入数据库
					 */
					int i = this.fileServer.insertSelective(currtFile);
					if(i==1){
						return m;
					}else {
						return new ModelAndView("error");
					}
				}else {
					m.addObject("warn", "你选择了未允许的文件格式，请重新选择!");
					return m;
				}
			}else {
				m.addObject("warn", "请选择一个文件!");
				return m; 
			}
		}
	}
	
	/**
	 * 具体展示指定的文件信息，提供其他功能
	 * @param fileId
	 * @return
	 */
	@RequestMapping("/fileDetail")
	public ModelAndView fileDetail(@RequestParam("fileId") String fileId){
		ModelAndView mav = new ModelAndView("detail");
		short id = Short.parseShort(fileId);
		File concrete = this.fileServer.selectByPrimaryKey(id);
		mav.addObject("file", concrete);
		//下面是跳转到另一个controller：filecomment还是直接写在这个controller？
		//为了查询出该文件下的评论信息
		List<Filecomment> fcList = this.fileServer.getSelFileComment(id);
		mav.addObject("filecommList", fcList);
		return mav;
	}
	
	
	
	/**
	 * 
	 * @param request
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="/fileDownload",produces= "application/octet-stream;charset=UTF-8")
	public ResponseEntity<byte[]> fileDownload(HttpServletRequest request,
				@RequestParam("fileSel") String fileSel) throws IOException{
		String path = request.getSession().getServletContext().getRealPath("/")+"upload/";
		java.io.File file = new java.io.File(path+java.io.File.separator+fileSel);
		String downloadFileName = new String(file.getName().getBytes("utf-8"),"iso-8859-1");
		HttpHeaders headers = new HttpHeaders();
		headers.setContentDispositionFormData("attachment", downloadFileName);
		return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),
				headers,HttpStatus.CREATED);
		/*byte[] body = null;
		InputStream is = new FileInputStream(file);
	    body = new byte[is.available()];
	    is.read(body);
	    HttpHeaders headers = new HttpHeaders();
	    headers.add("Content-Disposition", "attchement;filename=" + downloadFileName);
	    HttpStatus statusCode = HttpStatus.OK;
	    ResponseEntity<byte[]> entity = new ResponseEntity<byte[]>(body, headers, statusCode);
	    is.close();
	    return entity;*/
	}
}
