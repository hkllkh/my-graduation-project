
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
    <title>商品列表</title>
    <meta charset="utf-8"/>
    <link rel="stylesheet" href="css/bootstrap.css"/>
</head>
<body>
<div class="container-fluid">

    <jsp:include page="header.jsp"></jsp:include>

    <div class="text-right"><a class="btn btn-warning" href="book_add.jsp">添加商品</a></div>

    <br>






    <br>

    <table class="table table-bordered table-hover">

        <tr>
            <th width="5%">ID</th>
            <th width="10%">图片</th>
            <th width="10%">名称</th>
            <th width="20%">介绍</th>
            <th width="10%">价格</th>
            <th width="25%">操作</th>
        </tr>

        <c:forEach items="${p.list }" var="g">
            <tr>
                <td><p>${g.bid }</p></td>
                <td><p><a href="#" target="_blank"><img src="../${g.bcover}" width="100px" height="100px"></a></p></td>
                <td><p><a href="#" target="_blank">${g.bname}</a></p></td>
                <td><p>${g.bmark}</p></td>
                <td><p>${g.bprice}</p></td>
               
                <td>
                    <p>
                        <c:choose>
                            <c:when test="${g.isScroll }">
                                <a class="btn btn-info" href="book_change.action?bid=${g.bid}&rtype=1&method=remove&page=${rtype}">移出条幅</a>
                            </c:when>
                            <c:otherwise>
                                <a class="btn btn-primary" href="book_change.action?bid=${g.bid}&rtype=1&method=add&page=${rtype}">加入条幅</a>
                            </c:otherwise>
                        </c:choose>
                        <c:choose>
                            <c:when test="${g.isHot }">
                                <a class="btn btn-info" href="book_change.action?bid=${g.bid}&rtype=2&method=remove&page=${rtype}">移出热销</a>
                            </c:when>
                            <c:otherwise>
                                <a class="btn btn-primary" href="book_change.action?bid=${g.bid}&rtype=2&method=add&page=${rtype}">加入热销</a>
                            </c:otherwise>
                        </c:choose>
                        <c:choose>
                            <c:when test="${g.isNew }">
                                <a class="btn btn-info" href="book_change.action?bid=${g.bid}&rtype=3&method=remove&page=${rtype}">移出新品</a>
                            </c:when>
                            <c:otherwise>
                                <a class="btn btn-primary" href="book_change.action?bid=${g.bid}&rtype=3&method=add&page=${rtype}">加入新品</a>
                            </c:otherwise>
                        </c:choose>

                    </p>
                    <a class="btn btn-success" href="book_edit_show.action?bid=${g.bid }">修改</a>
                    <a class="btn btn-danger" href="book_delete.action?bid=${g.bid}&rtype=${rtype}">删除</a>
                </td>
            </tr>
        </c:forEach>


    </table>

    <br>
    <jsp:include page="/page.jsp">
        <jsp:param value="book_list.action" name="url"/>
        <jsp:param value="&rtype=${rtype }" name="param"/>
    </jsp:include>
    <br>
</div>
</body>
</html>
