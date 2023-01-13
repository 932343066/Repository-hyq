$(function () {
    var img = [];
    var receives;
    doInitEnter();

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

    /**
     * 获取回车事件
     * @returns
     */
    function doInitEnter() {
        document.onkeyup = function (e) {
            var code = e.charCode || e.keyCode;  //取出按键信息中的按键代码(大部分浏览器通过keyCode属性获取按键代码，但少部分浏览器使用的却是charCode)
            if (code == 13) {
                speak();
            }
        }
    }

    $(".j_sendInfor").click(function () {
        speak();
    })

    function speak() {
        debugger;
        var content = $(".j_box").text();
        var count = $(".j_box").has("img").length;
        if (count == 1) {
            debugger
            // 存在img
            $.each($(".j_box").find("img"), function (i, v) {
                content += v.outerHTML;
            });
        }
        if (content) {
            var teeJson = insertHistory(content);
            $.each(teeJson.rtData, function (i, v) {
                debugger;
                //动态创建div  追加到j_right后面
                var $div = $("<div class='j_right'>"
                    + "<span style='align-content: right;'>" + v.shortTime + "</span><br />"
                    + content + ":<img src=" + img + " height='50px' width='50px'>"
                    + "</div>"
                )
                $div.appendTo(".j_con");
                $(".j_box").text("")
                var con = document.querySelector(".j_con")
                con.scrollTop = con.scrollHeight;
            });
        } else {
            alert("请输入内容！");
        }


    }

    /**
     * 插入消息
     * @returns {boolean}
     */
    function insertHistory(content) {
        debugger;
        const InsertJson = tools.requestJsonRs("/InsertHistory", {content: content});
        return InsertJson;
    }

    getImg();

    // 获取该账号的头像
    function getImg() {
        const imgJson = tools.requestJsonRs("/GetImg");
        if (imgJson.rtState) {
            const imgSrc = imgJson.rtData;
            img = imgSrc;
            $("#self").attr("src", imgSrc);
            if (imgSrc == "images/ye.png") {
                $("#goodFriend").attr("src", "images/hua.png");
            } else {
                $("#goodFriend").attr("src", "images/ye.png");
            }
            $("#username1").attr("src", imgSrc);
            return imgJson.rtState;
        }
    }


    selectHistory("1");

    var $receive = $("<span>" + receives + "</span>");
    $receive.appendTo(".j_title");

    // 补全历史记录
    function selectHistory(type) {
        var receive;
        const historyJson = tools.requestJsonRs("/SelectHistory", {type: type});
        if (historyJson.rtState) {
            var username = historyJson.rtData.sendUser;
            $.each(historyJson.rtData, function (i, v) {
                if (v != username) {
                    $.each(v, function (j, v1) {
                        if (v1.sendUser == username) {
                            // 发送者
                            //动态创建div  追加到j_right后面
                            var $div = $("<div class='j_right'>"
                                + "<span style='align-content: right;'>" + v1.shortTime + "</span><br />"
                                + v1.content + ":<img src=" + v1.img + " height='50px' width='50px'>"
                                + "</div>"
                            )
                            $div.appendTo(".j_con");
                            $(".j_box").text("")
                            var con = document.querySelector(".j_con")
                        } else {
                            // 接受者
                            //动态创建div  追加到j_right后面
                            var $div = $("<div class='j_left'>"
                                + "<span style='align-content: left;'>" + v1.shortTime + "</span><br />"
                                + "<img src=" + v1.img + " height='50px' width='50px'>:" + v1.content
                                + "</div>"
                            )
                            $div.appendTo(".j_con");
                            $(".j_box").text("");
                            receive = v1.sendUser;
                        }
                        var con = document.querySelector(".j_con")
                        receives = receive;
                        con.scrollTop = con.scrollHeight;
                    })
                }
            });
            return historyJson.rtState;
        }
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

    // 默认播放第一首歌
    var songSheet = $("#songSheet").val();
    music.src = 'MV/' + songSheet;
    music.play();

    // 切换背景动画
    $("#catoonSheet").change(function () {
        var catoonSheet = $("#catoonSheet").val();
        $("body").css("background", "url(" + catoonSheet + ") no-repeat 100%/cover");
    })

    // 切换背景动画
    $("#catoonSheet").change(function () {
        var catoonSheet = $("#catoonSheet").val();
        $("body").css("background", "url(" + catoonSheet + ") no-repeat 100%/cover");
    })

    function tihuan() {
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

    setInterval(selectNewHistory, 3111000); // 三秒钟查询一次是否有新消息

    function selectNewHistory() {
        const historyNewJson = tools.requestJsonRs("/SelectNewHistory");
        if (historyNewJson.rtState) {
            // 有
            selectHistory("2");
        }
    }

    $(".j_emo").click(function () {
        $("#emo1").fadeToggle(1000);
    })

    // 表情格式就是&#128512;循环是多少到多少，我这只是列举了一点表情。
    for (var i = 128512; i < 128590; i++) {
        // Jquery创建div(已表情的二进制作为id)，到后面用于获取指定表情。
        var div = "<span id='" + i + "'>&#" + i + ";</span>";
        // 将创建好的节点追加到指定的节点。
        $("#emo1").append(div);
    }
    // 获取指定的表情
    // 为什么要使用live，因为是自动生成动态节点，使用静态获取不到id，只有使用了动态才能节点。
    $("#emo1>span").live('click', function () {
        // 将选择的表情追加到指定节点。
        var emo = $(this).text();
        $(".j_box").append(emo);
    });

    $("#emo1>img").live('click', function () {
        // 将选择的表情追加到指定节点。
        var src = $(this).attr("src");
        var img = "<img src=" + src + " height='27px' width='28px' />"
        $(".j_box").append(img);
    });
    // 添加问道表情
    var div = "<img src='images/1.gif' height='20px' width='22px' />"
        + "<img src='images/2.gif' height='20px' width='22px' />"
        + "<img src='images/3.gif' height='20px' width='22px' />"
        + "<img src='images/4.gif' height='20px' width='22px' />"
        + "<img src='images/5.png' height='20px' width='22px' />"
        + "<img src='images/6.png' height='20px' width='22px' />"
        + "<img src='images/7.png' height='20px' width='22px' />"
        + "<img src='images/8.png' height='20px' width='2px' />";
    // 将创建好的节点追加到指定的节点。
    $("#emo1").append(div);
})