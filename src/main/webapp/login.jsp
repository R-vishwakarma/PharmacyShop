<!-- TW Elements is free under AGPL, with commercial license required for specific uses. See more details: https://tw-elements.com/license/ and contact us for queries at tailwind@mdbootstrap.com -->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<title>Contact Form Template</title>
<link rel="stylesheet" href="/build/tailwind.css" type="text/css"
	media="screen" title="no title" charset="utf-8" />
</head>
<body>
<%@include file="All_Component/allcss.jsp"%>
	<%@include file="All_Component/navbar.jsp"%>
	<div class="lg:flex">
		<div class="lg:w-1/2 xl:max-w-screen-sm">
			<div
				class="py-12 bg-indigo-100 lg:bg-white flex justify-center lg:justify-start lg:px-12">
				<div class="cursor-pointer flex items-center">
					<div>

						<a class="text-3xl font-bold font-heading" href="#"> <img
							src="All_Component/Images/logo.png"
							style="height: 100px; width: 100px;" class="h-8">
						</a>
					</div>
				</div>
			</div>
			<div
				class="mt-0 px-12 sm:px-24 md:px-48 lg:px-12 lg:mt-16 xl:px-24 xl:max-w-2xl">
				<h2
					class="text-center text-4xl text-black-900 font-display font-semibold lg:text-left xl:text-5xl
                    xl:text-bold">Log
					in</h2>
				<div class="mt-12">
					<form action="login" method="post">
						<c:if test="${not empty failedMsg }">

							<p class="text-center text-danger">${failedMsg}</p>
							<c:remove var="failedMsg" scope="session" />

						</c:if>

						<c:if test="${not empty succMsg }">

							<p class="text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />

						</c:if>
						<div>
							<div class="text-sm font-bold text-black-700 tracking-wide">Email
								Address</div>
							<input
								class="w-full text-lg py-2 border-b border-gray-300 focus:outline-none focus:border-indigo-500"
								type="" placeholder="mike@gmail.com" name="email">
						</div>
						<div class="mt-8">
							<div class="flex justify-between items-center">
								<div class="text-sm font-bold text-black-700 tracking-wide">
									Password</div>
								<div>
									<a
										class="text-xs font-display font-semibold text-indigo-600 hover:text-indigo-800
                                        cursor-pointer">
										Forgot Password? </a>
								</div>
							</div>
							<input
								class="w-full text-lg py-2 border-b border-gray-300 focus:outline-none focus:border-indigo-500"
								type="" placeholder="Enter your password" name="password">
						</div>
						<div class="mt-10">
							<button
								class="bg-green-500 text-gray-100 p-4 w-full rounded-full tracking-wide
                                font-semibold font-display focus:outline-none focus:shadow-outline hover:bg-indigo-600
                                shadow-lg">
								Log In</button>
						</div>
					</form>
					<div
						class="mb-5 text-sm font-display font-semibold text-gray-700 text-center">
						Don't have an account ? <a
							class="cursor-pointer text-indigo-600 hover:text-indigo-800">Sign
							up</a>
					</div>
				</div>
			</div>
		</div>
		<div class="pt-5">
			<img src="All_Component/Images/login_page_bg.jpg">

		</div>
	</div>


	<%@include file="All_Component/footer.jsp"%>
</body>
</html>
