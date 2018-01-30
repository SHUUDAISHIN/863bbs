<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<base href="<%=basePath%>">
<meta content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="./css/index.css" />
	<script src="./js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="./js/upload.js"></script>
    <title>资源上传</title>
</head>
<body>
   <jsp:include page="/headertitle.jsp" flush="true" />
	<p></p>
	<div></div>
	
    <!-- 网站主体 -->
    <div id="main">
        <!-- 上传表单-->
        <div class="upload">
            <p>上传资源</p>
            <hr />
            <form action="" id="myform" name="myform" method="post" enctype="multipart/form-data">
                <span>
                    <label>选择文件：</label>
                    <input id="filename" name="fileFiles" class="upt" type="text" readonly="readonly" />
                    <input id="sfile" class="upt" type="file" name="file" onchange="selectFile(this);" />
                    <b>*</b>
                    <b id="msg">${warn }</b>
                    <b>文件格式可以是txt、pdf、zip、rar等后缀</b>
                </span>
                <span>
                    <label>资源名称：</label>
                    <input id="rsname" class="upt" type="text" name="fileName" value=""  maxlength="10"/>
                    <b>*</b>
                    <b id="msg2"></b>
                    <b>名称由字母、数字、汉字任意组成</b>
                </span>
                <span>
                    <label>资源类型：</label>
                    <select class="upt" name="fileType">
                        <option >文本文件</option>
                        <option>电子文件</option>
                        <option>压缩文件</option>
                    </select>
                </span>
                <span>
                    <label>关键词：</label>
                    <input id="keyword" class="upt" type="text" name="fileCrucial" value="" />
                    <b>*</b>
                    <b id="msg3"></b>
                    <b>多个关键词用空格分割,关键词不能超过5个</b>
                </span>
                <span>
                    <label>资源分：</label>
                    <select class="upt" id="sel" name="fileIntegral">
                        <option>0</option>
                        <option>1</option>
                        <option>2</option>
                        <option selected="selected">3</option>
                        <option>4</option>
                        <option>5</option>
                        <option>6</option>
                        <option>7</option>
                        <option>8</option>
                        <option>9</option>
                        <option>10</option>
                    </select>
                </span>
                <span class="d_span">
                    <label>资源描述：</label>
                    <textarea name="fileDetailed" class="area" placeholder="描述不支持HTML标签；详细的资源描述有机会获得我们的推荐，更有利于他人下载，赚取更多积分。如资源描述不清，有可能审核不通过。"></textarea>
                    <b>*</b>
                    <b id="msg4"></b>
                    <b></b>
                </span>
                <span>
                    <label class="agree">
                        <input type="checkbox" value="1" class="protocol" />
                        同意爱下下资源上传协议
                    </label>

                </span>

                <span><label class="btn"><input type="button" value="提交" onclick="Uploading();"/></label></span>
            </form>
        </div>
        <!-- 公告 -->
        <div class="advice">
            <p class="title">上传须知</p>
            <hr />
            <p><span>*</span>如涉及侵权内容,您的资源将被移除</p>
            <p><span>*</span>请勿上传小说、mp3、图片等与技术无关的内容.一旦发现将被删除</p>
            <p><span>*</span>请勿在未经授权的情况下上传任何涉及著作权侵权的资源，除非该资源完全由您个人创作</p>
            <p><span>*</span>点击上传资源即表示您确认该资源不违反资源分享的使用条款，并且您拥有该资源的所有版权或者上传资源的授权</p>
        </div>
    </div>

    
</body>

</html>