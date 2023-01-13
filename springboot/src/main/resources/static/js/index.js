$(function () {
    var catoonJson = tools.requestJsonRs("/CatoonSheetController");
    if (catoonJson.rtState) {
        var pro = $('#catoonSheet');
        var options = '';
        $(catoonJson.rtData).each(function () {
            options += '<option value="' + this.value + '" >'
                + this.name + '</option>';

        });
        pro.append(options);
    }

    var songJson = tools.requestJsonRs("/SongSheetController");
    if (songJson.rtState) {
        var pro = $('#songSheet');
        var options = '';
        $(songJson.rtData).each(function () {
            if (this.name.indexOf("mp3") != -1) {
                options += '<option value="' + this.name + '" >'
                    + this.shortName + '</option>';
            }

        });
        pro.append(options);
    }

    getImg();

    // 获取该账号的头像
    function getImg() {
        const imgJson = tools.requestJsonRs("/GetImg");
        if (imgJson.rtState) {
            const imgSrc = imgJson.rtData;
            $("#username1").attr("src", imgSrc);
            return imgJson.rtState;
        }
    }

    // 默认播放第一首歌
    var songSheet = $("#songSheet").val();
    music.src = 'MV/' + songSheet;
    music.play();

    // 默认第一张背景图
    var songSheet = $("#songSheet").val();
    $("body").css("background", "url(" + songSheet + ") no-repeat 100%/cover");

    // 切换背景动画
    $("#catoonSheet").change(function () {
        debugger;
        var catoonSheet = $("#catoonSheet").val();
        $("body").css("background", "url(" + catoonSheet + ") no-repeat 100%/cover");
    })

    function tihuan() {
        debugger;
        var music = document.getElementById("music");
        var songSheet = $("#songSheet").val();
        music.src = 'MV/' + songSheet;
        music.play();
    }

    // 退出登录
    $("#LoginOut").click(function () {
        var loginJson = tools.requestJsonRs("/LoginOut");
        if (loginJson.rtState) {
            window.location.href = 'login.jsp';
        }
    })

    // 歌曲onChange就触发
    $("#songSheet").change(function () {
        tihuan();
    })

    $(".content img").each(function (index) {
        var Deg = 360 / $(".content img").size();
        $(this).css({
            "transform": "rotateY(" + Deg * index + "deg) translateZ(216px)"
        });
    });

    $("#enterMovies").click(function () {
        music.pause();
        window.open("video.jsp", "video");
    });

    $("#enterTalk").click(function () {
        music.pause();
        window.open("Jimi.jsp", "Jimi");
    });

    $.fn.snow({
        minSize: 10,
        maxSize: 15,
        newOn: 500,
        flakeColor: "red"
    });
    var str = "我们的距离,只有一颗心的距离,你中有我,我中有你,牵着你的手,赋予"
        + "我爱情的魔力,对你说着我爱你,一心一意,彼此相惜,不再逃避,给予我爱你的勇"
        + "气,在我的心 缘里,有的是爱你的甜蜜,满满的是你,为你,我已经倾尽了全力,温"
        + "柔的你,让我一生,为你着迷,我不能骗自己,我是真的爱上你";
    var i = 1;
    Scroll();

    function Scroll() {
        $(".text").text(str.substr(0, i));
        i++;
        if (i >= 0 && i <= 20) {
            $(".text").css("color", "red");
        } else if (i > 20 && i <= 30) {
            $(".text").css("color", "green");
        } else if (i > 30 && i <= 40) {
            $(".text").css("color", "yellow");
        } else if (i > 40 && i <= 50) {
            $(".text").css("color", "blue");
        } else if (i > 50 && i <= 70) {
            $(".text").css("color", "pink");
            $(".wrap").css("color", "white");
        } else {
            $(".text").css("color", "skyblue");
            $(".wrap").css("color", "black");
        }
        timer = setTimeout(Scroll, 500);
    };
})