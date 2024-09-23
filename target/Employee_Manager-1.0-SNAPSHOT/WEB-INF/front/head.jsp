<%--
  Created by IntelliJ IDEA.
  User: 忍冬
  Date: 2022-11-02
  Time: 11:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>后台</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/base.css">
</head>
<body>
<div class="main">
    <div class="header">
        <ul class="ah">
            <li class="lh">职工信息管理系统</li>
            <font color="black"> <li class="rh">欢迎你,${manager.username}</li></font>
        </ul>
    </div>
    <form class="bodys">
        <div class="leftmenu">
            <ul class="le1">

                        <li class="item2" ><a href="javascript:void(0);" onmousedown="showConent('${pageContext.request.contextPath}/manager/showE')">员工信息</a> </li>
              <li class="item2"> <a href="javascript:void(0);" onmousedown="showConent('${pageContext.request.contextPath}/dept/showDE')">部门信息</a>
                </li>
                        <li class="item2"><a href="javascript:void(0);" onmousedown="showConent('${pageContext.request.contextPath}/positions/showDP')">职务列表</a> </li>


                        <li class="item2"><a href="javascript:void(0);" onmousedown="showConent('${pageContext.request.contextPath}/KQ/toKQ?eid=${sessionScope.eid}&type=${sessionScope.type}')">考勤信息</a> </li>
                        <li class="item2"><a href="javascript:void(0);" onmousedown="showConent('${pageContext.request.contextPath}/ship/showS?eid=${sessionScope.eid}&type=${sessionScope.type}')">员工工资信息</a> </li>
                <li class="item2"><a href="javascript:void(0);" onmousedown="showConent('${pageContext.request.contextPath}/income/showDI?eid=${sessionScope.eid}')">员工奖惩信息</a> </li>
                <li class="item2"><a href="javascript:void(0);" onmousedown="showConent('${pageContext.request.contextPath}/attend/showDA?eid=${sessionScope.eid}&type=${sessionScope.type}')">培训信息</a> </li>
                        <li class="item2"><a href="javascript:void(0);" onmousedown="showConent('${pageContext.request.contextPath}/manager/ShowE1?eid=${sessionScope.eid}')">个人信息管理</a> </li>
                    </ul>
        </div>
        <div class="maincontent">
            <iframe src="" id="right_content" width="100%" height="100%"></iframe>
        </div>
    </form>
    </div>
</div>
</body>
</html>
<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript">
    function showConent(url) {
        var p = document.getElementById("right_content");
        p.src=url;
    }
    function f(str){
        var sub_menu = document.getElementById(str);
        var dis_v = sub_menu.style.display;

        if(dis_v == "block")
            sub_menu.style.display = "none";
        else
            sub_menu.style.display = "block";

    }
</script>