<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="index.css"/>
    <title>资源上传</title>
	<script src="js/jquery-3.2.1.min.js"></script>
	
	<script>
		$(function(){
			
		});
	</script>
</head>
<body>
   <jsp:include page="/headertitle.jsp" flush="true" />
	
	<div class="page_nav">
        <p>当前积分：<span>15</span></p>
    </div>

        <!-- 上传表单-->
	<div class="page_tb">
		<table>
			<thead>
				<tr>
					<th>序号</th>
					<th>积分</th>
					<th>时间</th>
					<th>来源</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td>20</td>
					<td>2017-05-08 12:23:23</td>
					<td>用户注册</td>
				</tr>
				<tr>
					<td>2</td>
					<td>8</td>
					<td>2017-01-08 15:21:32</td>
					<td>上传资源</td>
				</tr>
				<tr>
					<td>3</td>
					<td>1</td>
					<td>2017-01-08 15:21:32</td>
					<td>评论资源</td>
				</tr>
				<tr>
					<td>3</td>
					<td>-4</td>
					<td>2017-01-08 15:21:32</td>
					<td>下载资源</td>
				</tr>
				<tr>
					<td>3</td>
					<td>2</td>
					<td>2017-01-08 15:21:32</td>
					<td>发表帖子</td>
				</tr>
				
			</tbody>
		</table>
		
		<div class="panigation">
			<a>上一页</a>
			<a>1</a>
			<a>2</a>
			<a class="act">3</a>
			<a>4</a>
			<a>5</a>
			<a>下一页</a>
		</div>
	</div>
</body>

</html>