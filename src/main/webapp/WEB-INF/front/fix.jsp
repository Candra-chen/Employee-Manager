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
    <title>注册页面</title>
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

        #btn_sub,#btn_sub1 {
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
    <script>
        window.onload = function(){
            document.getElementById("form").onsubmit = function(){
                return checkUsername() && checkPassword();
            };
            document.getElementById("username").onblur = checkUsername;
            document.getElementById("password").onblur = checkPassword;
        };

        function checkUsername(){
            var username = document.getElementById("username").value;
            var s_username=document.getElementById("s_username");
            if(username==null){
                s_username.innerHTML = "用户名不能为空";
            }
        }

        function checkPassword(){
            var password = document.getElementById("password").value;
            var s_password = document.getElementById("s_password");
            if(password==null){
                s_password.innerHTML = "用户名不能为空";
            }
        }

    </script>
</head>
<body>

<div class="rg_layout">

    <div class="rg_left">
            <p>修改员工信息</p>
    </div>

    <div class="rg_center">
        <div class="rg_form">
            <form action="${pageContext.request.contextPath}/manager/fix" id="form" method="get">
                <table>
                    <c:if test="${!empty manager.username}">
                    <tr hidden>
                        <td class="td_left">用户id</td>
                        <td class="td_right">
                            <input type="text" name="eid" id="eid" value="${eid}">
                        </td>
                    </tr>
                    </c:if>
                    <tr>
                        <td class="td_left"><label for="username">用户名</label></td>
                        <td class="td_right">
                            <input type="text" name="username" id="username" placeholder="请输入用户名" value="${fixManager.username}">
                            <span id="s_username" class="error"></span>
                        </td>
                    </tr>

                    <tr>
                        <td class="td_left"><label for="password">密码</label></td>
                        <td class="td_right">
                            <input type="text" name="password" id="password" value="${fixManager.password}">
                            <span id="s_password" class="error"></span>
                        </td>
                    </tr>

                    <tr>
                        <td class="td_left"><label for="email">电子邮箱</label></td>
                        <td class="td_right"><input type="email" name="email" id="email" value="${fixManager.email}"></td>
                    </tr>

                    <tr>
                        <td class="td_left"><label>姓名</label></td>
                        <td class="td_right"><input type="text" name="uname" id="uname" value="${fixManager.uname}"></td>
                    </tr>

                    <tr>
                        <td class="td_left"><label for="tel">手机号</label></td>
                        <td class="td_right"><input type="text" name="tel" id="tel" value="${fixManager.tel}"></td>
                    </tr>

                    <tr>
                        <td class="td_left"><label>性别</label></td>
                        <td class="td_right">
                            <input type="radio" name="sex" value="male" checked="<c:if test="${fixManager.sex=='male'}">checked</c:if>"> 男
                            <input type="radio" name="sex" value="female" checked="<c:if test="${fixManager.sex=='female'}">checked</c:if>"> 女
                        </td>
                    </tr>

                    <tr>
                        <td class="td_left"><label for="indate">入职日期</label></td>
                        <td class="td_right"><input type="date" name="indate" id="indate" value="${fixManager.indate}"></td>
                    </tr>

                    <tr>
                        <td class="td_left"><label>部门</label></td>

                        <td class="td_right"><select name="did" id="did" >
                            <c:forEach items="${deptList}" var="dept">
                                <option  <c:if test="${fixManager.get('dname')==dept.dname}">selected</c:if> value="${dept.did}">${dept.dname}</option>
                            </c:forEach>
                        </select>
                        </td>
                    </tr>

                    <tr>
                        <td class="td_left"><label>职务</label></td>
                        <td class="td_right">
                            <select name="pid" id="pid">
                                <c:forEach items="${positionsList}" var="positions">
                                    <option  <c:if test="${fixManager.get('pname')==positions.pname}">selected</c:if> value="${positions.pid}">${positions.pname}</option>
                                </c:forEach>

                            </select>
                        </td>
                    </tr>
                    <tr>
                       <td colspan="2" id="td_sub1"><input type="submit" id="btn_sub" value="修改"></td>
                    </tr>
                </table>

            </form>
        </div>
    </div>

    <div class="rg_right">
       <a href="${pageContext.request.contextPath}/manager/showE">返回</a>
    </div>

</div>

</body>
</html>
