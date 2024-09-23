<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
<%--
  Created by IntelliJ IDEA.
  User: 忍冬
  Date: 2022-11-15
  Time: 1:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>员工信息管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/showE.css" type="text/css">
</head>
<body>
<div id="total1">
    <div class="top">
        <a>奖惩列表</a>
    </div>
    <div class="main">
        <div>
            <input id="addTmplFile" type="button" value="添加奖惩信息" onclick="window.location.href='${pageContext.request.contextPath}/income/ShowAdd'" />
        </div>
        <div>
            <table id="table1" cellspacing="0px">
                <tr class="tableTitle" align="center">
                    <td class="col1">奖惩号</td>
                    <td class="col1">员工</td>
                    <td class="col1">奖惩类型</td>
                    <td class="col1">奖惩原因</td>
                    <td class="col1">处理意见</td>
                    <td class="col1">奖惩日期</td>
                    <td class="col1">经手人</td>
                    <td class="col1">操作</td>
                </tr>
                <c:forEach items="${incomeList}" var="list">
                    <tr align="center">
                        <td class="col1">${list.id}</td>
                        <td class="col1">${list.get('username')}</td>
                        <td class="col1">${list.itype}</td>
                        <td class="col1">${list.ireason}</td>
                        <td class="col1">${list.itype}${list.staut}</td>
                        <td class="col1">${list.idate}</td>
                        <td class="col1">${list.get('duty_man')}</td>
                        <td class="col1">
                            <a href="${pageContext.request.contextPath}/income/toFix1?id=${list.id}" style="text-decoration: none;">修改</a>
                            <a href="${pageContext.request.contextPath}/income/delete?id=${list.id}" style="text-decoration: none;">删除</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <div id="lowerLbl" align="center">
                <p>共</p>
                <p id="rowsNum">${totalCount}</p>
                <p>记录</p>
                <p>共</p>
                <p>${totalPage}</p>&nbsp;
                <p>页</p>
                &nbsp; <c:url var="url_pre" value="/attend/showDA">
                <c:param name="pageCur" value="${pageCur - 1 }"/>
                <c:param name="eid" value="${eid}"/>
                <c:param name="type" value="${type}"/>
            </c:url>
                <c:url var="url_next" value="/attend/showDA">
                    <c:param name="pageCur" value="${pageCur + 1 }"/>
                    <c:param name="eid" value="${eid}"/>
                    <c:param name="type" value="${type}"/>
                </c:url>
                <c:if test="${pageCur != 1 }">
                    <a href="${url_pre}" style="text-decoration: none">  <button> < </button></a>
                </c:if>
                <button id="pno" style="background-color:#6495ED; color: white">${pageCur}</button>
                <c:if test="${pageCur != totalPage && totalPage != 0}">
                    <a href="${url_next}" style="text-decoration: none">
                        <button>
                            >
                        </button>
                    </a>
                    &nbsp;</c:if>
            </div>
        </div>
    </div>

</div>
</body>
</html>