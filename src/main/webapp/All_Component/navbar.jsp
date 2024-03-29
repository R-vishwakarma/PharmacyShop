<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Navbar</title>
<style>
/* Add your custom CSS here */
/* Navbar styles */
nav {
	background-color: #5aa8c4; /* Green background color */
	padding: 15px 20px; /* Increased padding */
}

.navbar-container {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.logo {
	display: flex;
	align-items: center;
}

.logo img {
	height: 50px; /* Increased height */
	margin-right: 10px;
}

.logo span {
	color: #fff;
	font-size: 1.4rem; /* Increased font size */
	font-weight: bold;
}

/* Navbar links */
.navbar-links a {
	color: #fff;
	text-decoration: none;
	margin-right: 20px;
	font-size: 1.2rem; /* Increased font size */
	transition: color 0.3s ease;
}

.navbar-links a:hover {
	color: #e3fff3; /* Lighter color on hover */
}

/* Search bar */
.search-bar {
	display: flex;
	align-items: center;
}

.search-bar input[type="text"] {
	padding: 10px;
	border: none;
	border-radius: 25px; /* Round shape */
	margin-right: 10px;
}

.search-bar button {
	background-color: #fff;
	color: #36b55c; /* Green color */
	border: none;
	border-radius: 25px; /* Round shape */
	padding: 10px 15px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.search-bar button:hover {
	background-color: #e3fff3; /* Lighter background on hover */
}

/* User actions */
.user-actions a {
	color: #fff;
	text-decoration: none;
	margin-right: 10px;
	font-size: 1.2rem; /* Increased font size */
	transition: color 0.3s ease;
}

.user-actions a:hover {
	color: #e3fff3; /* Lighter color on hover */
}

.user-actions button {
	background-color: transparent;
	border: 1px solid #fff;
	color: #fff;
	padding: 10px 15px;
	border-radius: 25px; /* Round shape */
	cursor: pointer;
	transition: background-color 0.3s ease, color 0.3s ease;
}

.user-actions button:hover {
	background-color: #fff; /* White background on hover */
	color: #36b55c; /* Green color on hover */
}
</style>
</head>

<body>
	<header>
		<nav>
			<div class="navbar-container">
				<div class="logo">
					<img src="All_Component/Images/logo0.png" alt="Logo"> <span>Pharmacy</span>
				</div>
				<div class="navbar-links">
					<a href="#">Products</a> <a href="#">About Us</a> <a href="#">Contact</a>
				</div>
				<div class="search-bar">
					<input type="text" placeholder="Search">
					<button type="button">Search</button>
				</div>
				<div class="user-actions">
					<c:if test="${not empty userobj}">
						<a href="checkout.jsp">${userobj.name }</a>
						<a href="logout">Logout</a>
						<a href="setting.jsp"style="height:40px; "> <i class="fa-solid  fa-gear "></i> 
						</a>
					</c:if>
					
					<c:if test="${empty userobj}">
						<a href="login.jsp">Login</a>
						<a href="register.jsp">Register</a>
					</c:if>
				</div>
			</div>
		</nav>
	</header>
</body>

</html>
