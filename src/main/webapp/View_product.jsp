<%@page import="com.entity.product_dtls"%>
<%@page import="com.DB.DB_Connect"%>
<%@page import="com.Dao.ProductDAOimpl"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View page</title>

<%@include file="All_Component/allcss.jsp"%>
</head>
<body>

<c:if test="${empty userobj }">
		<c:redirect url="login.jsp">

		</c:redirect>
	</c:if>

	<%@include file="All_Component/navbar.jsp"%>
	<%
	User u = (User) session.getAttribute("userobj");
	%>

	<%
	int id = Integer.parseInt(request.getParameter("id"));

	ProductDAOimpl dao = new ProductDAOimpl(DB_Connect.getConn());
	product_dtls b = dao.getProductId(id);
	%>


	<section class="text-gray-700 body-font overflow-hidden bg-white">
		<div class="container px-5 py-24 mx-auto">
			<div class="lg:w-3/5 mx-auto flex flex-wrap">
				<img src="All_Component/Images/<%=b.getPhoto()%>"
					alt="server is not responding..."
					class="lg:w-1/2 w-full object-cover object-center rounded border border-gray-200"
					src="">
				<div class="lg:w-1/2 w-full lg:pl-10 lg:py-6 mt-6 lg:mt-0">
					<h2 class="text-sm title-font text-gray-500 tracking-widest">
						NAME
						<%=b.getProduct_name()%></h2>
					<h1 class="text-gray-900 text-3xl title-font font-medium mb-1"></h1>
					


					<div class="flex mb-4">
						<span class="flex items-center"> 
						</span> <span class="flex ml-3 pl-3 py-2 border-l-2 border-gray-200">
							<a class="text-gray-500"> <svg fill="currentColor"
									stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
									class="w-5 h-5" viewBox="0 0 24 24"> 
                <path
										d="M18 2h-3a5 5 0 00-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 011-1h3z"></path> 
              </svg>
						</a> <a class="ml-2 text-gray-500"> <svg fill="currentColor"
									stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
									class="w-5 h-5" viewBox="0 0 24 24"> 
                <path
										d="M23 3a10.9 10.9 0 01-3.14 1.53 4.48 4.48 0 00-7.86 3v1A10.66 10.66 0 013 4s-4 9 5 13a11.64 11.64 0 01-7 2c9 5 20 0 20-11.5a4.5 4.5 0 00-.08-.83A7.72 7.72 0 0023 3z"></path> 
              </svg>
						</a> <a class="ml-2 text-gray-500"> <svg fill="currentColor"
									stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
									class="w-5 h-5" viewBox="0 0 24 24"> 
                <path
										d="M21 11.5a8.38 8.38 0 01-.9 3.8 8.5 8.5 0 01-7.6 4.7 8.38 8.38 0 01-3.8-.9L3 21l1.9-5.7a8.38 8.38 0 01-.9-3.8 8.5 8.5 0 014.7-7.6 8.38 8.38 0 013.8-.9h.5a8.48 8.48 0 018 8v.5z"></path> 
              </svg>
						</a>
						</span>
					</div>
					<div
						class="flex mt-6 items-center pb-5 border-b-2 border-gray-200 mb-5">

						<div class="flex">
							<span class="mr-3">Category <%=b.getCategory()%></span>
							<h1 class="text-gray- text-1xl title-font font-small mb-1"></h1>
						</div>

						<div class="flex">
						<span class="mr-3">Brand <%=b.getBrand_name()%></span>
						<h1 class="text-gray- text-1xl title-font font-small mb-1"></h1>
					</div>
					</div>
					<div class="flex">
						<span class="title-font font-medium text-2xl text-gray-900">₹<%=b.getPrice()%>
						</span> <br> <a
							href="cart?pid=<%=b.getProduct_id()%>&&uid=<%=u.getId()%>" class="pl-5">

							<button
								class="flex ml-auto text-white bg-green-500 border-0 py-2 px-6 focus:outline-none hover:bg-blue-600 rounded">Shop
								Now</button>

						</a>


					</div>
				</div>
			</div>
		</div>
	</section>

	<%@include file="All_Component/footer.jsp"%>
</body>
</html>