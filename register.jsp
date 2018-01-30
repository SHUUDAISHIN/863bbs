<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="index.css"/>
	<script src="./js/jquery-3.2.1.min.js"></script>
    <title>用户注册</title>
</head>
<body>
    <jsp:include page="/headertitle.jsp" flush="true" />

    <!-- 网站主体 -->
    <div id="main">
        <!-- 上传表单-->
        <div class="upload">
            <p>用户注册</p>
            <hr />
            <form action="./index.html" id="myform" method="post" enctype="application/x-www-form-urlencoded">
                <span>
                    <label>用户头像：</label>
                    <input class="upt" type="text" readonly="readonly"/>
                    <input class="upt" type="file" name="" value=""/>
                    <b>文件格式可以是jpg,gif,png等图片格式</b>
                </span>
                <span>
                    <label>用户名：</label>
                    <input id="name" class="upt" type="text" name="username" value="" />
					<b id="nameb"></b>
                    <b>账号可以包含字母，数字，下划线，不允许出现其他符号</b>
                </span>
                <span>
                    <label>密码：</label>
                    <input id="password" class="upt" type="password" name="password" value="" />
                    <b>密码长度为6-20位</b>
                </span>
                <span>
                    <label>确认密码：</label>
                    <input id="confirmPass" class="upt" type="password" name="abd" value="" />
                    <b>两次输入的密码必须保持一致</b>
                </span>
                <span>
                    <label>联系方式：</label>
                    <input id="tel" class="upt" type="text" name="tel" value="" />
                    <b>您丢失密码后找回密码的凭证</b>
                </span>
                <span>
                    <label>电子邮箱：</label>
                    <input id="email" class="upt" type="text" name="email" value="" />
                    <b>您丢失密码后找回密码的凭证</b>
                </span>

                <span><label class="btn"><input id="reg" type="button"  value="注册" /></label></span>
            </form>
        </div>

    </div>
	<script>
		$("#reg").click(function(){
			var param = $("#myform").serialize();
			alert(param);
		});
	</script>
</body>

</html>