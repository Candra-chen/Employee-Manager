<%--
  Created by IntelliJ IDEA.
  User: 忍冬
  Date: 2022-11-28
  Time: 13:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>轮播图</title>
    <style type="text/css" rel="stylesheet">
        *{
            font-size: 12px;
        }
        ul{
            margin: 0;
            padding: 0;
            list-style: none;
        }
    </style>
</head>
<body>
<!--轮播图-->
<div class="rotation">
    <ul class="ul1"id="ul1">
        <li> <img src="${pageContext.request.contextPath}/static/pic/01ed9d554300780000019ae90700b7.jpg@1280w_1l_2o_100sh.jpg" width="950" height="400"/></li>
        <li> <img src="${pageContext.request.contextPath}/static/pic/pexels-photo-302769.jpeg" width="950" height="400"/></li>
        <li> <img src="${pageContext.request.contextPath}/static/pic/pexels-scott-webb-27406.jpg" width="950" height="400"/></li>
        <li> <img src="${pageContext.request.contextPath}/static/pic/R-C.jpg" width="950" height="400"/></li>
        <li> <img src="${pageContext.request.contextPath}/static/pic/sh.jpg" width="950" height="400"/></li>
    </ul>
    <div class="left-button indexs"id="left-button">&lt;</div>
    <div class="right-button indexs"id="right-button">&gt;</div>
    <ul class="ul2 indexs"id="ul2">
        <li>1</li>
        <li>2</li>
        <li>3</li>
        <li>4</li>
        <li>5</li>
    </ul>
</div>
<script type="text/javascript">
    var image=document.getElementById("ul1").children;
    var button=document.getElementById("ul2").children;
    var leftbutton=document.getElementById("left-button");
    var rightbutton=document.getElementById("right-button");
    var index=0;
    var dingshiqi;
    congqi();
    function congqi() {
        dingshiqi = setInterval(function () {
            index++;
            if (index == image.length) {
                index = 0;
            }
            for (var i = 0; i < image.length; i++) {
                image[i].style.cssText = "z-index:0;";
                button[i].style.cssText="background-color:#fff;color:#000;";
            }
            image[index].style.cssText = "z-index:100;";
            button[index].style.cssText="background-color:red;color:#fff;";
        }, 2000);
    }
    leftbutton.onclick = function () {
        clearInterval(dingshiqi);
        index--;
        if (index < 0) {
            index = image.length - 1;
        }
        for (var i = 0; i < image.length; i++) {
            image[i].style.cssText = "z-index:0;";
            button[i].style.cssText="background-color:#fff;color:#000;";
        }
        image[index].style.cssText = "z-index:100";
        button[index].style.cssText="background-color:red;color:#fff;";
        congqi();
    }
    rightbutton.onclick = function () {
        clearInterval(dingshiqi);
        index++;
        if (index > image.length - 1) {
            index = 0;
        }
        for (var i = 0; i < image.length; i++) {
            image[i].style.cssText = "z-index:0;";
            button[i].style.cssText="background-color:#fff;color:#000;";
        }
        image[index].style.cssText = "z-index:100;";
        button[index].style.cssText="background-color:red;color:#fff;";
        congqi();
    }
    button[0].onclick=function () {
        clearInterval(dingshiqi);
        index=0;
        for (var i=0;i<image.length;i++){
            image[i].style.cssText="z-index:0;";
            button[i].style.cssText="background-color:#fff;color:#000;";
        }
        image[index].style.cssText = "z-index:100;";
        button[0].style.cssText="background-color:red;color:#fff;"
        congqi();
    }
    button[1].onclick=function () {
        clearInterval(dingshiqi);
        index=1;
        for (var i=0;i<image.length;i++){
            image[i].style.cssText="z-index:0;";
            button[i].style.cssText="background-color:#fff;color:#000;";
        }
        image[index].style.cssText = "z-index:100;";
        button[1].style.cssText="background-color:red;color:#fff;"
        congqi();
    }
    button[2].onclick=function () {
        clearInterval(dingshiqi);
        index=2;
        for (var i=0;i<image.length;i++){
            image[i].style.cssText="z-index:0;";
            button[i].style.cssText="background-color:#fff;color:#000;";
        }
        image[index].style.cssText = "z-index:100;";
        button[2].style.cssText="background-color:red;color:#fff;"
        congqi();
    }
    button[3].onclick=function () {
        clearInterval(dingshiqi);
        index=3;
        for (var i=0;i<image.length;i++){
            image[i].style.cssText="z-index:0;";
            button[i].style.cssText="background-color:#fff;color:#000;";
        }
        image[index].style.cssText = "z-index:100;";
        button[3].style.cssText="background-color:red;color:#fff;"
        congqi();
    }
    button[4].onclick=function () {
        clearInterval(dingshiqi);
        index=4;
        for (var i=0;i<image.length;i++){
            image[i].style.cssText="z-index:0;";
            button[i].style.cssText="background-color:#fff;color:#000;";
        }
        image[index].style.cssText = "z-index:100;";
        button[4].style.cssText="background-color:red;color:#fff;"
        congqi();
    }
</script>
</body>
</html>
