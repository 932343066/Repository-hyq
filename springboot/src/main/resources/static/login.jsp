<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>love</title>
    <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="js/tools.js"></script>
    <script type="text/javascript" src="js/login.js"></script>
    <link href="css/login.css" rel="stylesheet" type="text/css">
    <style>
        body {
            margin: 0;
            padding: 0;
            background: #000000;
            overflow: hidden;
            font-family: sans-serif;
        }

        html {
            height: 100%;
        }
    </style>
</head>
<body>
<div>
    <div class="login-box">
        <h2>Login</h2>
        <form id="form1" name="form1" role="form" enctype="multipart/form-data" method="post">
            <div class="user-box">
                <input type="text" name="username" id="username" required="true">
                <label>Username</label>
            </div>
            <div class="user-box">
                <input type="password" name="pwd" id="pwd" required="true">
                <label>Password</label>
            </div>
            <a href="#" id="submit">
                <span></span>
                <span></span>
                <span></span>
                <span></span>
                Submit
            </a>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <a href="#" id="register">
                <span></span>
                <span></span>
                <span></span>
                <span></span>
                Register
            </a>
        </form>
    </div>
    <div class="canvaszz"></div>
    <canvas id="canvas"></canvas>
    <div id="changer" style="position: absolute; top: 0%; right: 0%;">
        <audio id="music" style="opacity: 0.2;" src="MV/rich-man.mp3" controls="controls" autoplay loop></audio>
    </div>
</div>
</body>
</html>
