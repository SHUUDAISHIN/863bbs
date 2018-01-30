<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="index.css"/>
<script src="./js/jquery-3.2.1.min.js"></script>
<title>论坛</title>
<script>

$(function() {

          var comment_list = $('.comment_list');
          var reply = $('.floor_list div.rf p.bottom span:last-child b:last-child');
          var list_height = [];
          for(var i = 0;i<reply.length;i++) {
            list_height.push(comment_list.eq(i).height());

          }

          $.each(reply,function(index,value) {
               $(this).click(function() {                
                   var comment_list = $(this).parent().parent().next();                   
                   if(comment_list.attr('show')=='no'){
                   	    comment_list.css('height','0px').css('display','block').attr('show','ok').animate({height:list_height[index]+'px',opacity:1},1000);
                        $(this).html('点击收起');

                   } else {
                   	    comment_list.animate({height:'0px',opacity:0},1000,function() {
                              $(this).attr('show','no').css('display','none');
                   	    });
                   	    $(this).html('点击查看');
                   }

               });

          });
           
 })
</script>
</head>
<body>
    <jsp:include page="/headertitle.jsp" flush="true" />

    <!-- 网站主体 -->
    <div id="main">
        <div class="bbs">
			<a class="btn" href="#tiezi">发帖</a>
			<hr />
			
			<!-- 原帖 -->
			<div class="floor">
				<div class="lf_1">
					<span>[置顶]</span>
					<span>[技术专题]</span>
					<a href="">三台县人民法院违反审判程序制造冤案</a>
					<hr/>
				</div>
				<div class="cons">
					然而我昨天去查看我家电表时，惊奇的发现，
					电价由原来的每度电0.5224元上涨到了0.6224元。
					哦买噶，难道这个月用电已经超过180度，达到第二档了？？！
					再想想，不对，前段时间的新闻不是说今年6月1号起，
					要实行一种新的丰水期替代电价吗，第二档每度电才0.4724元。
					为嘛我的电价不是这个，难道本月用电量不是达到第二档，而是进入第三档了？
					额的个苍天，这个月是干了啥，用了如此多的电！！！
				</div>
			</div>
			
			

			<!-- 回复帖子-->

            <div class="reply_mian">
            	

                 <!-- 一楼 -->           
				<div class="floor_list">
					<div class="lf">
	                    <p>zhangsan</p>
	                    <div>
							<img src="images/header_logo.jpg" />
						</div>

					</div>
	  
					<div class="line"></div>

					<div class="rf">

			                <p class="title">
			                  <span>发表于 2017-7-19 09:09</span>
							  <span>1楼</span>
							</p>
							<p class="content">
								我也记得这个新闻，为楼主的钻研精神点赞~我也记得这个新闻，为楼主的钻研精神点赞~
							</p>
					   	    <p class="bottom">
			                  <span><strong>回复</strong></span>
							  <span><b>共23条评论，</b><b>点击查看</b></span>
							</p>
	                        <div class="comment_list" show="no">

	                           <!-- 回贴一 -->

	                           <div class="list_main">
	                           	   <img src="images/logo1.jpg" alt="images/logo1.jpg"> 
		                        	<p class="content">这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容</p>
		                        	<div><span>2017-08-11 15:30</span><span>回复</span></div>
		                        	<div><span class="btn">我也要说两句</span></div>
	                           </div>

                               <!-- 回贴二 -->
 
	                           <div class="list_main">
	                           	   <img src="images/logo2.jpg" alt="images/logo2.jpg"> 
		                        	<p class="content">这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容</p>
		                        	<div><span>2017-08-11 15:30</span><span>回复</span></div>
		                        	<div><span class="btn">我也要说两句</span></div>
	                           </div>
	                        	
	                        </div>

					</div>
				</div>
				
				

				 <!-- 二楼 -->
				
				<div class="floor_list">
					<div class="lf">
	                    <p>zhangsan</p>
	                    <div>
							<img src="images/header_logo.jpg" />
						</div>

					</div>

					<div class="line"></div>

					<div class="rf">

			                <p class="title">
			                  <span>发表于 2017-7-19 09:09</span>
							  <span>2楼</span>
							</p>
							<p class="content">
								我也记得这个新闻，为楼主的钻研精神点赞~我也记得这个新闻，为楼主的钻研精神点赞~
							</p>
					   	    <p class="bottom">
			                  <span><strong>回复</strong></span>
							  <span><b>共23条评论，</b><b>点击查看</b></span>
							</p>
	                        <div class="comment_list" show="no">

	                          <!-- 回贴一 -->

	                           <div class="list_main">
	                           	   <img src="images/logo1.jpg" alt="images/logo1.jpg"> 
		                        	<p class="content">这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容</p>
		                        	<div><span>2017-08-11 15:30</span><span>回复</span></div>
		                        	<div><span class="btn">我也要说两句</span></div>
	                           </div>


                               <!-- 回贴二 -->

	                           <div class="list_main">
	                           	   <img src="images/logo2.jpg" alt="images/logo2.jpg"> 
		                        	<p class="content">这是我的评论内容这是我的评论内容这是我的评论内容这是我的评论内容</p>
		                        	<div><span>2017-08-11 15:30</span><span>回复</span></div>
		                        	<div><span class="btn">我也要说两句</span></div>
	                           </div>
	                        	
	                        </div>

					</div>
				</div>
			

            </div>
			
			
			<!-- 分页 -->
			
			<div class="panigation">
				<a>上一页</a>
				<a>1</a>
				<a>2</a>
				<a class="act">3</a>
				<a>4</a>
				<a>5</a>
				<a>下一页</a>
			</div>
			
			
			
			<a class="btn" href="#tiezi">发帖</a>
			<hr />
			
			<!-- 开始发帖-->
			<!-- 上传表单-->
			<div class="bbs_tz" id="tiezi">
				<p>快速回复</p>
				<hr />
				<form action="" method="post">
					<span>
						<textarea  class="area"></textarea>
					</span>
					<span><a class="btn">发表回复</a></span>
				</form>
			</div>
			
		</div>
		
    </div>

    <script>
		function replay(tag){
			console.log($(tag).next());
			$(tag).next().fadeToggle();
		}
	</script>
</body>

</html>