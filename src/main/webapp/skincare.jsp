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
<style>
.container {
    width: 1000px; /* Set a fixed width for the container */
    margin: 0 auto; /* Center the container */
}

.image-container {
    width: 200px; /* Set the fixed width for the image container */
    height: 150px; /* Set the fixed height for the image container */
    overflow: hidden; /* Hide any overflow */
    padding-top: 10px; /* Add padding to the top of the container */
}

.image-container img {
    max-width: 100%; /* Limit image width to container width */
    max-height: 100%; /* Limit image height to container height */
    display: block; /* Ensure image respects container dimensions */
    margin: auto; /* Center the image horizontally */
    margin-top: -10px; /* Adjust image positioning */
}

.product-card {
    width: 100%; /* Ensure all product cards have the same width */
    border: 1px solid #ccc;
    padding: 10px;
    margin: auto;
    height: 400px; /* Set a fixed height for the product card container */
}

.product-name {
    margin-top: 10px; /* Add margin to separate product name from other content */
}

/* No changes to button styles */
</style>

<%@include file="All_Component/allcss.jsp"%>
</head>
<body>

    <%@include file="All_Component/navbar.jsp"%>
    <div class="container mx-auto mt-10">
        <div class="bg-gray-200 p-4 rounded-lg">
            <div class="grid grid-cols-5 gap-4">
                <%
                User u = (User) session.getAttribute("userobj");
                %>


                <%
                ProductDAOimpl dao = new ProductDAOimpl(DB_Connect.getConn());
                List<product_dtls> list = dao.getAllskincareprodcts();
                for (product_dtls b : list) {
                %>
                <div class="product-card">
                    <div class="max-w-sm mx-auto bg-white rounded-lg overflow-hidden shadow-lg relative">
                        <div class="image-container"> <!-- Fixed-size container for the image -->
                            <img alt=""
                                src="All_Component/Images/<%=b.getPhoto()%>">
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


                        <div class="px-20 ">
                            <a href="View_product.jsp?id=<%=b.getProduct_id()%>">
                                <button type="button"
                                    class="text-white bg-blue-300 hover:bg-blue-800 focus:outline-none focus:ring-4 focus:ring-purple-300 font-medium rounded-full text-sm px-3 py-2 text-center mb-0 dark:bg-purple-600 dark:hover:bg-purple-700 dark:focus:ring-purple-900">View</button>
                            </a>
                        </div>


                        <%
                        if (u == null) {
                        %>
                        <div class="btn bg-green-400 text-white text-center mb-0 w-full py-2 ">₹<%=b.getPrice()%></div>
                        <%
                        } else {
                        %>



                        <div class="px-6 pb-1 pt-2">
                            <a href="cart?pid=<%=b.getProduct_id()%>&&uid=<%=u.getId()%>"
                                class="btn">₹<%=b.getPrice()%></a>
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


</body>
</html>
