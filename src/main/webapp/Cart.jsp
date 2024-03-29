<%@page import="com.entity.product_cart"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DB_Connect"%>
<%@page import="com.Dao.CartDAOImpl"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>


<script>
	document.addEventListener("DOMContentLoaded", function() {
		// Get references to the select and div elements
		var selectPayment = document.querySelector("select[name='payment']");
		var form = document.querySelector("form[action='order']");
		var noSelectDiv = document.getElementById("noSelectMessage");
		var cashOnDeliveryDiv = document
				.getElementById("cashOnDeliveryMessage");
		var cardPaymentDiv = document.getElementById("cardPaymentForm");

		// Function to hide all divs
		function hideAllDivs() {
			noSelectDiv.style.display = "none";
			cashOnDeliveryDiv.style.display = "none";
			cardPaymentDiv.style.display = "none";
		}

		// Initial state: hide all divs
		hideAllDivs();

		// Event listener for the select element
		selectPayment.addEventListener("change", function() {
			var selectedOption = selectPayment.value;

			// Hide all divs first
			hideAllDivs();

			// Show the div corresponding to the selected option
			if (selectedOption === "noselect") {
				noSelectDiv.style.display = "block";
				
				form.action = "order";
				var inputfields=document.querySelectorAll(".cd");
				inputfields.forEach(function(field){field.required=false;});
			} else if (selectedOption === "COD") {
				var inputfields=document.querySelectorAll(".cd");
				inputfields.forEach(function(field){field.required=false;});
				cashOnDeliveryDiv.style.display = "block";
				form.action = "order";
				
			} else if (selectedOption === "CARD PAYMENT") {
				var inputfields=document.querySelectorAll(".cd");
				inputfields.forEach(function(field){field.required=true;});
				cardPaymentDiv.style.display = "block";
				form.action = "order";
			}
		});
	});
</script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MedWorld</title>
<%@include file="All_Component/allcss.jsp"%>
</head>
<body>
	<%@include file="All_Component/navbar.jsp"%>

	<div class="container mx-auto py-8">
		<div class="grid grid-cols-1 sm:grid-cols-2 gap-8">
			<div>
				<div class="bg-white rounded-lg shadow-md p-6">
					<h2 class="text-xl font-semibold mb-4">Order Summary</h2>
					<div class="overflow-x-auto">
						<table class="w-full">
							<thead>
								<tr>
									<th class="text-left">Name</th>
									<th class="text-left">Price</th>
									<th class="text-left">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								User u = (User) session.getAttribute("userobj");
								CartDAOImpl dao = new CartDAOImpl(DB_Connect.getConn());
								List<product_cart> cart = dao.getProductByUser(u.getId());
								Double totalPrice = 0.00;

								for (product_cart c : cart) {
									totalPrice += c.getTotalPrice();
								%>
								<tr>
									<td><%=c.getProduct_name()%></td>
									<td><%=c.getPrice()%></td>
									<td><a
										href="remove_product?pid=<%=c.getPid()%>&&uid=<%=c.getUid()%>"
										class=" btn text-red-500">Remove</a></td>
								</tr>
								<%
								}
								%>
								<tr>
									<td class="font-medium">Total Price</td>
									<td></td>
									<td class="font-semibold text-green-500"><%=totalPrice%></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div>
				<div class="bg-gray-100 rounded-lg shadow-md p-6">
					<h2 class="text-xl font-semibold mb-4">Details</h2>
					<form>
						<input type="hidden" value="${userobj.id}" name="id"> <label
							class="block mb-2 text-sm font-medium" for="name">Name</label> <input
							type="text" id="name" name="username" value="<%=u.getName()%>"
							class="input-field" /> <label
							class="block mb-2 text-sm font-medium" for="email">Email</label>
						<input type="email" id="email" name="email"
							value="<%=u.getEmail()%>" class="input-field" /> <label
							class="block mb-2 text-sm font-medium" for="phone">Phone</label>
						<input type="tel" id="phone" name="phone"
							value="<%=u.getPhone()%>" class="input-field" /> <label
							class="block mb-2 text-sm font-medium" for="landmark">Address</label>
						<input type="text" id="landmark" name="address"
							class="input-field" /> <label
							class="block mb-2 text-sm font-medium" for="landmark">Landmark</label>
						<input type="text" id="landmark" name="landmark"
							class="input-field" />

						<div class="flex mb-4">
							<div class="w-1/2 mr-2">
								<label class="block mb-2 text-sm font-medium" for="city">City</label>
								<input type="text" id="city" name="city" class="input-field" />
							</div>
							<div class="w-1/2 ml-2">
								<label class="block mb-2 text-sm font-medium" for="state">State</label>
								<input type="text" id="state" name="state" class="input-field" />
							</div>
						</div>

						<label class="block mb-2 text-sm font-medium" for="zip">Zip</label>
						<input type="text" id="zip" name="pincode" class="input-field" />
						
						<div class="form-group ">
						<label class="block mt-2 mb-2 text-sm font-medium" for="zip">Select Payment method</label>
								 <select class="form-control"
									name="payment">
									
									
									<option value="noselect" id="noselect">--Select--</option>
									
									<option value="CARD PAYMENT" 
										name="CARD PAYMENT">Card Payment</option>
										<option value="COD" >Cash On Delivery</option>
								</select>
							</div>
						

						<!-- Other input fields -->

						<div class="mt-6 border-t border-b py-2">
							<div class="flex justify-between">
								<p class="text-sm font-medium">Subtotal</p>
								<p class="font-semibold">$399.00</p>
							</div>
							<div class="flex justify-between">
								<p class="text-sm font-medium">Shipping</p>
								<p class="font-semibold">$8.00</p>
							</div>
						</div>
						<div class="flex justify-between mt-6">
							<p class="text-sm font-medium">Total</p>
							<p class="text-2xl font-semibold">
								₹<%=totalPrice%></p>
						</div>
						<button
							class="mt-8 w-full rounded-md bg-gray-900 text-white px-6 py-3 font-semibold" type="submit">Place
							Order</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<%@include file="All_Component/footer.jsp"%>
</body>
</html>