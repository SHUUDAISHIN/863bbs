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
<title>首页</title>
</head>
<body>
	
	<jsp:include page="/headertitle.jsp" flush="true" />

	<!-- 网站头信息-->
	<div id="nav">
		<div id="search">
			<input type="text" name="name" autocomplete="off" /> <a class="btn">搜索</a>
		</div>

		<div id="logon">
			<div class="cons">欢迎光临爱下下！</div>
			<div class="opers">
				<a class="btn" href="upload.jsp">上传资料</a>
			</div>
		</div>
		//已经登录进来了，下面该写session了

	</div>

	<!-- 网站主体 -->
	<div id="main">
		<!-- 打印出当前页的文件数据-->
		<c:forEach items="${files }" var="file">
			<div class="pro">
				<div class="img">
					<c:choose>
						<c:when test="${fn:endsWith(file.FILE_FILES, '.pdf')}">
						<img src="./images/pdf.svg" />
						</c:when>
						<c:when test="${fn:endsWith(file.FILE_FILES, '.rar')}">
						<img src="./images/rar.svg" />
						</c:when>
						<c:when test="${fn:endsWith(file.FILE_FILES, '.txt')}">
						<img src="./images/txt.svg" />
						</c:when>
						<c:when test="${fn:endsWith(file.FILE_FILES, '.zip')}">
						<img src="./images/zip.svg" />
						</c:when>
						<c:otherwise><img src="./images/zip.svg" /></c:otherwise>
					</c:choose>
				</div>
				<div class="cs">
					<div class="up">
						<a href="file/fileDetail?fileId=${file.FILE_ID }">${file.FILE_NAME }</a>
					</div>
					<div class="down">上传者：${file.USER_LOGINNAME } &#12288;
						上传时间：<fmt:formatDate value="${file.FILE_TIME }" pattern="yyyy-MM-dd HH:mm:ss"/></div>
				</div>
				<div class="arr">
					积分：<span>${file.FILE_INTEGRAL }</span>
				</div>
			</div>
		</c:forEach>

		<div class="panigation">
			<!-- 根据总页数，设置3个页码：前一个页码，当前页码和后一个页码 -->
			<c:choose>
				<c:when test="${pb.getTotalPageCount() <= 3 }">
					<c:set var="begin" value="1" />
					<c:set var="end" value="${pb.getTotalPageCount() }" />
				</c:when>
				<c:otherwise>
					<c:set var="begin" value="${pb.pageNow()-1 }" />
					<c:set var="end" value="${pb.pageNow + 1}" />
					<c:if test="${begin < 1 }">
						<c:set var="begin" value="1" />
						<c:set var="end" value="${pb.pageNow + 1}" />
					</c:if>
					<c:if test="${end > pb.getTotalPageCount() }">
						<c:set var="begin" value="${pb.getTotalPageCount()-2 }" />
						<c:set var="end" value="${pb.getTotalPageCount() }" />
					</c:if>
				</c:otherwise>
			</c:choose>
			
			<!-- 上一页点击的判断 -->
			<c:choose>
				<c:when test="${pb.pageNow - 1 > 0}">
					<a href="file/showfile?pageNow=${pb.pageNow - 1}">上一页</a>
				</c:when>
				<c:when test="${pb.pageNow - 1 <= 0}">
					<a href="file/showfile?pageNow=1">上一页</a>
				</c:when>
			</c:choose>
			
			<!-- 打印出3个页码 -->
			<c:forEach begin="${begin }" end="${end }" var="i">
				<c:choose>
					<c:when test="${i eq pb.pageNow }">
						<a href="javascript:void(0);">${i }</a>
					</c:when>
					<c:otherwise>
						<a href="file/showfile?pageNow=${i}" class="act">${i }</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
			<!-- 下一页点击的判断 -->
			<c:choose>
				<c:when test="${pb.pageNow + 1 < pb.getTotalPageCount()}">
					<a href="file/showfile?pageNow=${pb.pageNow + 1}">下一页</a>
				</c:when>
				<c:when test="${pb.pageNow + 1 >= pb.getTotalPageCount()}">
					<a href="file/showfile?pageNow=${pb.getTotalPageCount()}">下一页</a>
				</c:when>
			</c:choose>
		</div>
	</div>

	<script>
		function showWin() {
			//获取对应的DIV元素
			var div = document.getElementById("cvs2_logon");
			div.style = 'display:block';
		}

		function close_win() {
			var div = document.getElementById("cvs2_logon");
			div.style = 'display:none';
		}
	</script>

</body>

</html>