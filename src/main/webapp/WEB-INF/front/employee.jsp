<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>bbs首页</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/main.css">
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/base.css">--%>
</head>
<body>
    <div class="box">
        <!--头部-->
        <header>
            <a>欢迎${manager.username}登录<span>|</span></a>
            <a href="${pageContext.request.contextPath}/manager/logout">退出系统<span>|</span></a>
            <a href="${pageContext.request.contextPath}/manager/ShowE1?eid=${sessionScope.eid}">个人信息</a>
        </header>
        <div>
        <div class="nav">
            <ul>
                <li><a href="#">职工管理系统首页</a></li><span>|</span>
                <li><a href="${pageContext.request.contextPath}/KQ/toKQ?eid=${sessionScope.eid}&type=${sessionScope.type}">个人考勤信息管理</a></li><span>|</span>
                <li><a href="${pageContext.request.contextPath}/attend/showDA?eid=${sessionScope.eid}&type=${sessionScope.type}">个人培训信息管理</a></li><span>|</span>
                <li><a href="${pageContext.request.contextPath}/ship/showS">个人薪资信息管理</a></li>
<%--               <li><a href="${pageContext.request.contextPath}/selectPostByNav?pid=6">社团群体</a></li>--%>
            </ul>
        </div>
    </div>
    <!--轮播图-->
    <%@include file="rotation.jsp"%>
    <!--重要通知-->
    <div class="notice">
        <div class="left">
            <p>IMPORTANT</p>
            <p>NOTICE</p>
            <p>重要通告</p>
        </div>
        <div class="line"></div>
        <div class="right">
            <p><a>公司企业文化</a></p>
            <div class="rl1"></div><br>
            <p><a>湖南省疾控中心发布新冠肺炎疫情防控公众健康提示</a></p>
            <div class="rl2"></div><br>
            <p><a>关于2022年春节放假通知</a> </p>
        </div>
    </div>
</div>
</body>
</html>





