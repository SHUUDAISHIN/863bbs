<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" type="text/css" href="css/calenderstyle.css"/> -->
<link rel="stylesheet" type="text/css" href="css/time.css"/>
<script type="text/javascript">


</script>
</head>
<body>
<!-- 
	使用的是其他人写的插件，实现jQuery日历插件
 -->
<span>请选择时间</span><br>
<input type="text" id="testc" maxlength="20" size="20">
<span>请选择具体时间</span><br>
<input type="text" id="testc2" maxlength="20" size="20">
<script type="text/javascript" src="js/calender2.js"></script>
<script type="text/javascript" src="js/addTime.js"></script>
<script type="text/javascript" src="js/iRange.js"></script>
<script>
;(function(){
	calender('#testc').init({format : 'yyyy-MM-dd',
                date : [2017,12,12],
		button : true
	},function(date){
		this.value= date
	});
})();
</script>
</body>
</html>