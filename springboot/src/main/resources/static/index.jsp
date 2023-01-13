<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <link href="icon/1.icon" type="image/x-icon" rel="shortcut icon"/>
    <!--设置编码格式:中文编码(gbk gb2313)  国际编码(utf-8)-->
    <mata http-equiv="ContenType" content="html/text" charset="utf-8"/>
    <!--根据关键字关键词搜索-->
    <mata name="keywords" content="关键字,关键词"/>
    <!--根据关键字关键词搜索出来的描述文字-->
    <mata name="description" content=""/>

    <title>表白神器</title>
    <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="js/jq.snow.js"></script>
    <script type="text/javascript" src="js/tools.js"></script>
    <script type="text/javascript" src="js/index.js"></script>
    <link href="css/index.css" rel="stylesheet" type="text/css">
    <style type="text/css">
        body {
            margin: 0;
            padding: 0;
            background: url(images/bg.jpg) no-repeat 100%/cover;
            overflow: hidden;
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
<!--text start-->
<div class="text"></div>
<div id="div1" style="position:absolute; top: 0%; left: 0%;">
    <span>背景动画</span>
    <select id="catoonSheet" name="catoonSheet"></select>
    <span>背景音乐</span>
    <select id="songSheet" name="songSheet"></select>
</div>
<div id="div2" style="text-align: right">
    <a id="enterMovies">
        <span></span>
        <span></span>
        <span></span>
        <span></span>
        进入电影台
    </a>&nbsp;&nbsp;&nbsp;&nbsp;
    <a id="enterTalk">
        <span></span>
        <span></span>
        <span></span>
        <span></span>
        进入聊天
    </a>
</div>

<!--text end-->
<div id="changer" style="position: absolute; top: 0%; right: 0%;">
    <audio id="music" style="opacity: 0.2;" controls="controls" autoplay loop></audio>
    <img src="" height='50px' width='50px' id="username1">
    <a href="/Jimi.jsp" target="_blank" id="LoginOut" style="margin-top: 0px; padding-bottom: 4%; text-align: center;">
        <span></span>
        <span></span>
        <span></span>
        <span></span>
        退出
    </a>
</div>
<div id="emoji" style="width: 500px; height: 500px; border: 1px red solid"></div>
<br/>
<br/>
<div id="emojis" style="width: 500px; height: 500px; border: 1px red solid"></div>
</body>
</html>