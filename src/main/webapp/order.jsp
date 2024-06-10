<%@page import="com.entity.productorder"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DB_Connect"%>
<%@page import="com.Dao.ProductOrderDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My orders</title>
</head>
<body>
	<%@include file="All_Component/allcss.jsp"%>
	<%@include file="All_Component/navbar.jsp"%>






	<c:if test="${empty userobj}">

		<c:redirect url="login.jsp"></c:redirect>

	</c:if>


	<c:if test="${not empty succMsg }">
		<h5 class="text-center text-success">${succMsg}</h5>
		<c:remove var="succMsg" scope="session" />
	</c:if>

	<c:if test="${not empty failedMsg }">
		<h5 class="text-center text-danger">${failedMsg}</h5>
		<c:remove var="failedMsg" scope="session" />
	</c:if>






	<div class="relative overflow-x-auto shadow-md ">
		<table
			class="w-full text-sm text-left rtl:text-right text-black-500 dark:text-gray-400">
			<thead
				class="text-xs text-white uppercase bg-green-300 dark:bg-gray-700 dark:text-gray-400">
				<tr>


					<th scope="col" class="px-6 py-3">order ID</th>
					<th scope="col" class="px-6 py-3">Email</th>
					<th scope="col" class="px-6 py-3">address</th>
					<th scope="col" class="px-6 py-3">Phone</th>
					<th scope="col" class="px-6 py-3">Product</th>
					<th scope="col" class="px-6 py-3">Price</th>
					<th scope="col" class="px-6 py-3">Payment Mode</th>
					<th scope="col" class="px-6 py-3">Remove</th>
				</tr>
			</thead>


			<tbody>

				<%
				User u = (User) session.getAttribute("userobj");
				ProductOrderDAOImpl dao = new ProductOrderDAOImpl(DB_Connect.getConn());
				List<productorder> blist = dao.getProduct(u.getEmail());
				for (productorder b : blist) {
				%>



				<tr
					class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600">

					<td class="px-6 py-4"><%=b.getOrderId()%></td>
					<td class="px-6 py-4"><%=b.getEmail()%></td>
					<td class="px-6 py-4"><%=b.getFulladd()%></td>
					<td class="px-6 py-4"><%=b.getPhone()%></td>
					<td class="px-6 py-4"><%=b.getProductname()%></td>
					<td class="px-6 py-4"><%=b.getPrice()%></td>
					<td class="px-6 py-4"><%=b.getPaymentType()%></td>



					<td><a href="cancel?order_id=<%=b.getOrderId()%>"
						class="px-6 py-4 text-red-500"> Cancel Order</a></td>
						
							<td><input name="order_id" type="hidden"
					value="<%=b.getOrderId()%> "></td>
				</tr>
			
				<%
				}
				%>


			</tbody>
		</table>
	</div>







	
</body>
</html>