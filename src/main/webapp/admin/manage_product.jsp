<%@page import="com.entity.product_dtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DB_Connect"%>
<%@page import="com.Dao.ProductDAOimpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Product</title>
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
		<table
			class="table-auto w-full border-collapse border border-gray-400">
			<thead>
				<tr>
					<th class="px-4 py-2 bg-gray-200 border border-gray-400">ID</th>
					<th class="px-4 py-2 bg-gray-200 border border-gray-400">Image</th>
					<th class="px-4 py-2 bg-gray-200 border border-gray-400">Name</th>
					<th class="px-4 py-2 bg-gray-200 border border-gray-400">Category</th>
					<th class="px-4 py-2 bg-gray-200 border border-gray-400">Brand</th>
					<th class="px-4 py-2 bg-gray-200 border border-gray-400">Price</th>
					<th class="px-4 py-2 bg-gray-200 border border-gray-400">Action</th>
				</tr>
			</thead>
			<tbody>

				<%
				ProductDAOimpl dao = new ProductDAOimpl(DB_Connect.getConn());
				List<product_dtls> list = dao.getAllProducts();
				for (product_dtls b : list) {
				%>


				<tr>
					<td class="px-4 py-2 border border-gray-400"><%=b.getProduct_id()%></td>
					<td class="px-4 py-2 border border-gray-400"><img
						src="../../All_Component/Images/<%=b.getPhoto()%>"
						style="width: 50px; height: 50px;"></td>
					<td class="px-4 py-2 border border-gray-400"><%=b.getProduct_name()%></td>
					<td class="px-4 py-2 border border-gray-400"><%=b.getCategory()%></td>
					<td class="px-4 py-2 border border-gray-400"><%=b.getBrand_name()%></td>
					<td class="px-4 py-2 border border-gray-400"><%=b.getPrice()%></td>
					<td class="px-4 py-2 border border-gray-400"><a
						href="edit_product.jsp?id=<%=b.getProduct_id()%>"
						class=" btn bg-blue-700 text-white py-1 px-2">Edit</a> <a
						href="${pageContext.request.contextPath}/delete?id=<%=b.getProduct_id()%>"
						class=" btn bg-red-700 text-white py-1 px-2">Delete</a></td>

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