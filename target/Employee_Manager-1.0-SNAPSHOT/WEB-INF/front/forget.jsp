<%--
  Created by IntelliJ IDEA.
  User: 忍冬
  Date: 2022-11-12
  Time: 14:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>忘记密码页面</title>
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

        #username, #password, #email, #name, #tel, #birthday, #checkcode {
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

        #btn_sub {
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
        .top
        {
            border-top: 200px;
        }
    </style>
</head>
<body>

<div class="rg_layout">

    <div class="rg_left">
        <p>忘记密码</p>
    </div>

    <div class="rg_center">
        <div class="rg_form">
            <form action="${pageContext.request.contextPath}/manager/forget?username=${username}" id="form" method="get">
                <table>
                    <tr><br/></tr>
                    <tr><br/></tr>
                    <tr><br/></tr>
                    <tr><br/></tr>
                    <tr><br/></tr>
                    <tr><br/></tr>
                    <tr><br/></tr>
                    <tr><br/></tr>
                    <c:if test="${empty password}">
                    <tr class="top">
                        <td class="td_left"><label>用户名</label></td>
                        <td class="td_right">
                            <input type="text" name="username" id="username" placeholder="请输入用户名">
                        </td>
                    </tr>
                    </c:if>
                    <c:if test="${!empty password}">
                    <tr>
                        <td class="td_left"><label for="password">密码</label></td>
                        <td class="td_right">
                            <input type="text" name="password" id="password" value="${password}">
                        </td>
                    </tr>
                    </c:if>
                    <tr>
                        <td colspan="2" id="td_sub"><input type="submit" id="btn_sub" value="找回密码"></td>
                    </tr>
                </table>

            </form>
        </div>
    </div>

    <div class="rg_right">
        <p>找回密码?<a href="${pageContext.request.contextPath}/homes/toLogin">立即登录</a></p>
    </div>

</div>

</body>
</html>

