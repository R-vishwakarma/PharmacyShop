<%@page import="com.entity.productorder"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DB_Connect"%>
<%@page import="com.Dao.ProductOrderDAOImpl"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Order</title>
<%@include file="allcss.jsp"%>
</head>
<body>
<%@include file="navbar.jsp"%>

 <!-- privacy -->
 <c:if test="${empty userobj }">
		<c:redirect url="../login.jsp">

		</c:redirect>
	</c:if>


<div class="overflow-x-auto">
  <table class="table table-striped">
		<thead class="bg-secondary  uppercase text-white">
			<tr>
				<th scope="col">Oredr Id</th>
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Address</th>
				<th scope="col">Phone No</th>
				<th scope="col">product Name</th>
				<th scope="col">Price</th>
				<th scope="col">Payment Type</th>
			</tr>
		</thead>
		<tbody>
		
		
				<%
				User u = (User) session.getAttribute("userobj");
				ProductOrderDAOImpl dao = new ProductOrderDAOImpl(DB_Connect.getConn());
				List<productorder> blist = dao.getAllOrder();
				for (productorder b : blist) {
				%>
		<tr>
					<th scope="row"><%=b.getOrderId()%></th>
					<td><%=b.getUserName() %></td>
					<td><%=b.getEmail() %></td>
					<td><%=b.getFulladd() %></td>
					<td><%=b.getPhone() %></td>
					<td><%=b.getProductname()%></td>
					<td><%=b.getPrice() %></td>
					<td><%=b.getPaymentType() %></td>

				</tr>

				<%
				}
				%>
		
			
			
		</tbody>
	</table>
</div>



<%@include file="footer_2.jsp"%>
</body>
</html>