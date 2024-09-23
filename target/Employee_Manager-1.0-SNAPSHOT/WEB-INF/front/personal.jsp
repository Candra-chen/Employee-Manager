<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 忍冬
  Date: 2022-11-12
  Time: 13:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>个人页面</title>
    <style>
        body {
            background-color:#b1dafd;
        }

        .rg_layout {
            width: 900px;
            height: 500px;
            border: 8px solid white;
            background-color: white;
            margin: auto;
        }

        .rg_left {
            float: left;
            margin: 15px;
        }
        .rg_center {
            float: left;
        }
        .rg_right {
            float: right;
            margin: 15px;
        }

        .rg_left > p:first-child {
            color:#6495ED;
            font-size: 20px;
        }

        .rg_left > p:last-child {
            color:#6495ED;
            font-size: 20px;
        }

        .rg_right > p:first-child {
            font-size: 15px;

        }
        .rg_right p a {
            color:pink;
            text-decoration: none;
        }

        .td_left {
            width: 100px;
            height: 45px;
            text-align: right;
        }
        .td_right {
            padding-left: 50px ;
        }

        #username, #password, #email, #uname, #tel, #indate{
            width: 251px;
            height: 32px;
            border: 1px solid #A6A6A6;
            border-radius: 5px;
            padding-left: 10px;
        }

        #checkcode {
            width: 110px;
        }

        #img_check {
            height: 32px;
            vertical-align: middle;
        }

        #btn_sub,#btn_sub1,#btn_sub2 {
            width: 150px;
            height: 40px;
            background-color: #89aef2;
            border: 1px solid#5e94f7 ;
        }

        .error {
            color:red;
        }
        #td_sub {
            padding-left: 150px;
        }
    </style>
</head>
<body>

<div class="rg_layout">

    <div class="rg_left">
        <p>修改个人信息</p>
    </div>

    <div class="rg_center">
        <div class="rg_form">
            <form action="${pageContext.request.contextPath}/manager/fixPersonal" id="form" method="get">
                <table>
                    <c:if test="${!empty manager.username}">
                        <tr hidden>
                            <td class="td_left">用户id</td>
                            <td class="td_right">
                                <input type="text" name="eid" id="eid" value="${manager1.eid}">
                            </td>
                        </tr>
                    </c:if>
                    <tr>
                        <td class="td_left"><label for="username">用户名</label></td>
                        <td class="td_right">
                            <input type="text" name="username" id="username" placeholder="请输入用户名" value="${manager1.username}">
                            <span id="s_username" class="error"></span>
                        </td>
                    </tr>

                    <tr>
                        <td class="td_left"><label for="password">密码</label></td>
                        <td class="td_right">
                            <input type="text" name="password" id="password" value="${manager1.password}">
                            <span id="s_password" class="error"></span>
                        </td>
                    </tr>

                    <tr>
                        <td class="td_left"><label for="email">电子邮箱</label></td>
                        <td class="td_right"><input type="email" name="email" id="email" value="${manager1.email}"></td>
                    </tr>

                    <tr>
                        <td class="td_left"><label>姓名</label></td>
                        <td class="td_right"><input type="text" name="uname" id="uname" value="${manager1.uname}"></td>
                    </tr>

                    <tr>
                        <td class="td_left"><label for="tel">手机号</label></td>
                        <td class="td_right"><input type="text" name="tel" id="tel" value="${manager1.tel}"></td>
                    </tr>

                    <tr>
                        <td class="td_left"><label>性别</label></td>
                        <td class="td_right">
                            <input type="radio" name="sex" value="male" checked="<c:if test="${manager1.sex=='male'}">checked</c:if>"> 男
                            <input type="radio" name="sex" value="female" checked="<c:if test="${manager1.sex=='female'}">checked</c:if>"> 女
                        </td>
                    </tr>

                    <tr>
                        <td class="td_left"><label for="indate">入职日期</label></td>
                        <td class="td_right"><input type="date" name="indate" id="indate" value="${manager1.indate}"></td>
                    </tr>
                    <tr>
                            <td colspan="2" id="td_sub1"><input type="submit" id="btn_sub" value="修改信息"></td>
                    </tr>
                </table>

            </form>
        </div>
    </div>

    <div class="rg_right">
        <c:if test="${sessionScope.type==2}">
        <p>
        <a href="${pageContext.request.contextPath}/homes/indexh" target="_parent" style="text-decoration: none">返回</a>
          </p>
    </c:if>
    <c:if test="${sessionScope.type==1}">
    <p>
        <a href="${pageContext.request.contextPath}/manager/logout" target="_parent" style="text-decoration: none">退出登录</a>
    </p>
</c:if>
    </div>
</div>

</body>
</html>
