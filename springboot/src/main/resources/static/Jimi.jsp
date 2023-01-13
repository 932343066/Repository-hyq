<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>京东jimi机器人</title>
    <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="js/tools.js"></script>
    <script type="text/javascript" src="js/Jimi.js"></script>
    <link href="css/Jimi.css" rel="stylesheet" type="text/css">
    <style type="text/css">
        body {
            margin: 0;
            background-color: black;
            padding: 0;
            background: url(images/accompany.gif) no-repeat 100%/cover;
            height: 675px;
        }
    </style>
</head>
<body>
<!--jimi S-->
<div class="j_jimi">
    <div id="div1" style="position:absolute; top: 0%; left: 0%;">
        <span>背景动画</span>
        <select id="catoonSheet" name="catoonSheet"></select>
        <span>背景音乐</span>
        <select id="songSheet" name="songSheet"></select>
    </div>
    <div class="j_title"></div>
    <div class="j_con">
    </div>
    <div class="j_msg">
        <div class="j_box1">
            <div class="j_emo" id="emo" alt="表情"><img src="images/emo.png" height="20px" width="20px"/></div>
            <div class="j_box" contenteditable="true"></div>
        </div>
        <div class="j_send">
            <input type="button" value="发送(S)" class="j_sendInfor">
        </div>
    </div>
</div>
<div id="changer" style="position: absolute; top: 0%; right: 0%;">
    <audio id="music" style="opacity: 0.2;" controls="controls" loop autoplay></audio>
    <img src="" height='50px' width='50px' id="username1">
    <a href="/Jimi.jsp" target="_blank" id="LoginOut" style="margin-top: 0px; padding-bottom: 4%; text-align: center;">
        <span></span>
        <span></span>
        <span></span>
        <span></span>
        退出
    </a>
</div>
<div id="emo1"></div>
</body>
</html>
