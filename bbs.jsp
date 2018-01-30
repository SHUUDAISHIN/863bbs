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
    <title>论坛</title>
</head>
<body>
    <jsp:include page="/headertitle.jsp" flush="true" />

    <!-- 网站主体 -->
    <div id="main">
        <div class="bbs">
			<a class="btn" href="javascript:void(0)" onclick="document.getElementById('tiezi').scrollIntoView();">发帖</a>
			<hr />
			
			<c:forEach items="${topics }" var="topic">
				<div class="tz">
				<div class="lf">
					<span></span>
					<span>${topic.TOPIC_TYPE }</span>
					<a href="">${topic.TOPIC_TITLE }</a>
				</div>
				<div class="rf">
					<div>
						<span>${topic.SEND_NAME }</span>
						<span>${topic.TOPIC_TIME }</span>
					</div>
					<div>
						<span>${topic.REPLY_NAME }</span>
						<span>${topic.TC_TIME }</span>
					</div>
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
					<a href="topic/showTopic?pageNow=${pb.pageNow - 1}">上一页</a>
				</c:when>
				<c:when test="${pb.pageNow - 1 <= 0}">
					<a href="topic/showTopic?pageNow=1">上一页</a>
				</c:when>
			</c:choose>
			
			<!-- 打印出3个页码 -->
			<c:forEach begin="${begin }" end="${end }" var="i">
				<c:choose>
					<c:when test="${i eq pb.pageNow }">
						<a href="javascript:void(0);">${i }</a>
					</c:when>
					<c:otherwise>
						<a href="topic/showTopic?pageNow=${i}" class="act">${i }</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
			<!-- 下一页点击的判断 -->
			<c:choose>
				<c:when test="${pb.pageNow + 1 < pb.getTotalPageCount()}">
					<a href="topic/showTopic?pageNow=${pb.pageNow + 1}">下一页</a>
				</c:when>
				<c:when test="${pb.pageNow + 1 >= pb.getTotalPageCount()}">
					<a href="topic/showTopic?pageNow=${pb.getTotalPageCount()}">下一页</a>
				</c:when>
			</c:choose>
			</div>
			
			<a class="btn" href="javascript:void(0)" onclick="document.getElementById('tiezi').scrollIntoView();">发帖</a>
			<hr />
			
			<!-- 开始发帖-->
			<!-- 上传表单-->
			<div class="bbs_tz" id="tiezi">
				<p>快速发帖</p>
				<hr />
				<form action="" method="post">
					<span>
						<select>
							<option>技术专题</option>
							<option>闲聊专题</option>
						</select>
						<input type="text" class="upt" placeholder="请输入帖子标题"/>
					</span>
					<span>
						<textarea  class="area">http://www.mala.cn/forum.php?mod=forumdisplay&fid=5&filter=author&orderby=dateline</textarea>
					</span>
					<span><a class="btn">发表帖子</a></span>
				</form>
			</div>
			
		</div>
		
    </div>

    
</body>

</html>