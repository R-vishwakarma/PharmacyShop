<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
                List<product_dtls> list = dao.getAllhaircareprodcts();
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
                        <div class="px-40 py-0 ">
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
                            <a href="cart?pid=<%=b.getProduct_id()%>&&uid=<%=u.getId()%>" class="btn">₹<%=b.getPrice()%></a>
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
