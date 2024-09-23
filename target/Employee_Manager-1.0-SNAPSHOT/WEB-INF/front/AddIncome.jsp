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
        <p>添加奖惩信息</p>
    </div>

    <div class="rg_center">
        <div class="rg_form">
            <form action="${pageContext.request.contextPath}/income/toAdd" id="form" method="get">
                <table>
                    <tr>
                        <td class="td_left"><label for="username">员工号</label></td>
                        <td class="td_right">
                            <input type="text" name="eid" id="username">
                            <span id="s_username" class="error"></span>
                        </td>
                    </tr>

                    <tr>
                        <td class="td_left"><label for="username">奖惩类型</label></td>
                        <td class="td_right">
                            <input type="text" name="itype" id="username1">
                            <span id="s_username1" class="error"></span>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_left"><label for="username">奖惩原因</label></td>
                        <td class="td_right">
                            <input type="text" name="ireason" id="reason">
                        </td>
                    </tr>
                    <tr>
                        <td class="td_left"><label for="reason1">处理结果</label></td>
                        <td class="td_right">
                            <input type="text" name="staut" id="reason1">
                        </td>
                    <tr>
                    <tr>
                        <td class="td_left"><label for="idate">处理日期</label></td>
                        <td class="td_right"><input type="date" name="idate" id="idate"></td>
                    </tr>
                    <tr>
                        <td class="td_left"><label for="email">经手人</label></td>
                        <td class="td_right"><input type="text" name="did" id="email"></td>
                    </tr>
                        <td colspan="2" id="td_sub1"><input type="submit" id="btn_sub" value="添加"></td>
                    </tr>
                </table>

            </form>
        </div>
    </div>

    <div class="rg_right">
        <p>
            <a href="${pageContext.request.contextPath}/income/showDI" style="text-decoration: none">返回</a>
        </p>
    </div>

</div>

</body>
</html>
