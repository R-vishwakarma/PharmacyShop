<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="All_Component/allcss.jsp"%>
	<%@include file="All_Component/navbar.jsp"%>


	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp">

		</c:redirect>
	</c:if>



	<c:if test="${not empty failedMsg }">

		<p class="text-center text-danger">${failedMsg}</p>
		<c:remove var="failedMsg" scope="session" />

	</c:if>

	<c:if test="${not empty succMsg }">

		<p class="text-center text-success">${succMsg}</p>
		<c:remove var="succMsg" scope="session" />

	</c:if>



	<form action="update_profile" method="post">

		<input type="hidden" value="${userobj.id}" name="id">

		<div
			class="bg-white w-full flex flex-col justify-center items-center pt-4 px-1 md:px-5px lg:px-28">
			<h1 class="py-2 text-2xl font-semibold">Edit Profile</h1>

			<div class="w-full max-w-xl px-6 pb-8 mt-8 sm:max-w-xl sm:rounded-lg">
				<form class="space-y-6">
					<div class="items-center mt-8 sm:mt-14 text-[#202142]">
						<div class="mb-2 sm:mb-6">
							<label for="first_name"
								class="block mb-2 text-sm font-medium text-indigo-900 dark:text-white">Your
								Name</label> <input type="text" id="first_name" name="name"
								class="bg-indigo-50 border border-indigo-300 text-indigo-900 text-sm rounded-lg focus:ring-indigo-500 focus:border-indigo-500 block w-full p-2.5"
								value="${userobj.name }" required>
						</div>



						<div class="mb-2 sm:mb-6">
							<label for="email"
								class="block mb-2 text-sm font-medium text-indigo-900 dark:text-white">Your
								email</label> <input type="email" id="email" name="email"
								class="bg-indigo-50 border border-indigo-300 text-indigo-900 text-sm rounded-lg focus:ring-indigo-500 focus:border-indigo-500 block w-full p-2.5"
								placeholder="your.email@mail.com" value="${userobj.email }"
								required>
						</div>


						<div class="mb-2 sm:mb-6">
							<label for="last_name"
								class="block mb-2 text-sm font-medium text-indigo-900 dark:text-white">Phone</label>
							<input type="text" id="" name="phone"
								class="bg-indigo-50 border border-indigo-300 text-indigo-900 text-sm rounded-lg focus:ring-indigo-500 focus:border-indigo-500 block w-full p-2.5"
								placeholder="Your last name" value="${userobj.phone }" required>
						</div>

						<div class="mb-2 sm:mb-6">
							<label for="profession"
								class="block mb-2 text-sm font-medium text-indigo-900 dark:text-white">Password</label>
							<input type="text" id="profession" name="password"
								class="bg-indigo-50 border border-indigo-300 text-indigo-900 text-sm rounded-lg focus:ring-indigo-500 focus:border-indigo-500 block w-full p-2.5">
						</div>



						<div class="flex justify-end">
							<button type="submit"
								class="text-white bg-indigo-700 hover:bg-indigo-800 focus:ring-4 focus:outline-none focus:ring-indigo-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center dark:bg-indigo-600 dark:hover:bg-indigo-700 dark:focus:ring-indigo-800">Save</button>
						</div>
					</div>
				</form>
			</div>
		</div>

</form>


		<%@include file="All_Component/footer.jsp"%>
</body>
</html>