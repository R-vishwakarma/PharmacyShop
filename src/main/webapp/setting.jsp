<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="All_Component/allcss.jsp"%>
	<%@include file="All_Component/navbar.jsp"%>


	<%
	User u = (User) session.getAttribute("userobj");
	%>










	<div class="mx-4 min-h-screen max-w-screen-xl sm:mx-8 xl:mx-auto">
		<h1 class="border-b py-6 text-4xl font-semibold">Settings</h1>
		<div class="grid grid-cols-8 pt-3 sm:grid-cols-10">


			<div class="col-span-2 hidden sm:block">
				<ul>

					<li
						class="mt-5 cursor-pointer border-l-2 border-l-blue-700 px-2 py-2 font-semibold text-blue-700 transition hover:border-l-blue-700 hover:text-blue-700">Account</li>
					<li
						class="mt-5 cursor-pointer border-l-2 border-transparent px-2 py-2 font-semibold transition hover:border-l-blue-700 hover:text-blue-700">
						<a href="order.jsp">My orders</li>
					<li
						class="mt-5 cursor-pointer border-l-2 border-transparent px-2 py-2 font-semibold transition hover:border-l-blue-700 hover:text-blue-700">
						<a href="edit_profile.jsp">Edit Profile</a>
					</li>

				</ul>
			</div>

			<div
				class="col-span-8 overflow-hidden rounded-xl sm:bg-gray-50 sm:px-8 sm:shadow">
				<div class="pt-4">

					<div>

						<h1 class="py-2 text-2xl font-semibold">
							Account settings <a href="edit_profile.jsp"><img
								src="All_Component/Images/editing.png" class="h-8"> </a>
						</h1>

					</div>



				</div>
				<hr class="mt-4 mb-8" />
				<p class="py-2 text-xl font-semibold">Email Address</p>
				<div
					class="flex flex-col sm:flex-row sm:items-center sm:justify-between">
					<p class="text-gray-600">
						Your email address is :<strong><%=u.getEmail()%></strong>
					</p>



					<a href="edit_profile.jsp">
						<button
							class="inline-flex text-sm font-semibold text-blue-600 underline decoration-2">Change</button>
					</a>
				</div>

				<hr class="mt-4 mb-8" />
				<p class="py-2 text-xl font-semibold">Name</p>
				<div
					class="flex flex-col sm:flex-row sm:items-center sm:justify-between">
					<p class="text-gray-600">
						Your name is  :<strong><%=u.getName()%></strong>
					</p>

				</div>

				<hr class="mt-4 mb-8" />
				<p class="py-2 text-xl font-semibold">Phone</p>
				<div
					class="flex flex-col sm:flex-row sm:items-center sm:justify-between">
					<p class="text-gray-600">
						Contact :<strong><%=u.getPhone()%></strong>
					</p>

				</div>
			</div>
		</div>
	</div>
	<%@include file="All_Component/footer.jsp"%>
</body>
</html>