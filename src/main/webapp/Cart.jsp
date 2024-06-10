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
	
	
	
	
	
	
	
	
	<c:if test="${empty userobj}">

		<c:redirect url="login.jsp"></c:redirect>

	</c:if>

	<c:if test="${not empty succMsg }">
		<div class="alert alert-primary" role="alert">${succMsg}</div>
		<c:remove var="succMsg" scope="session" />

	</c:if>

	<c:if test="${not empty failedMsg }">
		<div class="alert alert-primary" role="alert">${failedMsg }</div>

		<c:remove var="failedMsg" scope="session" />

	</c:if>

	
	
	
	
	
	

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
				<form action="order" method="post">
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
									
								    <option value="noselect" id="noselect">--select--</option>
									<option value="CARD PAYMENT" 
										name="CARD PAYMENT" >Card Payment</option>
										<option value="COD"  >Cash On Delivery</option>
								</select>
							</div>
							
							
							
							
							<div id="noSelectMessage">
                <div class="container mt-2">
                  <div class="row">
                    <div class=" col-md-12">
                      <div class="card paint-card">
                        <div class="card-body">
                        <h5>Please Select Payment Method</h5></div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
							
							
							<div class="mt-2" id="cardPaymentForm">

        <label for="card-holder" class="mt-4 mb-2 block text-sm font-medium">Card
          Holder</label>
        <div class="relative">
          <input type="text" id="card-holder" name="card-holder"
            class="w-full rounded-md border border-gray-200 px-4 py-3 pl-11 text-sm uppercase shadow-sm outline-none focus:z-10 focus:border-blue-500 focus:ring-blue-500"
            placeholder="   full name" />
          <div
            class="pointer-events-none absolute inset-y-0 left-0 inline-flex items-center px-3">
            <svg xmlns="http://www.w3.org/2000/svg"
              class="h-4 w-4 text-gray-400" fill="none" viewBox="0 0 24 24"
              stroke="currentColor" stroke-width="2">
            <path stroke-linecap="round" stroke-linejoin="round"
                d="M15 9h3.75M15 12h3.75M15 15h3.75M4.5 19.5h15a2.25 2.25 0 002.25-2.25V6.75A2.25 2.25 0 0019.5 4.5h-15a2.25 2.25 0 00-2.25 2.25v10.5A2.25 2.25 0 004.5 19.5zm6-10.125a1.875 1.875 0 11-3.75 0 1.875 1.875 0 013.75 0zm1.294 6.336a6.721 6.721 0 01-3.17.789 6.721 6.721 0 01-3.168-.789 3.376 3.376 0 016.338 0z" />
          </svg>
          </div>
        </div>
        <label for="card-no" class="mt-4 mb-2 block text-sm font-medium">Card
          Details</label>
        <div class="flex">
          <div class="relative w-7/12 flex-shrink-0">
            <input type="text" id="card-no" name="card-no"
              class="w-full rounded-md border border-gray-200 px-2 py-3 pl-11 text-sm shadow-sm outline-none focus:z-10 focus:border-blue-500 focus:ring-blue-500"
              placeholder="xxxx-xxxx-xxxx-xxxx" pattern="[4-8]\d{3}\d{4}\d{4}\d{4}"/>
            <div
              class="pointer-events-none absolute inset-y-0 left-0 inline-flex items-center px-3">
              <svg class="h-4 w-4 text-gray-400"
                xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                fill="currentColor" viewBox="0 0 16 16">
              <path
                  d="M11 5.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-1z" />
              <path
                  d="M2 2a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H2zm13 2v5H1V4a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1zm-1 9H2a1 1 0 0 1-1-1v-1h14v1a1 1 0 0 1-1 1z" />
            </svg>
            </div>
          </div>
          <input type="text" name="credit-expiry"
            class="w-full rounded-md border border-gray-200 px-2 py-3 text-sm shadow-sm outline-none focus:z-10 focus:border-blue-500 focus:ring-blue-500"
            placeholder="MM/YY" (0[1-9]|1[0-2])/(2[2-9]|1[3-9]|[3-9]\d)/> <input type="text" name="credit-cvc"
            class="w-1/6 flex-shrink-0 rounded-md border border-gray-200 px-2 py-3 text-sm shadow-sm outline-none focus:z-10 focus:border-blue-500 focus:ring-blue-500"
            placeholder="CVC" [0-9]{2}[1-9]| [1-9]/>
        </div>


      </div>

      <div id="cashOnDeliveryMessage">
        <div class="col-md-12 mt-4">
          <label for="inputEmail4"
            class="block text-sm font-medium text-gray-700">Name</label> <input
            type="text" name="username"
            class="mt-1 focus:ring-gray-800 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md h-10 transition-all duration-300 ease-in-out hover:border-blue-500 hover:shadow-md border"
            id="inputEmail4" value="">
        </div>
        <div class="row ml-1 mt-3">
          <div class=" col-md-6">
            <label for="inputPassword4"
              class="block text-sm font-medium text-gray-700">Email</label> <input
              type="email" name="email"
              class="mt-1 focus:ring-gray-800 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md h-10 transition-all duration-300 ease-in-out hover:border-blue-500 hover:shadow-md border"
              id="inputPassword4" value="">
          </div>
<div class=" col-md-6">
            <label for="inputEmail4"
              class="block text-sm font-medium text-gray-700">Mobile No</label>
            <input type="number" name="phno"
              class="mt-1 focus:ring-gray-800 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md h-10 transition-all duration-300 ease-in-out hover:border-blue-500 hover:shadow-md border"
              id="inputEmail4" value="">
          </div>
        </div>
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







	<%@include file="All_Component/footer.jsp"%>
</body>
</html>