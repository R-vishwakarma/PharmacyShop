<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.product_dtls"%>
<%@page import="com.Dao.ProductDAOimpl"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DB.DB_Connect"%>
<%@page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Medworld index Page</title>
<%@include file="All_Component/allcss.jsp"%>




</head>
<body class="bg-gray-100">

	<%
	User u = (User) session.getAttribute("userobj");
	%>



	<%@include file="All_Component/navbar.jsp"%>

	<div id="carouselExampleIndicators" class="carousel slide"
		data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img class="d-block w-100" src="All_Component/Images/b3.jpg"
					height="500px" alt="First slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="All_Component/Images/b2.jpg"
					height="500px" alt="Second slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="All_Component/Images/b1.jpg"
					height="500px" alt="Third slide">
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>

	<div class="bg-white-200 py-4 shadow-lg mt-2">
		<h5 class="text-center text-bold font-bold mb-4 text-black">CATEGORY</h5>
		<div class="container mx-auto">
			<!-- Three Cards in a Row -->
			<div class="flex flex-wrap justify-center">
				<a href="All_Categories/haircare.jsp"
					class="w-1/3 sm:w-1/2 md:w-1/4 lg:w-1/5 px-2 mb-4">
					<div class="relative bg-white rounded-lg overflow-hidden shadow-md"
						style="max-width: 200px;">
						<img src="All_Component/Images/haircare.png" class="w-full h-auto"
							alt="Card Image">
						<!-- Text at the bottom -->
						<div
							class="absolute bottom-0 left-0 right-0 bg-gray-900 bg-opacity-50 py-2 px-4 text-center">
							<p class="text-white text-sm mb-0">Haircare</p>
						</div>
					</div>
				</a> <a href="All_Categories/bodycare.jsp"
					class="w-1/3 sm:w-1/2 md:w-1/4 lg:w-1/5 px-2 mb-4">
					<div class="relative bg-white rounded-lg overflow-hidden shadow-md"
						style="max-width: 200px;">
						<img src="All_Component/Images/body.png" class="w-full h-auto"
							alt="Card Image">
						<!-- Text at the bottom -->
						<div
							class="absolute bottom-0 left-0 right-0 bg-gray-900 bg-opacity-50 py-2 px-4 text-center">
							<p class="text-white text-sm mb-0">Bodycare</p>
						</div>
					</div>
				</a> <a href="All_Categories/skincare.jsp"
					class="w-1/3 sm:w-1/2 md:w-1/4 lg:w-1/5 px-2 mb-4">
					<div class="relative bg-white rounded-lg overflow-hidden shadow-md"
						style="max-width: 200px;">
						<img src="All_Component/Images/skincare.jpeg" class="w-full h-auto"
							alt="Card Image">
						<!-- Text at the bottom -->
						<div
							class="absolute bottom-0 left-0 right-0 bg-gray-900 bg-opacity-50 py-2 px-4 text-center">
							<p class="text-white text-sm mb-0">Skincare</p>
						</div>
					</div>
				</a> <a href="All_Categories/fitness.jsp"
					class="w-1/3 sm:w-1/2 md:w-1/4 lg:w-1/5 px-2 mb-4">
					<div class="relative bg-white rounded-lg overflow-hidden shadow-md"
						style="max-width: 200px;">
						<img src="All_Component/Images/fitness.png" class="w-full h-auto"
							alt="Card Image">
						<!-- Text at the bottom -->
						<div
							class="absolute bottom-0 left-0 right-0 bg-gray-900 bg-opacity-50 py-2 px-4 text-center">
							<p class="text-white text-sm mb-0">fitness</p>
						</div>
					</div>
				</a> <a href="All_Categories/personalcare.jsp"
					class="w-1/3 sm:w-1/2 md:w-1/4 lg:w-1/5 px-2 mb-4">
					<div class="relative bg-white rounded-lg overflow-hidden shadow-md"
						style="max-width: 200px;">
						<img src="All_Component/Images/personalcare.jpeg" class="w-full h-auto"
							alt="Card Image">
						<!-- Text at the bottom -->
						<div
							class="absolute bottom-0 left-0 right-0 bg-gray-900 bg-opacity-50 py-2 px-4 text-center">
							<p class="text-white text-sm mb-0">Personalcare</p>
						</div>
					</div>
				</a>



			</div>
		</div>
	</div>







	<div class="container mx-auto mt-10">
		<div class="bg-gray-200 p-4 rounded-lg">
			<div class="grid grid-cols-5 gap-4">


				<%
				ProductDAOimpl dao = new ProductDAOimpl(DB_Connect.getConn());
				List<product_dtls> list = dao.getNewLaunch();
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

					</div>

					<div class="px-6 pt-4 pb-2">
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



					<div class="px-6 pt-4 pb-2">
						<a href="cart?pid=<%=b.getProduct_id()%>&&uid=<%=u.getId()%>"
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



	<%@include file="All_Component/footer.jsp"%>
</body>
</html>
