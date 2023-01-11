<!DOCTYPE HTML>
<html>
<head>
	<link href="1.ico" type="image/x-icon" rel="shortcut icon" />
	<!--设置编码格式:中文编码(gbk gb2313)  国际编码(utf-8)-->
	<mata http-equiv="ContenType" content="html/text" charset="utf-8" />
    <!--根据关键字关键词搜索-->
    <mata name="keywords" content="关键字,关键词" />
    <!--根据关键字关键词搜索出来的描述文字-->
    <mata name="description" content="" />
    
    <title>点播系统</title>
    <style type="text/css">
    	body{ 
			margin:0; 
			padding:0;
		}
        #parent{
            height: 100%;
            width: 99%;
        }
        #top{
            position: absolute;
            top: 0%;
            height: 10%;
            width: 99%;
            background-color: black;
            color: white;
        }
        #left{
            position: absolute;
            bottom: 0%;
            left: 0%;
            height: 90%;
            width: 10%;
            background-color: black;
        }
        #right{
            position: absolute;
            bottom: 0%;
            right: 1%;
            background: black;
            height: 90%;
            width: 89%;
        }
        #parent::after{ content:"clear"; height:0;clear:both; overflow:hidden; visibility:hidden;  display:block;}
    </style>
</head>
<body>
    <div id="parent">
        <div id="top">
            <select id = "songSheet" name = "songSheet"></select>
            <button id = "button2" name = "button2">切换</button>
            </span>
        </div>
        <div id="left">

        </div>
        <div id="right">
            <div id="myimg" style="height: 95%; width: 95%; padding: 0px; margin: 0px;">
                <video alt="GEM邓紫棋-泡沫(标清).mp4" id="music" width=95% height=95% controls autoplay loop>
                    <source src="MV/GEM邓紫棋-泡沫(标清).mp4" type="video/mp4">
                </video>
            </div>
        </div>
    </div>

    <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="js/tools.js"></script>
    <script>
		$(function(){
            debugger;
            var songJson = tools.requestJsonRs("/SongSheetController");
            if(songJson.rtState) {
                var pro = $('#songSheet');
                var options = '';
                $(songJson.rtData).each(function() {
                    if (this.name.indexOf("mp4") != -1) {
                        options += '<option value="' + this.name + '" >'
                            + this.shortName + '</option>';
                    }
                });
                pro.append(options);
            }

            $("#button2").click(function(){
                var songName = $("#songSheet").val();
                tihuan(songName);
            })

            function tihuan(songName) {
                debugger;
                var music = document.getElementById("music");
                var songSheet = $("#songSheet").val();
                music.src = 'MV/' + songSheet;
                music.alt = songSheet;
                music.play();
            }
        });

    </script>
</body>
</html>