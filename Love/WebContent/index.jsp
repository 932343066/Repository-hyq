<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
	<link href="1.ico" type="image/x-icon" rel="shortcut icon" />
	<!--设置编码格式:中文编码(gbk gb2313)  国际编码(utf-8)-->
	<mata http-equiv="ContenType" content="html/text" charset="utf-8" />
    <!--根据关键字关键词搜索-->
    <mata name="keywords" content="关键字,关键词" />
    <!--根据关键字关键词搜索出来的描述文字-->
    <mata name="description" content="" />
    
    <title>表白神器</title>
    <style type="text/css">
    	body{ 
			margin:0; 
			padding:0; 
			background:url(images/bg.jpg) no-repeat 100%/cover;
			overflow:hidden;
		}
		/*wrap start*/
		.wrap{ 
			width:200px; 
			height:50px; 
			margin:20px auto; 
			font-family:"华文行楷"; 
			font-size:30px; 
			color:black;
			/*background-color:linear-gradient(white,black);*/
			/*linear-gradient(颜色1,颜色2,...)*/
		}
		/*wrap end*/
		
		/*content start*/
		.content{ 
			width:300px; 
			height:300px; 
			margin:0px auto; 
			position:relative; 
			perspective:700px; 
		}
		.content .pic{ 
			transform-style:preserve-3d;      /*设置为3D旋转  默认为2D*/
			animation:play 6s linear infinite;/*调用动画函数play 并且三秒完成动画 linear 匀											 											    速 infinite:无限循环*/
		}
		.content img{ 
			position:absolute; 
			top:70px; 
			left:0; 
			border-radius:90px; 
		}
		.content img:hover{ 
			cursor:pointer;
		}
		/*content end*/
		
		/*text start*/
		.text{ 
			width:360px; 
			height:250px; 
			margin:10px auto 0;
		}
		/*text end*/
		
		/*动画效果 从0转到360*/	/*play start*/
		@keyframes play{
	
			from{ 
				transform: rotateY(0deg);
			}
			to{ 
				transform:rotateY(360deg);
				}
		}
		/*play end*/
    </style>
</head>
<body>
	<!--wrap start-->
	<div class="wrap">
    	<marquee behavior="alternate" width="200px" height="50px">My love</marquee>
    </div>
    <!--wrap end-->
    
    <!--content start-->
    <div class="content">
        <div class="pic">
            <img src="images/11.jpg" height="150" width="150" alt="美女" title="美女" />
            <img src="images/12.jpg" height="150" width="150" alt="美女" title="美女" />
            <img src="images/13.jpg" height="150" width="150" alt="美女" title="美女" />
            <img src="images/14.jpg" height="150" width="150" alt="美女" title="美女" />
            <img src="images/15.jpg" height="150" width="150" alt="美女" title="美女" />
            <img src="images/16.jpg" height="150" width="150" alt="美女" title="美女" />
        </div>
    </div>
    <!--content end-->
    
    <!--text start-->
    <div class="text"></div>
    <!--text end-->
    <embed src="MV/1.mp4" loop="true" hidden="true"></embed>
    <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="js/jq.snow.js"></script>
    <script>
		$(function(){
			$(".content img").each(function(index) {
				var Deg=360/$(".content img").size();
				$(this).css({
				"transform":"rotateY("+Deg*index+"deg) translateZ(216px)"
				});
			});
			$.fn.snow({
				minSize:10,
				maxSize:15,
				newOn:500,
				flakeColor:"red"
				});
			var str="我们的距离,只有一颗心的距离,你中有我,我中有你,牵着你的手,赋予"
				    +"我爱情的魔力,对你说着我爱你,一心一意,彼此相惜,不再逃避,给予我爱你的勇"
					+"气,在我的心 缘里,有的是爱你的甜蜜,满满的是你,为你,我已经倾尽了全力,温"
					+"柔的你,让我一生,为你着迷,我不能骗自己,我是真的爱上你";
			var i=1;
			Scroll();
			function Scroll(){
				$(".text").text(str.substr(0,i));
				i++;
				if(i>=0&&i<=20){
					$(".text").css("color","red");
					}
				else if(i>20&&i<=30){
					$(".text").css("color","green");
					}
				else if(i>30&&i<=40){
					$(".text").css("color","yellow");
					}
				else if(i>40&&i<=50){
					$(".text").css("color","blue");
					}
				else if(i>50&&i<=70){
					$(".text").css("color","pink");
					$(".wrap").css("color","white");
					}
				else{
					$(".text").css("color","skyblue");
					$(".wrap").css("color","black");
					}
				timer=setTimeout(Scroll,500);
				}
			})
    </script>
</body>
</html>