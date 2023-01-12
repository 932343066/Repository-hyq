<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
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

        #catoonSheet, #button, #songSheet, #button2{
            border-radius:90px;
            margin-bottom: 20px;
        }

        a {
            position: relative;
            display: inline-block;
            padding: 10px 20px;
            color: #03e9f4;
            font-size: 16px;
            text-decoration: none;
            text-transform: uppercase;
            overflow: hidden;
            transition: .5s;
            margin-top: 40px;
            letter-spacing: 4px
        }

        a:hover {
            background: #03e9f4;
            color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 5px #03e9f4,
            0 0 25px #03e9f4,
            0 0 50px #03e9f4,
            0 0 100px #03e9f4;
        }

        a span {
            position: absolute;
            display: block;
        }

        a span:nth-child(1) {
            top: 0;
            left: -100%;
            width: 100%;
            height: 2px;
            background: linear-gradient(90deg, transparent, #03e9f4);
            animation: btn-anim1 1s linear infinite;
        }

        @keyframes btn-anim1 {
            0% {
                left: -100%;
            }
            50%,100% {
                left: 100%;
            }
        }

        a span:nth-child(2) {
            top: -100%;
            right: 0;
            width: 2px;
            height: 100%;
            background: linear-gradient(180deg, transparent, #03e9f4);
            animation: btn-anim2 1s linear infinite;
            animation-delay: .25s
        }

        @keyframes btn-anim2 {
            0% {
                top: -100%;
            }
            50%,100% {
                top: 100%;
            }
        }

        a span:nth-child(3) {
            bottom: 0;
            right: -100%;
            width: 100%;
            height: 2px;
            background: linear-gradient(270deg, transparent, #03e9f4);
            animation: btn-anim3 1s linear infinite;
            animation-delay: .5s
        }

        @keyframes btn-anim3 {
            0% {
                right: -100%;
            }
            50%,100% {
                right: 100%;
            }
        }

        a span:nth-child(4) {
            bottom: -100%;
            left: 0;
            width: 2px;
            height: 100%;
            background: linear-gradient(360deg, transparent, #03e9f4);
            animation: btn-anim4 1s linear infinite;
            animation-delay: .75s
        }
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
    <div id="div1" style="position:absolute; top: 0%; left: 0%;">
        <span>动画名称</span>
        <select id = "catoonSheet" name = "catoonSheet"></select>
        <button id = "button">确定</button>
        <br />
        <span>背景音乐</span>
        <select id = "songSheet" name = "songSheet"></select>
        <button id = "button2" name = "button2">切换</button>
    </div>
    <div id="div2" style="text-align: right">
        <a href="video.jsp" target="_blank">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            进入电影台
        </a>&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="/Jimi.jsp" target="_blank" id="register">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            进入聊天
        </a>
    </div>

    <!--text end-->
    <div id="changer" style="position: absolute; top: 0%; right: 0%;">
        <audio id="music" src="MV/Feint _ Veela - Vagrant.mp3" controls="controls" autoplay loop></audio>
        <a href="/Jimi.jsp" target="_blank" id="LoginOut" style="margin-top: 0px; padding-bottom: 4%; text-align: center;">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            退出
        </a>
    </div>
    <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="js/jq.snow.js"></script>
    <script type="text/javascript" src="js/tools.js"></script>
    <script>
		$(function(){
            var catoonJson = tools.requestJsonRs("/CatoonSheetController");
            if(catoonJson.rtState) {
                var pro = $('#catoonSheet');
                var options = '';
                $(catoonJson.rtData).each(function() {
                    options += '<option value="' + this.name + '" >'
                        + this.shortName + '</option>';

                });
                pro.append(options);
            }

            var songJson = tools.requestJsonRs("/SongSheetController");
            if(songJson.rtState) {
                var pro = $('#songSheet');
                var options = '';
                $(songJson.rtData).each(function() {
                    options += '<option value="' + this.name + '" >'
                        + this.shortName + '</option>';

                });
                pro.append(options);
            }

            $("#button").click(function(){
                var catoon = $("#catoonSheet").val();
                window.open(catoon, catoon);
            })

            $("#button2").click(function(){
                tihuan();
            })
            function tihuan() {
                debugger;
                var music = document.getElementById("music");
                var songSheet = $("#songSheet").val();
                music.src = 'MV/' + songSheet;
                music.play();
            }

            // 退出登录
            $("#LoginOut").click(function(){
                var loginJson = tools.requestJsonRs("/LoginOut");
                if(loginJson.rtState) {
                    window.location.href = 'login.jsp';
                }
            })

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
				};


			})
    </script>


</body>
</html>