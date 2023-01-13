<!DOCTYPE HTML>
<html>
<head>
    <link href="1.ico" type="image/x-icon" rel="shortcut icon"/>
    <!--设置编码格式:中文编码(gbk gb2313)  国际编码(utf-8)-->
    <mata http-equiv="ContenType" content="html/text" charset="utf-8"/>
    <!--根据关键字关键词搜索-->
    <mata name="keywords" content="关键字,关键词"/>
    <!--根据关键字关键词搜索出来的描述文字-->
    <mata name="description" content=""/>
    <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="js/tools.js"></script>
    <script type="text/javascript" src="js/video.js"></script>
    <link href="css/video.css" rel="stylesheet" type="text/css">
    <title>点播系统</title>
    <style type="text/css">
        body {
            margin: 0;
            padding: 0;
        }
    </style>
</head>
<body>
<div id="parent">
    <div id="top">
        <select id="songSheet" name="songSheet"></select>
    </div>
    <div id="left">

    </div>
    <div id="right">
        <div id="myimg" style="height: 95%; width: 95%; padding: 0px; margin: 0px;">
            <video id="music" width=95% height=95% controls autoplay loop>
                <source type="video/mp4">
            </video>
        </div>
    </div>
</div>
</body>
</html>