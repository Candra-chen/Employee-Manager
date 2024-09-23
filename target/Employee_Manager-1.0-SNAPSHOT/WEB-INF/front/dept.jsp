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
       <c:if test="${!empty deptList}"><a>部门列表</a></c:if>
    </div>
    <div class="main">
        <c:if test="${sessionScope.type==2}">
            <input id="addTmplFile1" type="button" value="返回到首页" onclick="window.location.href='${pageContext.request.contextPath}/homes/indexh'" />
            <input id="addTmplFile" type="button" value="添加部门" onclick="window.location.href='${pageContext.request.contextPath}/dept/ShowAdd'" />
        </c:if>
        <c:if test="${sessionScope.type==1}">
            <input id="addTmplFile" type="button" value="添加部门" onclick="window.location.href='${pageContext.request.contextPath}/dept/ShowAdd'" />
        </c:if>
        </div>
        <div>
            <table id="table1" cellspacing="0px">
                <tr class="tableTitle" align="center">
                    <td class="col1">部门号</td>
                    <td class="col1">部门名字</td>
                    <td class="col1">部门负责人</td>
                    <td class="col1">创建日期</td>
                    <td class="col1">操作</td>
                </tr>
                <c:forEach items="${deptList}" var="list">
                    <tr align="center">
                        <td class="col1">${list.did}</td>
                        <td class="col1">${list.dname}</td>
                        <td class="col1">${list.duty_man}</td>
                        <td class="col1">${list.cdate}</td>
                           <td class="col1"> <a href="${pageContext.request.contextPath}/dept/toFix?did=${list.did}" style="text-decoration: none;">修改</a>
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
                <c:url var="url_pre" value="/dept/showDE">
                    <c:param name="pageCur" value="${pageCur - 1 }"/>
                </c:url>
                <c:url var="url_next" value="/dept/showDE">
                    <c:param name="pageCur" value="${pageCur + 1 }"/>
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