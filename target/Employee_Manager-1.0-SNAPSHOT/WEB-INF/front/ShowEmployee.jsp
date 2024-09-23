<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 忍冬
  Date: 2022-11-02
  Time: 11:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>--%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>员工信息管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/showE.css" type="text/css">
    <!-- <script src="myJaveScript.js" type="text/javascript"></script> -->
</head>
<body>
<div id="total1">
    <div class="top">
        <a>员工列表</a>
    </div>
    <div class="main">
        <div>
            <input id="addTmplFile" type="button" value="添加员工信息" onclick="window.location.href='${pageContext.request.contextPath}/homes/toRegister'" />
        </div>
        <div>
            <table id="table1" cellspacing="0px">
                <tr class="tableTitle" align="center">
                    <td class="col1">员工号</td>
                    <td class="col1">姓名</td>
                    <td class="col1">性别</td>
                    <td class="col1">部门</td>
                    <td class="col1">职务</td>
                    <td class="col1">用户名</td>
                    <td class="col1">密码</td>
                    <td class="col1">电话号码</td>
                    <td class="col1">电子邮箱</td>
                    <td class="col1">入职日期</td>
                    <td class="col1">操作</td>
                </tr>
                <c:forEach items="${managerList}" var="mlist">
                <tr  align="center">

                    <td class="col1">${mlist.eid}</td>
                    <td class="col1">${mlist.username}</td>
                    <td class="col1">${mlist.sex}</td>
                    <td class="col1">${mlist.get("dname")}</td>
                    <td class="col1">${mlist.get("pname")}</td>
                    <td class="col1">${mlist.uname}</td>
                    <td class="col1">${mlist.password}</td>
                    <td class="col1">${mlist.tel}</td>
                    <td class="col1">${mlist.email}</td>
                    <td class="col1">${mlist.indate}</td>
                    <td class="col1"><a href="${pageContext.request.contextPath}/manager/delete?eid=${mlist.eid}" style="text-decoration: none">删除</a>
                        <a href="${pageContext.request.contextPath}/homes/toFix?eid=${mlist.eid}" style="text-decoration: none">修改</a>
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
                &nbsp; <c:url var="url_pre" value="/manager/showE">
                <c:param name="pageCur" value="${pageCur - 1 }"/>
                <c:param name="perPageSize" value="${perPageSize}"/>
            </c:url>
                <c:url var="url_next" value="/manager/showE">
                    <c:param name="pageCur" value="${pageCur + 1 }"/>
                    <c:param name="perPageSize" value="${perPageSize}"/>
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
<script type="text/javascript">
    function getSelectedValue(){
        var oSelected = document.getElementById('sel');//获得select对象
        var selectedValue = oSelected.options[oSelected.selectedIndex].value;//获得选中的option的value
        return selectedValue;
    }
</script>