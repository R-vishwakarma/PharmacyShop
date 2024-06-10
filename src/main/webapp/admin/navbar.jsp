
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Navbar</title>
<style>
/* Custom button styles */
.custom-btn {
    padding: 10px 20px;
    border: none;
    cursor: pointer;
    border-radius: 5px; /* Adjust border-radius for different button shapes */
    font-size: 16px;
    transition: background-color 0.3s ease;
    text-decoration: none;
}

.custom-btn-secondary {
    background-color: #3498db; /* Blue color */
    color: #fff; /* Button text color */
}

.custom-btn-primary {
    background-color: #e74c3c; /* Red color */
}

.custom-btn:hover {
    opacity: 0.8;
}

.text-gray-50 {
	color: black; /* Change text color to black */
}
</style>


</head>

<body>
	<header>
		<nav class="bg-green-300  ">
			<div class="container mx-auto py-2 flex justify-between items-center">
				<div class="flex flex-col items-center">
					
					<div>
						<span class="ml-2 text-ml font-bold font-heading"
							style="background-image: linear-gradient(to right, blue, black); -webkit-background-clip: text; color: transparent;">Medworld</span>
					</div>


				</div>

				<div>
					<a href="home.jsp"> <span
						class="text-gray-50 pl-5 pr-5 text-bold">HOME</span></a> <a
						href="add_product.jsp"> <span
						class="text-gray-50 pl-5 pr-5 text-bold">ADD PRODUCT</span></a> <a
						href="manage_order.jsp"> <span
						class="text-gray-50 pl-5 pr-5 text-bold">ORDERS</span></a> <a
						href="manage_product.jsp"> <span
						class="text-gray-50 pl-5 pr-5 text-bold">PRODUCTS</span></a> <a
						href="manage_user.jsp"> <span
						class="text-gray-50 pl-5 pr-5 text-bold">USERS</span></a>





				</div>



				<div class="col-span-2">
					<c:if test="${not empty userobj}">
						<a href="login.jsp"
							class="btn text-white ml-64 bg-gradient-to-r from-blue-500 via-blue-600 to-blue-700 text-white"><i
							class="fa-solid fa-user"></i> ${userobj.name}</a>
						<a href="../logout" data-toggle="modal"
							data-target="#exampleModal" class="btn btn-dark"><i
							class="fa-solid fa-right-from-bracket"></i> Logout</a>
					</c:if>

					<c:if test="${empty userobj}">
						<a href="../login.jsp" class="btn btn-success"><i
							class="fa-solid fa-user-plus"></i> Login</a>
						<a href="../register.jsp" class="btn btn-secondary"><i
							class="fa-regular fa-id-card"></i> Register</a>
					</c:if>
				</div>

				<!-- Start Log Out Model -->

				<!-- Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel"></h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<div class="text-center">
									<h5>Do you want to logout..?</h5>
									<br> <br>
									<button type="button" class="custom-btn custom-btn-secondary"
										data-dismiss="modal">Close</button>
									<a href="../../logout" type="button"
										class="custom-btn custom-btn-primary text-white">Logout</a>
								</div>
							</div>

							<div class="modal-footer"></div>
						</div>
					</div>
				</div>

				<!-- End Log Out Model -->
		</nav>

	</header>
</body>

</html>
