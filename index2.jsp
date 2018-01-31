<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js2/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js2/jquery.ui.core.min.js"></script>
<script type="text/javascript" src="js2/jquery.ui.datepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/jquery-ui-1.9.2.custom.min.css">
<script type="text/javascript" src="js2/jquery.ui.datepicker-zh-CN.min.js"></script>
<script language="javascript" type="text/javascript">
	$(function() {
		$("#datepicker").datepicker({
			dateFormat : 'yy-mm-dd', //更改时间显示模式  
			changeMonth : true, //是否显示月份的下拉菜单，默认为false  
			changeYear : true, //是否显示年份的下拉菜单，默认为false  
			showWeek : true, //是否显示星期,默认为false  
			showButtonPanel : true, //是否显示取消按钮，并含有today按钮，默认为false  
			defaultDate : +7
		//表示默认日期是在当前日期加上7天  
		});

		//---------------------利用datepicker创建时间段----------------  
		$("#dateStart").datepicker(
				{ //绑定开始日期  
					changeMonth : true, //显示下拉列表月份  
					changeYear : true, //显示下拉列表年份  
					dateFormat : 'yy-mm-dd', //更改时间显示模式  
					showWeek : true, //显示星期   
					showButtonPanel : true, //是否显示取消按钮，并含有today按钮，默认为false  
					firstDay : "1", //设置开始为1号
					onSelect : function(dateText, inst) {
						//设置结束日期的最小日期  
						$("#dateEnd").datepicker('option', 'minDate',
								dateText);
					}
				});

		$("#dateEnd").datepicker(
				{ //设置结束绑定日期  
					changeMonth : true, //显示下拉列表月份  
					changeYear : true, //显示下拉列表年份  
					dateFormat : 'yy-mm-dd', //更改时间显示模式  
					showWeek : true, //显示星期    
					showButtonPanel : true, //是否显示取消按钮，并含有today按钮，默认为false  
					firstDay : "1", //设置开始为1号  
					onSelect : function(dateText, inst) {
						//设置开始日期的最大日期  
						$('#dateStart').datepicker('option', 'maxDate',
								dateText);
					}
				});

	});
</script>
</head>

<body>
	<!--  
        jQuery UI datepicker使用 前提  
            第一步：引入别人的类库  
                    js类库  
                    css样式类库文件  
            第二步：模拟实现  
      -->
	<div>
		填入日期：<input type="text" id="datepicker" />
	</div>
	<br>
	<div>
		填入开始日期：<input type="text" id="dateStart" /> 填入结束日期：<input type="text"
			id="dateEnd" />

	</div>

</body>
</html>
