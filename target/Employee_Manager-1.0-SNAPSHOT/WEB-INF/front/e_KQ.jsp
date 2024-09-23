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
    <title>考勤信息管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/showE.css" type="text/css">
</head>
<body>
<div id="total1">
    <div class="top">
        <a>考勤列表</a>
    </div>
    <div class="main">
        <div>
            <c:if test="${sessionScope.type==2}">
            位置:<a href="${pageContext.request.contextPath}/homes/indexh" style="text-decoration: none">首页</a>>>考勤
                        <input id="addTmplFile" type="button" value="打卡" onclick="window.location.href='${pageContext.request.contextPath}/KQ/ShowAdd?eid=${sessionScope.eid}'" />
            </c:if>
            <c:if test="${sessionScope.type==1}">
                <input id="addTmplFile" type="button" value="添加考勤" onclick="window.location.href='${pageContext.request.contextPath}/KQ/ShowAdd?eid=${sessionScope.eid}'" />
            </c:if>
        </div>
        <div>
            <table id="table1" cellspacing="0px">
                <tr class="tableTitle" align="center">
                    <td class="col1">考勤号</td>
                    <td class="col1">员工</td>
                    <td class="col1">考勤状态</td>
                    <td class="col1">日期</td>
                </tr>
                <c:forEach items="${KQList}" var="list">
                    <tr align="center">
                        <td class="col1">${list.cid}</td>
                        <td class="col1">${list.get('username')}</td>
                        <td class="col1">${list.checkstaut}</td>
                        <td class="col1">${list.chdate}</td>
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
                <c:url var="url_pre" value="/KQ/toKQ">
                    <c:param name="pageCur" value="${pageCur - 1 }"/>
                    <c:param name="eid" value="${eid}"/>
                    <c:param name="type" value="${type}"/>
                </c:url>
                <c:url var="url_next" value="/KQ/toKQ">
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