<%@page import="com.entity.product_dtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DB_Connect"%>
<%@page import="com.Dao.ProductDAOimpl"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search page</title>
<Style>
.image-container {
	width: 200px; /* Set the width to 100% of the container */
	height: 150px;
	/* Let the browser automatically calculate the height to maintain aspect ratio */
}
</Style>

</head>
<body>
<%@include file="All_Component/allcss.jsp"%>
<%@include file="All_Component/navbar.jsp"%>
	<div class="container mx-auto mt-10">
		<div class="bg-gray-200 p-4 rounded-lg">
			<div class="grid grid-cols-5 gap-4">
				<%
				User u = (User) session.getAttribute("userobj");
				%>


				<%
				String ch=request.getParameter("ch");
				ProductDAOimpl dao = new ProductDAOimpl(DB_Connect.getConn());
				List<product_dtls> list = dao.getProductBySearch(ch);
				for (product_dtls b : list) {
				%>
				<div
					class="max-w-sm mx-auto bg-white rounded-lg overflow-hidden shadow-lg relative"
					style="height: fit-content;">
					<img class="image-container" alt=""
						src="All_Component/Images/<%=b.getPhoto()%>">

					<div class="mt-2 ml-3">
						<div class="font-bold text-xl mb-2"><%=b.getProduct_name()%></div>
						<p class="text-black-700 text-base">
							brand:
							<%=b.getBrand_name()%></p>
						<p class="text-black-700 text-base">
							Category:
							<%=b.getCategory()%></p>

					</div>


					<div class="px-20 ">
						<a href="View_product.jsp?id=<%=b.getProduct_id()%>">
							<button type="button"
								class="text-white bg-blue-300 hover:bg-blue-800 focus:outline-none focus:ring-4 focus:ring-purple-300 font-medium rounded-full text-sm px-3 py-2 text-center mb-0 dark:bg-purple-600 dark:hover:bg-purple-700 dark:focus:ring-purple-900">View</button>
						</a>
					</div>


					<%
					if (u == null) {
					%>
					<div class="px-6 pt-4 pb-2">
						<a href="login.jsp"
							class="btn bg-green-400 text-white text-center mb-0 w-full py-2 rounded-full">₹<%=b.getPrice()%></a>
					</div>
					<%
					} else {
					%>



					<div class="px-6 pb-1 pt-2">
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