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
        <a>培训列表</a>
    </div>
    <div class="main">
        <div>
            <c:if test="${sessionScope.type==2}">
            位置:<a href="${pageContext.request.contextPath}/homes/indexh" style="text-decoration: none">首页</a>>>培训
            <input id="addTmplFile" type="button" value="申请培训" onclick="window.location.href='${pageContext.request.contextPath}/attend/ShowAdd'" />
            </c:if>
            <c:if test="${sessionScope.type==1}">
                <input id="addTmplFile" type="button" value="添加员工培训" onclick="window.location.href='${pageContext.request.contextPath}/attend/ShowAdd'" />
            </c:if>

        </div>
        <div>
            <table id="table1" cellspacing="0px">
                <tr class="tableTitle" align="center">
                    <td class="col1">培训号</td>
                    <td class="col1">员工</td>
                    <td class="col1">培训项目</td>
                    <td class="col1">开始日期</td>
                    <td class="col1">结束日期</td>
                    <td class="col1">状态</td>
<%--                    <td class="col1">操作</td>--%>
                </tr>
                <c:forEach items="${attendList}" var="list">
                    <tr align="center">
                        <td class="col1">${list.aid}</td>
                        <td class="col1">${list.get('username')}</td>
                        <td class="col1">${list.get('pname')}</td>
                        <td class="col1">${list.startd}</td>
                        <td class="col1">${list.endd}</td>
                        <td class="col1">${list.staut}</td>
<%--                       <td class="col1">--%>
<%--                            <a href="${pageContext.request.contextPath}/attend/toFix?aid=${list.aid}" style="text-decoration: none;">修改</a>--%>
<%--                            <a href="${pageContext.request.contextPath}/attend/delete?aid=${list.aid}" style="text-decoration: none;">删除</a>--%>
<%--                        </td>--%>
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