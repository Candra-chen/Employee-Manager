<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
<%--
  Created by IntelliJ IDEA.
  User: 忍冬
  Date: 2022-11-08
  Time: 13:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8" />
    <title>职工信息管理系统</title>
    <style type="text/css">
        #aa{height: 30px;width: 100%;float: left;}
        /* html.body{width: 100%;height: 100%;} */
        #AA1{width: 100%;height: 700px;float: left;box-shadow: 0px 0px 35px 0px #6495ED;z-index: 1;}
        /* body{background-size: 100%; *//* background:-webkit-linear-gradient(right,#6495ED,pink); background-size: 50%; *//* } */
        #a1{width: 100%;height: 250px;float: left;padding-left: 0px;font-size: x-large;padding-top: 0px;z-index: 1;background:#6495ED/* -webkit-linear-gradient(left,#6495ED) */;
            background-size: 100%;border-radius: 0px 0px 40% 40%/0px 0px 90px 90px;}
        #a2{width: 30%;height: 400px;float: left;position: fixed;left: 15%;top: 150px;z-index: 2;}
        #a4{width: 400px;height: 400px;float: left;border-radius: 0px 27px 27px 0px;background-color:white;
            text-align: center;box-shadow: 0px 0px 35px 0px #6495ED;position: absolute;left: 45%;top: 120px;z-index: 2;}
        .i2{border-radius: 10px 10px 10px 10px;height: 30px;width: 230px;}
        #i3,#ii3{border-radius: 20px 20px 20px 20px;color: #000000;height: 40px;width: 100px;font-size: large;background-color:white;
            margin-left: 25px;}
        #vcode{border-radius: 10px 10px 10px 10px;height: 30px;width: 150px;}
        #code{background:-webkit-linear-gradient(right,#6495ED,pink,#6495ED,pink);color: white; font-size: 22px;width: 100px;height: 35px;margin-left: 20px;font-family: "楷体";
            cursor: pointer;padding: 5px;}
        #shu{border-radius: 27px 0px 0px 27px;box-shadow: 0px 0px 35px 0px #6495ED;}
        a:link{color: #6495ED;
        }
    </style>
</head>
<body onload="changeImg()">
<center></center>
<div id="AA1">

    <div id="a1">
        <div id="aa">

        </div>
        <span>    </span>
        <font size="6" style="font-family:'Lucida Calligraphy', cursive, serif, sans-serif;" ><b>职工信息管理系统</b></font>

    </div>

    <div id="a2">
        <!-- <img src="img/书本.jpg" align="right" height="400px" id="shu"> -->
    </div>
    <div id="a4">
        <h1>欢迎登录</h1>
        <hr width="70%" size="3" color="black">
        <form action="" onsubmit="check()" id="login1">
<%--            onsubmit="return check()"--%>
            <br>
            <input type="text" id="username" name="username" placeholder="用户名" class="i2"/><br>
            <span></span><br>
            <input type="password" name="password" id="password" placeholder="密码" class="i2"/><br><br>
            <input type="text" id="vcode" placeholder="验证码" value="验证码" onfocus="this.value=''" onblur="if(this.value=='')this.value='验证码'" /><span id="code" title="看不清，换一张"></span><br><br>
            <input type="submit" name="login" id="i3" value="登录" class="btns" onmouseover="this.style.backgroundColor=''" onmousedown="this.style.backgroundColor='#6495ED'">
            <input type="reset" name="reset" id="ii3" value="取消" class="btns" onmouseover="this.style.backgroundColor=''" onmousedown="this.style.backgroundColor='pink'">
        </form>
        <p><a href="${pageContext.request.contextPath}/homes/forget" style="text-decoration:none;">忘记密码？</a><a href="${pageContext.request.contextPath}/homes/toRegister" style="text-decoration:none; ;">去注册</a></p>
        <p><c:if test="${!empty msg}">${msg}</c:if></p>

    </div>
</div>
</center>
<script type="text/javascript">
    var code; //声明一个变量用于存储生成的验证码
    document.getElementById("code").onclick = changeImg;

    function changeImg() {
        var arrays = new Array(
            '1', '2', '3', '4', '5', '6', '7', '8', '9', '0',
            'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j',
            'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't',
            'u', 'v', 'w', 'x', 'y', 'z',
            'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',
            'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T',
            'U', 'V', 'W', 'X', 'Y', 'Z'
        );
        code = ''; //重新初始化验证码
        //alert(arrays.length);
        for(var i = 0; i < 4; i++) {
            var r = parseInt(Math.random() * arrays.length);
            code += arrays[r];
        }
        document.getElementById('code').innerHTML = code; //将验证码写入指定区域
    }
    function check() {
        var p = document.getElementById("login1");
        var input_code = document.getElementById('vcode').value;
        if(input_code.toLowerCase() == code.toLowerCase()) {
            // alert("欢迎登录~");
           p.action="${pageContext.request.contextPath}/manager/login";
           return p.action;
        }
        else{
            alert("请输入正确的验证码!");
            return false;
        }


    }
</script>
</body>
</html>