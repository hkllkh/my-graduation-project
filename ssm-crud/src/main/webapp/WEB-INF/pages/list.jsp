<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%
	pageContext.setAttribute("APP_PATH",request.getContextPath());
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
<script type="text/javascript" src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/jq/jquery-3.4.1.min.js"></script>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<!-- 标题 -->
		<div class="row">
		  	<div class="col-md-12">
		  		<h1>SSM-CRUD</h1>
		  	</div>
		</div>
		
		<!-- 按钮 -->
		<div class="row">
			  <div class="col-md-4 col-md-offset-10">
			  		<button type="button" class="btn btn-success">
				  		<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
				  		新增
			  		</button>	
			  		<button type="button" class="btn btn-danger">
				  		<span class="glyphicon glyphicon-trash" aria-hidden="true">
				  		删除
				  	</button>
			  </div>
		</div>
		
		<!-- 显示 -->
		<div class="row">
		  	<div class="col-md-12">
				<table  class="table table-striped">
					<tr>
						<td>id</td>
						<td>empName</td>
						<td>gender</td>
						<td>email</td>
						<td>department</td>
						<td>操作</td>
					</tr>
					
					<c:forEach items="${emps.list}"  var="emp">
					<tr>
						<td>${emp.id}</td>
						<td>${emp.lastName}</td>
						<td>${emp.gender=="0"?"女":"男"}</td>
						<td>${emp.email}</td>
						<td>${emp.department.deptName}</td>
						<td>
							<button class="btn btn-success btn-sm">
									<span class="glyphicon glyphicon-pencil" aria-hidden="true">
										编辑
									</span>
								</button>
							<button class="btn btn-danger btn-sm">
								<span class="glyphicon glyphicon-trash" aria-hidden="true">
									删除
								</span>
							</button>
						</td>
					</tr>
					
					</c:forEach>

				</table>
			</div>
		</div>
		
		
		
		
		<!-- 分页 -->
		<div class="row">
			<div class="col-md-6 ">
				当前${emps.pageNum }页,总共${emps.pages}页，总共${emps.total}条记录
			</div>
			<div class="col-md-6 ">
				<nav aria-label="Page navigation">
					  <ul class="pagination">
					  	
					  		<li><a href="${APP_PATH}/emps?pn=1">首页</a></li>
						  	
						  	<c:if test="${emps.hasPreviousPage}">
						  		 <li>
							      <a href="${APP_PATH}/emps?pn=${emps.pageNum-1}" aria-label="Previous">
							        <span aria-hidden="true">&laquo;</span>
							      </a>
							    </li>
					  		</c:if>
					  		
						    <c:forEach items="${emps.navigatepageNums}" var="page_Num">
						      <c:if test="${page_Num==emps.pageNum}">
						      	  <li class="active"><a href="${APP_PATH}/emps?pn=${page_Num}">${page_Num}</a></li>
						      </c:if>
						      <c:if test="${page_Num!=emps.pageNum}">
						      	  <li><a href="${APP_PATH}/emps?pn=${page_Num}">${page_Num}</a></li>
						      </c:if>
						    </c:forEach>
						
							<c:if test="${emps.hasNextPage}">
						  		 <li>
							      <a href="${APP_PATH}/emps?pn=${emps.pageNum+1}" aria-label="Next">
							      <span aria-hidden="true">&raquo;</span>
							      </a>
							    </li>
					  		</c:if>
						
						    <li><a href="${APP_PATH}/emps?pn=${emps.pages}">末页</a></li>
					  </ul>
				</nav>
			</div>
		</div>
	</div>


</body>
</html>