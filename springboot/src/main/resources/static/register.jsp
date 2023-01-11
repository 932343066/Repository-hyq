
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>love</title>

    <link href="static/css/login.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
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

        .login-box {
            position: absolute;
            top: 50%;
            left: 50%;
            width: 400px;
            padding: 40px;
            transform: translate(-50%, -50%);
            background: rgba(0,0,0,.5);
            box-sizing: border-box;
            box-shadow: 0 15px 25px rgba(0,0,0,.6);
            border-radius: 10px;
        }

        .login-box h2 {
            margin: 0 0 30px;
            padding: 0;
            color: #fff;
            text-align: center;
        }

        .login-box .user-box {
            position: relative;
        }

        .login-box .user-box input {
            width: 100%;
            padding: 10px 0;
            font-size: 16px;
            color: #fff;
            margin-bottom: 30px;
            border: none;
            border-bottom: 1px solid #fff;
            outline: none;
            background: transparent;
        }
        .login-box .user-box label {
            position: absolute;
            top:0;
            left: 0;
            padding: 10px 0;
            font-size: 16px;
            color: #fff;
            pointer-events: none;
            transition: .5s;
        }

        .login-box .user-box input:focus ~ label,
        .login-box .user-box input:valid ~ label {
            top: -20px;
            left: 0;
            color: #03e9f4;
            font-size: 12px;
        }

        .login-box form a {
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

        .login-box a:hover {
            background: #03e9f4;
            color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 5px #03e9f4,
            0 0 25px #03e9f4,
            0 0 50px #03e9f4,
            0 0 100px #03e9f4;
        }

        .login-box a span {
            position: absolute;
            display: block;
        }

        .login-box a span:nth-child(1) {
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

        .login-box a span:nth-child(2) {
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

        .login-box a span:nth-child(3) {
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

        .login-box a span:nth-child(4) {
            bottom: -100%;
            left: 0;
            width: 2px;
            height: 100%;
            background: linear-gradient(360deg, transparent, #03e9f4);
            animation: btn-anim4 1s linear infinite;
            animation-delay: .75s
        }

        @keyframes btn-anim4 {
            0% {
                bottom: -100%;
            }
            50%,100% {
                bottom: 100%;
            }
        }
    </style>
</head>
<body>
<div>
    <div class="login-box">
        <h2>Register</h2>
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
            <a href="#" id="clear">
                <span></span>
                <span></span>
                <span></span>
                <span></span>
                Clear
            </a>

        </form>
    </div>
    <div class="canvaszz"> </div>
    <canvas id="canvas"></canvas>
    <div id="changer" style="position: absolute; top: 0%; right: 0%;">
        <audio id="music" src="MV/Feint _ Laura Brehm - Words.mp3" controls="controls" autoplay loop></audio>
    </div>
    <script type="text/javascript" src="js/tools.js"></script>
</div>
<script>
    $(function(){
        // 提交
        $("#submit").click(function(){
            signIn();
        })

        // 清空
        $("#clear").click(function(){
            $("#username").val("");
            $("#pwd").val("");
        })

        function signIn() {
            debugger;
            var username = $("#username").val();
            var pwd = $("#pwd").val();
            if (username == "") {
                alert("用户名不能为空!");
                return false;
            }
            if (pwd == "") {
                alert("密码不能为空!");
                return false;
            }
            var userJson = tools.requestJsonRs("/ToRegister", {username:username, pwd:pwd});
            if(userJson.rtState) {
                window.location.href = "login.jsp";
                return userJson.rtState;
            } else {
                alert("账号密码输入违规，请重新输入!")
                return userJson.rtState;
            }
        }
        doInitEnter();
        /**
         * 获取回车事件
         * @returns
         */
        function doInitEnter() {
            document.onkeyup = function (e) {
                var code = e.charCode || e.keyCode;  //取出按键信息中的按键代码(大部分浏览器通过keyCode属性获取按键代码，但少部分浏览器使用的却是charCode)
                if (code == 13) {
                    checkLogin();
                }
            }
        }

        // 炫酷效果 烟花
        // fun options!
        const PARTICLES_PER_FIREWORK = 150; // 100 - 400 or try 1000
        const FIREWORK_CHANCE = 0.02; // percentage, set to 0 and click instead
        const BASE_PARTICLE_SPEED = 0.6; // between 0-4, controls the size of the overall fireworks
        const FIREWORK_LIFESPAN = 600; // ms
        const PARTICLE_INITIAL_SPEED = 4.5; // 2-8

        // not so fun options =\
        const GRAVITY = 9.8;


        const canvas = document.getElementById('canvas');
        const ctx = canvas.getContext('2d');

        let particles = [];
        let disableAutoFireworks = false;
        let resetDisable = 0;

        let loop = () => {

            if (!disableAutoFireworks && Math.random() < FIREWORK_CHANCE) {
                createFirework();
            }

            ctx.clearRect(0, 0, canvas.width, canvas.height);

            particles.forEach((particle, i) => {
                particle.animate();
                particle.render();
                if (particle.y > canvas.height
                    || particle.x < 0
                    || particle.x > canvas.width
                    || particle.alpha <= 0
                ) {
                    particles.splice(i, 1);
                }
            });

            requestAnimationFrame(loop);

        };

        let createFirework = (
            x = Math.random() * canvas.width,
            y = Math.random() * canvas.height
        ) => {

            let speed = (Math.random() * 2) + BASE_PARTICLE_SPEED;
            let maxSpeed = speed;

            let red = ~~(Math.random() * 255);
            let green = ~~(Math.random() * 255);
            let blue = ~~(Math.random() * 255);

            // use brighter colours
            red = (red < 150 ? red + 150 : red);
            green = (green < 150 ? green + 150 : green);
            blue = (blue < 150 ? blue + 150 : blue);

            // inner firework
            for (let i = 0; i < PARTICLES_PER_FIREWORK; i++) {
                let particle = new Particle(x, y, red, green, blue, speed);
                particles.push(particle);

                maxSpeed = (speed > maxSpeed ? speed : maxSpeed);
            }

            // outer edge particles to make the firework appear more full
            for (let i = 0; i < 40; i++) {
                let particle = new Particle(x, y, red, green, blue, maxSpeed, true);
                particles.push(particle);
            }

        };

        class Particle {

            constructor(
                x = 0,
                y = 0,
                red = ~~(Math.random() * 255),
                green = ~~(Math.random() * 255),
                blue = ~~(Math.random() * 255),
                speed,
                isFixedSpeed
            ) {

                this.x = x;
                this.y = y;
                this.red = red;
                this.green = green;
                this.blue = blue;
                this.alpha = 0.05;
                this.radius = 1 + Math.random();
                this.angle = Math.random() * 360;
                this.speed = (Math.random() * speed) + 0.1;
                this.velocityX = Math.cos(this.angle) * this.speed;
                this.velocityY = Math.sin(this.angle) * this.speed;
                this.startTime = (new Date()).getTime();
                this.duration = Math.random() * 300 + FIREWORK_LIFESPAN;
                this.currentDiration = 0;
                this.dampening = 30; // slowing factor at the end

                this.colour = this.getColour();

                if (isFixedSpeed) {
                    this.speed = speed;
                    this.velocityY = Math.sin(this.angle) * this.speed;
                    this.velocityX = Math.cos(this.angle) * this.speed;
                }

                this.initialVelocityX = this.velocityX;
                this.initialVelocityY = this.velocityY;

            }

            animate() {

                this.currentDuration = (new Date()).getTime() - this.startTime;

                // initial speed kick
                if (this.currentDuration <= 200) {

                    this.x += this.initialVelocityX * PARTICLE_INITIAL_SPEED;
                    this.y += this.initialVelocityY * PARTICLE_INITIAL_SPEED;
                    this.alpha += 0.01;

                    this.colour = this.getColour(240, 240, 240, 0.9);

                } else {

                    // normal expansion
                    this.x += this.velocityX;
                    this.y += this.velocityY;
                    this.colour = this.getColour(this.red, this.green, this.blue, 0.4 + (Math.random() * 0.3));

                }

                this.velocityY += GRAVITY / 1000;

                // slow down particles at the end
                if (this.currentDuration >= this.duration) {
                    this.velocityX -= this.velocityX / this.dampening;
                    this.velocityY -= this.velocityY / this.dampening;
                }

                if (this.currentDuration >= this.duration + this.duration / 1.1) {

                    // fade out at the end
                    this.alpha -= 0.02;
                    this.colour = this.getColour();

                } else {

                    // fade in during expansion
                    if (this.alpha < 1) {
                        this.alpha += 0.03;
                    }

                }
            }

            render() {

                ctx.beginPath();
                ctx.arc(this.x, this.y, this.radius, 0, Math.PI * 2, true);
                ctx.lineWidth = this.lineWidth;
                ctx.fillStyle = this.colour;
                ctx.shadowBlur = 8;
                ctx.shadowColor = this.getColour(this.red + 150, this.green + 150, this.blue + 150, 1);
                ctx.fill();

            }

            getColour(red, green, blue, alpha) {

                return `rgba(${red || this.red}, ${green || this.green}, ${blue || this.blue}, ${alpha || this.alpha})`;

            }

        }

        let updateCanvasSize = () => {
            canvas.width = window.innerWidth;
            canvas.height = window.innerHeight;
        };


        // run it!

        updateCanvasSize();
        $(window).resize(updateCanvasSize);
        $(canvas).on('click', (e) => {

            createFirework(e.clientX, e.clientY);

            // stop fireworks when clicked, re-enable after short time
            disableAutoFireworks = true;
            clearTimeout(resetDisable);
            resetDisable = setTimeout(() => {
                disableAutoFireworks = false;
            }, 5000);

        });

        loop();
    })

</script>

</body>
</html>
