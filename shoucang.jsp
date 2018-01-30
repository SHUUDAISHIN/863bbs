<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="index.css"/>
    <title>首页</title>
</head>
<body>
    
	<jsp:include page="/headertitle.jsp" flush="true" />
    <!-- 网站主体 -->
    <div id="main">
        <!-- 定义一个条目-->
        <div class="pro">
           <div class="img">
               <img src="./images/rar.svg" />
           </div>
            <div class="cs">
                <div class="up">
                    <a href="detai.html">spring cloud,spring boot 项目实例，两个</a>
                </div>
                <div class="down">
                    上传者：  上传时间：收藏时间：
                </div>
            </div>
            <div class="arr">
                积分：<span>2</span>
            </div>
        </div>

        <div class="pro">
            <div class="img">
                <img src="./images/pdf.svg" />
            </div>
            <div class="cs">
                <div class="up">
                    <a href="detai.html">简易java开源订销管理系统.zip</a>
                </div>
                <div class="down">
                    上传者：  上传时间：
                </div>
            </div>
            <div class="arr">
                积分：<span>2</span>
            </div>
        </div>

        <div class="pro">
            <div class="img">
                <img src="./images/zip.svg" />
            </div>
            <div class="cs">
                <div class="up">
                    <a href="detai.html">简易java开源订销管理系统.zip</a>
                </div>
                <div class="down">
                    上传者：  上传时间：
                </div>
            </div>
            <div class="arr">
                积分：<span>2</span>
            </div>
        </div>

        <div class="pro">
            <div class="img">
                <img src="./images/txt.svg" />
            </div>
            <div class="cs">
                <div class="up">
                    <a href="detai.html">简易java开源订销管理系统.zip</a>
                </div>
                <div class="down">
                    上传者：  上传时间：
                </div>
            </div>
            <div class="arr">
                积分：<span>2</span>
            </div>
        </div>

        <div class="pro">
            <div class="img">
                <img src="./images/txt.svg" />
            </div>
            <div class="cs">
                <div class="up">
                    <a href="detai.html">简易java开源订销管理系统.zip</a>
                </div>
                <div class="down">
                    上传者：  上传时间：
                </div>
            </div>
            <div class="arr">
                积分：<span>0</span>
            </div>
        </div>

        
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


    <script>
        function showWin(){
            //获取对应的DIV元素
            var div = document.getElementById("cvs2_logon");
            div.style = 'display:block' ;
        }

        function close_win(){
            var div = document.getElementById("cvs2_logon");
            div.style = 'display:none' ;
        }

    </script>

</body>

</html>