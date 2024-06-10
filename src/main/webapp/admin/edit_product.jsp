<%@page import="com.entity.product_dtls"%>
<%@page import="com.Dao.ProductDAOimpl"%>
<%@page import="com.DB.DB_Connect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Product</title>
<%@include file="allcss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<!-- privacy -->
	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp">

		</c:redirect>
	</c:if>
	<c:if test="${not empty succMsg }">
		<p class="text-center text-success">${succMsg}</p>
		<c:remove var="succMsg" scope="session" />
	</c:if>

	<c:if test="${not empty failedMsg }">
		<p class="text-center text-danger">${failedMsg}</p>
		<c:remove var="failedMsg" scope="session" />
	</c:if>

	<%
	int id = Integer.parseInt(request.getParameter("id"));
	ProductDAOimpl dao = new ProductDAOimpl(DB_Connect.getConn());
	product_dtls b = dao.getProductId(id);
	%>




	<form action="../../editproduct" method="post">

		<input type="hidden" name="id" value="<%=b.getProduct_id()%>">
		<div
			class="min-w-screen min-h-screen bg-grey-700 flex items-center justify-center px-5 py-5">
			<div
				class="bg-gray-100 text-gray-500 rounded-3xl shadow-xl w-full overflow-hidden"
				style="max-width: 1000px">
				<div class="md:flex  items-center justify-center">

					<div class="w-full md:w-1/2 py-10 px-5 md:px-10">
						<div class="text-center mb-10">
							<h1 class="font-bold text-3xl text-gray-900">EDIT PRODUCT</h1>

						</div>
						<div class="items-center">
							<div class="flex -mx-3">
								<div class="w-full px-3 mb-5">
									<label for="" class="text-xs font-semibold px-1">Product
										Name </label>
									<div class="flex">
										<div
											class="w-10 z-10 pl-1 text-center pointer-events-none flex items-center justify-center">
											<i class="mdi mdi-account-outline text-gray-400 text-lg"></i>
										</div>
										<input type="text"
											class="w-full -ml-10 pl-10 pr-3 py-2 rounded-lg border-2 border-gray-200 outline-none focus:border-indigo-500"
											placeholder="product name" name="pname"
											value="<%=b.getProduct_name()%>">
									</div>
								</div>
							</div>
							<div class="flex -mx-3">
								<div class="w-full px-3 mb-5">
									<label for="" class="text-xs font-semibold px-1">Category
									</label>
									<div class="flex">
										<div
											class="w-10 z-10 pl-1 text-center pointer-events-none flex items-center justify-center">
											<i class="mdi mdi-account-outline text-gray-400 text-lg"></i>
										</div>
										<select
											class="w-full -ml-10 pl-10 pr-3 py-2 rounded-lg border-2 border-gray-200 outline-none focus:border-indigo-500"
											name="ptype" value="<%=b.getCategory()%>">
											<option value="New Launch">New Launch</option>
											<option value="Personal Care">Personal Care</option>
											<option value="Skin Care">Skin Care</option>
											<option value="Baby Care">Baby Care</option>
											<option value="hair Care">hair Care</option>
											<option value="Fitness">Fitness</option>
										</select>
									</div>
								</div>
							</div>


							<div class="flex -mx-3">
								<div class="w-full px-3 mb-5">
									<label for="" class="text-xs font-semibold px-1">Brand
									</label>
									<div class="flex">
										<div
											class="w-10 z-10 pl-1 text-center pointer-events-none flex items-center justify-center">
											<i class="mdi mdi-account-outline text-gray-400 text-lg"></i>
										</div>
										<input type="text"
											class="w-full -ml-10 pl-10 pr-3 py-2 rounded-lg border-2 border-gray-200 outline-none focus:border-indigo-500"
											placeholder="Brand" name="pbrand"
											value="<%=b.getBrand_name()%>">
									</div>
								</div>

							</div>
							<div class="flex -mx-3">
								<div class="w-full px-3 mb-5">
									<label for="" class="text-xs font-semibold px-1">Price
									</label>
									<div class="flex">
										<div
											class="w-10 z-10 pl-1 text-center pointer-events-none flex items-center justify-center">
											<i class="mdi mdi-account-outline text-gray-400 text-lg"></i>
										</div>
										<input type="number"
											class="w-full -ml-10 pl-10 pr-3 py-2 rounded-lg border-2 border-gray-200 outline-none focus:border-indigo-500"
											placeholder="Price" name="price" value="<%=b.getPrice()%>">
									</div>
								</div>


							</div>


							<div class="flex -mx-3">
								<div class="w-full px-3 mb-5">
									<button
										class="block w-full max-w-xs mx-auto bg-green-400 hover:bg-indigo-700 focus:bg-indigo-400 text-white rounded-lg px-3 py-3 font-semibold">UPDATE</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<%@include file="footer_2.jsp"%>
</body>
</html>