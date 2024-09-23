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
        <p>申请培训信息</p>
    </div>

    <div class="rg_center">
        <div class="rg_form">
            <form action="${pageContext.request.contextPath}/attend/toAdd" id="form" method="get">
                <table>
                    <c:if test="${!empty manager.username}">
                        <tr hidden>
                            <td class="td_left">培训号</td>
                            <td class="td_right">
                                <input type="text" name="cid" id="cid">
                            </td>
                        </tr>
                    </c:if>
                    <tr>
                        <td class="td_left"><label for="username">员工</label></td>
                        <td class="td_right">
                            <input type="text" name="eid" id="username" placeholder="请输入用户名" value="${manager.eid}">
                            <span id="s_username" class="error"></span>
                        </td>
                    </tr>

                    <tr>
                        <td class="td_left"><label>培训项目</label></td>

                        <td class="td_right"><select name="pid">
                            <c:forEach items="${positionList}" var="pos">
                                <option value="${pos.pid}">${pos.pname}</option>
                            </c:forEach>
                        </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_left"><label for="indate">开始日期</label></td>
                        <td class="td_right"><input type="date" name="startd" id="indate1" placeholder="请输开始日期"></td>
                    </tr>
                    <tr>
                        <td class="td_left"><label for="indate">结束日期</label></td>
                        <td class="td_right"><input type="date" name="endd" id="indate" placeholder="请输结束日期"></td>
                    </tr>
                    <tr>
                        <td colspan="2" id="td_sub1"><input type="submit" id="btn_sub" value="添加培训"></td>
                    </tr>
                </table>

            </form>
        </div>
    </div>

    <div class="rg_right">
        <p>
            <a href="${pageContext.request.contextPath}/attend/showDA" style="text-decoration: none">返回</a>
        </p>
    </div>

</div>

</body>
</html>
