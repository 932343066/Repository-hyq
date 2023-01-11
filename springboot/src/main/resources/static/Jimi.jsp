<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>京东jimi机器人</title>
<style type="text/css">
            /*S*/
			*{ margin:0px;}
			.j_jimi{opacity: 0.6; width:850px; margin:50px auto auto auto; background-color: #cccccc}
			.j_jimi .j_title{height:50px; background-color: #0FF; line-height:50px; color:#999; align-content: center;}
			.j_jimi .j_con{ height:330px; margin-bottom:20px; overflow:auto;}
			.j_jimi .j_con .j_left{ padding-left:10px; text-align: left;}
			.j_jimi .j_con .j_left img{ border-radius:50%; vertical-align: middle;}
			.j_jimi .j_con .j_right{ text-align:right; padding-right:10px;}
			.j_jimi .j_con .j_right img{ border-radius:50%; vertical-align:middle;}
			.j_jimi .j_msg{ width:850px; height:100px; background-color:#999;}
			.j_jimi .j_msg .j_box{ width:720px; height:80px; outline:none; padding:10px; float:left;}
			.j_jimi .j_msg .j_send{ float:right;}
			.j_jimi .j_msg .j_send input{ width:110px; height:100px; cursor:pointer;}
			.j_jimi .j_msg .j_send:hover{ background-color: #000;}
			/*E*/

            body{
                margin: 0;
                background-color: black;
                padding: 0;
                background:url(images/accompany.gif) no-repeat 100%/cover;
                height: 675px;
            }
</style>
</head>
<body>
<!--jimi S-->
<div class="j_jimi">
    <div class="j_title"></div>
    <div class="j_con">
    </div>
    <div class="j_msg">
        <div class="j_box" contenteditable="true"></div>
        <div class="j_send">
            <input type="button" value="发送(S)" class="j_sendInfor">
        </div>
    </div>
</div>
<!--jimi E-->
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/tools.js"></script>
<script type="text/javascript">
<!--S-->
$(function(){
    var img = [];
    doInitEnter();

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

	$(".j_sendInfor").click(function(){
        speak();
    })

    function speak() {
        var content=$(".j_box").text();
        if(content){
            //动态创建div  追加到j_right后面
            var $div=$("<div class='j_right'>"
                +content+":<img src="+img+" height='50px' width='50px'>"
                +"</div>"
            )
            $div.appendTo(".j_con");
            $(".j_box").text("")
            var con = document.querySelector(".j_con")
            con.scrollTop = con.scrollHeight;
            insertHistory(content);
        }
        else{
            alert("内容不能为空!")
        }

    }

    /**
     * 插入消息
     * @returns {boolean}
     */
    function insertHistory(content, time){
        const InsertJson = tools.requestJsonRs("/InsertHistory", {content:content});
        return InsertJson.rtState;
    }

    getImg();
    // 获取该账号的头像
    function getImg() {
        const imgJson = tools.requestJsonRs("/GetImg");
        if(imgJson.rtState) {
            const imgSrc = imgJson.rtData;
            img = imgSrc;
            $("#self").attr("src", imgSrc);
            if (imgSrc == "images/ye.png") {
                $("#goodFriend").attr("src", "images/hua.png");
            } else {
                $("#goodFriend").attr("src", "images/ye.png");
            }
            return imgJson.rtState;
        }
    }

    selectHistory();
    // 补全历史记录
    function selectHistory(){
        var receive;
        const historyJson = tools.requestJsonRs("/SelectHistory");
        if(historyJson.rtState) {
            var username = historyJson.rtData.sendUser;
            $.each(historyJson.rtData, function (i,v){
                if (v != username){
                    $.each(v, function(j, v1){
                        if (v1.sendUser == username) {
                            // 发送者
                            //动态创建div  追加到j_right后面
                            var $div=$("<div class='j_right'>"
                                + "<span style='align-content: right;'>" + v1.shortTime + "</span><br />"
                                +v1.content+":<img src="+v1.img+" height='50px' width='50px'>"
                                +"</div>"
                            )
                            $div.appendTo(".j_con");
                            $(".j_box").text("")
                            var con = document.querySelector(".j_con")
                        } else {
                            // 接受者
                            //动态创建div  追加到j_right后面
                            var $div=$("<div class='j_left'>"
                                + "<span style='align-content: left;'>" + v1.shortTime + "</span><br />"
                                + "<img src="+v1.img+" height='50px' width='50px'>:" + v1.content
                                +"</div>"
                            )
                            $div.appendTo(".j_con");
                            $(".j_box").text("");
                            receive = v1.sendUser;
                        }
                        var con = document.querySelector(".j_con")
                        con.scrollTop = con.scrollHeight;
                    })
                }
            });
            var $receive = $("<span>" + receive + "</span>");
            $receive.appendTo(".j_title");
            return historyJson.rtState;
        }
    }
	})

</script>
</body>
</html>
