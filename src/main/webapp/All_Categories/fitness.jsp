<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.product_dtls"%>
<%@page import="com.Dao.ProductDAOimpl"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DB.DB_Connect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Care</title>
<%@include file="../All_Component/allcss.jsp"%>
</head>
<body>
	<%
	User u = (User) session.getAttribute("userobj");
	%>

	<%@include file="../All_Component/navbar.jsp"%>
	<div class="container mx-auto mt-10">
		<div class="bg-gray-200 p-4 rounded-lg">
			<div class="grid grid-cols-5 gap-4">


				<%
				ProductDAOimpl dao = new ProductDAOimpl(DB_Connect.getConn());
				List<product_dtls> list = dao.getAllfitnesscareprodcts();
				for (product_dtls b : list) {
				%>
				<div
					class="max-w-sm mx-auto bg-white rounded-lg overflow-hidden shadow-lg relative"
					style="height: fit-content;">
					<img class="w-full" alt="" src="All_Component/Images/logo0.png">
					<div class="mt-2 ml-3">
						<div class="font-bold text-xl mb-2"><%=b.getProduct_name()%></div>
						<p class="text-black-700 text-base">
							brand:
							<%=b.getBrand_name()%></p>
						<p class="text-black-700 text-base">
							Category:
							<%=b.getCategory()%></p>

					<div class="px-6 pt-4 pb-2">
						<a href="../View_product.jsp?id=<%=b.getProduct_id()%>">
							<button type="button"
								class="text-white bg-blue-300 hover:bg-blue-800 focus:outline-none focus:ring-4 focus:ring-purple-300 font-medium rounded-full text-sm px-3 py-2 text-center mb-0 dark:bg-purple-600 dark:hover:bg-purple-700 dark:focus:ring-purple-900">View</button>
						</a>
					</div>


					<%
					if (u == null) {
					%>
					<div class="px-6 pt-4 pb-2">
						<a href="../login.jsp"
							class="btn bg-green-400 text-white text-center mb-0 w-full py-2 rounded-full">₹<%=b.getPrice()%></a>
					</div>
					<%
					} else {
					%>



					<div class="px-6 pt-4 pb-2">
						<a href="../cart?pid=<%=b.getProduct_id()%>&&uid=<%=u.getId()%>"
							class="btn bg-green-400 text-white text-center py-1 w-full rounded">₹<%=b.getPrice()%></a>
					</div>

					<%
					}
					%>




				</div>
				<%
				}
				%>
					
				</div>
			



			</div>
		</div>
	


</body>
</html>