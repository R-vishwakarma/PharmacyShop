<%@page import="com.Dao.UserDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DB_Connect"%>
<%@page import="com.Dao.ProductDAOimpl"%>
<%@page import="com.entity.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage User</title>
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
					<th class="px-4 py-2 bg-gray-200 border border-gray-400">id</th>
					<th class="px-4 py-2 bg-gray-200 border border-gray-400">Name</th>
					<th class="px-4 py-2 bg-gray-200 border border-gray-400">Email</th>
					<th class="px-4 py-2 bg-gray-200 border border-gray-400">Phone</th>
					<th class="px-4 py-2 bg-gray-200 border border-gray-400">Password</th>
					<th class="px-4 py-2 bg-gray-200 border border-gray-400">Action</th>
				</tr>
			</thead>
			<tbody>
				<%
				UserDAOImpl dao = new UserDAOImpl(DB_Connect.getConn());
				List<User> list = dao.getAllUser();

				for (User u : list) {
				%>
				<tr>
					<td class="px-4 py-2 border border-gray-400"><%=u.getId()%></td>
					<td class="px-4 py-2 border border-gray-400"><%=u.getName()%></td>
					<td class="px-4 py-2 border border-gray-400"><%=u.getEmail()%></td>
					<td class="px-4 py-2 border border-gray-400"><%=u.getPhone()%></td>
					<td class="px-4 py-2 border border-gray-400"><%=u.getPassword()%></td>
					<td> <a
					href="../../deleteuser?id=<%=u.getId()%>"
					class="btn btn-sm btn-danger"><i class="fa-solid fa-trash"></i>
						Delete</a></td>
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