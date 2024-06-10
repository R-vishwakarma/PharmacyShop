
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Successfully</title>
<%@include file="All_Component/allcss.jsp"%>
	<%@include file="All_Component/navbar.jsp"%>


</head>
<body>
<c:if test="${empty userobj }">
		<c:redirect url="login.jsp">

		</c:redirect>
	</c:if>
	
	
	<div class="container text-center mt-5 p-3">
	<i class="fa-regular fa-circle-check fa-5x text-success"></i>
	 <h1>Thank You</h1>
	<h2> Your Order successfully Placed </h2>
	
	<a href="index.jsp" class="btn btn-primary mt-3">Continue Shopping</a>
	</div>
	
	
<div class="p-5">
	
</body>
</html>
