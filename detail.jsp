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
    <title>详情</title>
	
	<script>
		$(function(){
		
			$("div.star span").mouseover(function(){
				$(this).addClass('act').prevAll("span").addClass("act");
				$(this).nextAll("span").removeClass("act");
			});
			
			$(".rf a:first").removeAttr('href');
			
			
		});
		function gokeep(){
			$.ajax({
				///
			});
		}
		
		
		
	</script>
</head>
<body>
    
    <jsp:include page="/headertitle.jsp" flush="true" />

    <!-- 网站主体 -->
    <div id="main">
        <!-- 定义详细目录-->
        <div id="detail">
            <div class="title"> <!-- 主信息-->
                <div class="img">
                    <c:choose>
						<c:when test="${fn:endsWith(file.fileFiles, '.pdf')}">
						<img src="./images/pdf.svg" />
						</c:when>
						<c:when test="${fn:endsWith(file.fileFiles, '.rar')}">
						<img src="./images/rar.svg" />
						</c:when>
						<c:when test="${fn:endsWith(file.fileFiles, '.txt')}">
						<img src="./images/txt.svg" />
						</c:when>
						<c:when test="${fn:endsWith(file.fileFiles, '.zip')}">
						<img src="./images/zip.svg" />
						</c:when>
						<c:otherwise><img src="./images/zip.svg" /></c:otherwise>
					</c:choose>
                </div>
                <div class="cons">
                    <div>
                        <label>${file.fileName }</label>
                    </div>
                    <div>
                        <label><fmt:formatDate value="${file.fileTime }" pattern="yyyy-MM-dd HH:mm:ss"/>  上传大小：12.69MB</label>
                        <c:forEach items="${fn:split(file.fileCrucial,',')}" var="crucial">
                        	<span>${crucial }</span>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div class="desc"> <!-- 信息描述-->
                ${file.fileDetailed }
            </div>
            <div class="msg"> <!-- 评价信息-->
                <span class="act">★</span>
                <span class="act">★</span>
                <span class="act">★</span>
                <span class="act">★</span>
                <span>★</span>
            </div>
            <div class="oper"> <!-- 下载操作-->
                <span>所需积分：<b>${file.fileIntegral }</b></span>
                <span>下载次数：<b>100</b></span>
                <span>
                    <a class="btn" href="file/fileDownload?fileSel=${file.fileFiles }">下载</a>
					<a class="btn" href="keep/keepFile?fileId=${file.fileId }" onclick="gokeep()">收藏</a>
                </span>
            </div>
        </div>
        <div id="comment">
            <div class="title">
            
                评论：<span>共有${fn:length(filecommList)}条</span>
                <hr />
            </div>
            <!--每一条评论 -->
            <c:forEach items="${filecommList }" var="fcc" varStatus="status">
            <div class="cons">
                <div class="img">
                    <img src="" />
                </div>
                <div class="cmt">
                    <div>
                        <span class="author">${fcc.userId }</span>
                        <span class="timer"><fmt:formatDate value="${fcc.fcTime }" pattern="yyyy-MM-dd HH:mm:ss"/></span>
                        <span class="star">
                            <span class="act">★</span>
                            <span class="act">★</span>
                            <span class="act">★</span>
                            <span>★</span>
                            <span>★</span>
                        </span>
                    </div>

                    <div class="msg">
                        <dt>${fcc.fcContent }</dt>
                    </div>
                </div>
            </div>
			</c:forEach>

        </div>

        <!-- 开始评论-->
        <div id="mycomments">
            <div>
                <span>我的评论</span>
                <hr />

                <textarea placeholder="可以留下您的宝贵意见哟"></textarea>
                <div class="star"> <!-- 评价信息-->
                    <span>★</span>
                    <span>★</span>
                    <span>★</span>
                    <span>★</span>
                    <span>★</span>
                </div>
                <a class="btn">评论</a>
            </div>


        </div>
    </div>

</body>

</html>