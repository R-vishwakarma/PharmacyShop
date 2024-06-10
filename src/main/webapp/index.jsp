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

<style>
.container {
    width: 1000px;
    margin: 0 auto;
}
.image-container {
    width: 200px;
    height: 150px;
    overflow: hidden;
    padding-top: 10px;
}
.image-container img {
    max-width: 100%;
    max-height: 100%;
    display: block;
    margin: auto;
    margin-top: -10px;
}
.product-card {
    width: 100%;
    border: 1px solid #ccc;
    padding: 10px;
    margin: auto;
    height: 400px;
}
.product-name {
    margin-top: 10px;
    height: 70px;
}
</style>
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

	<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="5"></li>
    </ol>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img class="d-block w-100" src="All_Component/Images/s4.jpg" height="500px" alt="First slide">
        </div>
        <div class="carousel-item">
            <img class="d-block w-100" src="All_Component/Images/s6.jpg" height="500px" alt="Second slide">
        </div>
        <div class="carousel-item">
            <img class="d-block w-100" src="All_Component/Images/s5.jpg" height="500px" alt="Third slide">
        </div>
        <div class="carousel-item">
            <img class="d-block w-100" src="All_Component/Images/s2.jpg" height="500px" alt="Fourth slide">
        </div>
        <div class="carousel-item">
            <img class="d-block w-100" src="All_Component/Images/s1.jpg" height="500px" alt="Fifth slide">
        </div>
        <div class="carousel-item">
            <img class="d-block w-100" src="All_Component/Images/s3.jpg" height="500px" alt="Sixth slide">
        </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>


	<div class="bg-white-200 py-4 shadow-lg mt-2">
		<h5 class="text-center text-bold font-bold mb-4 text-black">SHOP
			BY CATEGORY</h5>
		<div class="container mx-auto">
			<!-- Three Cards in a Row -->
			<div class="flex flex-wrap justify-center">
				<a href="haircare.jsp"
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
				</a> <a href="bodycare.jsp"
					class="w-1/3 sm:w-1/2 md:w-1/4 lg:w-1/5 px-2 mb-4">
					<div class="relative bg-white rounded-lg overflow-hidden shadow-md"
						style="max-width: 200px;">
						<img src="All_Component/Images/body.png" class="w-full h-auto"
							alt="Card Image">
						<!-- Text at the bottom -->
						<div
							class="absolute bottom-0 left-0 right-0 bg-gray-900 bg-opacity-50 py-2 px-4 text-center">
							<p class="text-white text-sm mb-0">Babycare</p>
						</div>
					</div>
				</a> <a href="skincare.jsp"
					class="w-1/3 sm:w-1/2 md:w-1/4 lg:w-1/5 px-2 mb-4">
					<div class="relative bg-white rounded-lg overflow-hidden shadow-md"
						style="max-width: 200px;">
						<img src="All_Component/Images/skincare.jpeg"
							class="w-full h-auto" alt="Card Image">
						<!-- Text at the bottom -->
						<div
							class="absolute bottom-0 left-0 right-0 bg-gray-900 bg-opacity-50 py-2 px-4 text-center">
							<p class="text-white text-sm mb-0">Skincare</p>
						</div>
					</div>
				</a> <a href="fitness.jsp"
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
				</a> <a href="personalcare.jsp"
					class="w-1/3 sm:w-1/2 md:w-1/4 lg:w-1/5 px-2 mb-4">
					<div class="relative bg-white rounded-lg overflow-hidden shadow-md"
						style="max-width: 200px;">
						<img src="All_Component/Images/personalcare.jpeg"
							class="w-full h-auto" alt="Card Image">
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
				List<product_dtls> list = dao.getAllProducts();
				for (product_dtls b : list) {
				%>
				<div class="product-card">
                    <div class="max-w-sm mx-auto bg-white rounded-lg overflow-hidden shadow-lg relative">
                        <div class="image-container">
                            <img alt="" src="All_Component/Images/<%=b.getPhoto()%>">
                        </div>
                        <div class="mt-2 ml-3 product-name">
                            <div class="font-bold text-xl mb-2"><%=b.getProduct_name()%></div>
                            <p class="text-black-700 text-base">
                                brand:
                                <%=b.getBrand_name()%></p>
                            <p class="text-black-700 text-base">
                                Category:
                                <%=b.getCategory()%></p>
                        </div>
                        <div class="px-40 mx-4 my-0 ">
                            <a href="View_product.jsp?id=<%=b.getProduct_id()%>">
                                <button type="button" class="text-white    bg-blue-300 hover:bg-blue-800 focus:outline-none focus:ring-4 focus:ring-purple-300 font-medium rounded-full text-sm px-2 py-2 text-center  dark:bg-purple-600 dark:hover:bg-purple-700 dark:focus:ring-purple-900">View</button>
                            </a>
                        </div>
                        <%
                        if (u == null) {
                        %>
                        <div class="btn bg-green-300 text-black text-center mb-0 w-full mt-5 py-2 pt-2 ">₹<%=b.getPrice()%></div>
                        <%
                        } else {
                        %>
                        <div class="px-6 pb-1 pt-2">
                            <a href="cart?pid=<%=b.getProduct_id()%>&&uid=<%=u.getId()%>" class="btn bg-green-300 text-black text-center mb-0 w-full mt-5 py-2 pt-2 ">₹<%=b.getPrice()%></a>
                        </div>
                        <%
                        }
                        %>
                    </div>
                </div>
				<%
				}
				%>

			</div>
		</div>
	</div>



	<div class="container mx-auto mt-10">
		<h5 class="text-left text-bold font-bold mb-4 text-black">NEW
			LAUNCHES</h5>

		<div class="bg-gray-200 p-4 rounded-lg">
			<div class="grid grid-cols-5 gap-4">

				<%
				ProductDAOimpl dao2 = new ProductDAOimpl(DB_Connect.getConn());
				List<product_dtls> list2 = dao2.getNewLaunch();
				for (product_dtls b : list2) {
				%>
				<div class="product-card">
                    <div class="max-w-sm mx-auto bg-white rounded-lg overflow-hidden shadow-lg relative">
                        <div class="image-container">
                            <img alt="" src="All_Component/Images/<%=b.getPhoto()%>">
                        </div>
                        <div class="mt-2 ml-3 product-name">
                            <div class="font-bold text-xl mb-2"><%=b.getProduct_name()%></div>
                            <p class="text-black-700 text-base">
                                brand:
                                <%=b.getBrand_name()%></p>
                            <p class="text-black-700 text-base">
                                Category:
                                <%=b.getCategory()%></p>
                        </div>
                        <div class="px-40 mx-4 my-0 ">
                            <a href="View_product.jsp?id=<%=b.getProduct_id()%>">
                                <button type="button" class="text-white    bg-blue-300 hover:bg-blue-800 focus:outline-none focus:ring-4 focus:ring-purple-300 font-medium rounded-full text-sm px-2 py-2 text-center  dark:bg-purple-600 dark:hover:bg-purple-700 dark:focus:ring-purple-900">View</button>
                            </a>
                        </div>
                        <%
                        if (u == null) {
                        %>
                        <div class="btn bg-green-300 text-black text-center mb-0 w-full mt-5 py-2 pt-2 ">₹<%=b.getPrice()%></div>
                        <%
                        } else {
                        %>
                        <div class="px-6 pb-1 pt-2">
                            <a href="cart?pid=<%=b.getProduct_id()%>&&uid=<%=u.getId()%>" class="btn bg-green-300 text-black text-center mb-0 w-full mt-5 py-2 pt-2 ">₹<%=b.getPrice()%></a>
                        </div>
                        <%
                        }
                        %>
                    </div>
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
