<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Order</title>
<%@include file="allcss.jsp"%>
</head>
<body>
<%@include file="navbar.jsp"%>

 <!-- privacy -->
 <c:if test="${empty userobj }">
		<c:redirect url="../login.jsp">

		</c:redirect>
	</c:if>


<div class="overflow-x-auto">
  <table class="table-auto w-full border-collapse border border-gray-400">
    <thead>
      <tr>
        <th class="px-4 py-2 bg-gray-200 border border-gray-400">#</th>
        <th class="px-4 py-2 bg-gray-200 border border-gray-400">First</th>
        <th class="px-4 py-2 bg-gray-200 border border-gray-400">Last</th>
        <th class="px-4 py-2 bg-gray-200 border border-gray-400">Handle</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td class="px-4 py-2 border border-gray-400">1</td>
        <td class="px-4 py-2 border border-gray-400">Mark</td>
        <td class="px-4 py-2 border border-gray-400">Otto</td>
        <td class="px-4 py-2 border border-gray-400">@mdo</td>
      </tr>
      <tr>
        <td class="px-4 py-2 border border-gray-400">2</td>
        <td class="px-4 py-2 border border-gray-400">Jacob</td>
        <td class="px-4 py-2 border border-gray-400">Thornton</td>
        <td class="px-4 py-2 border border-gray-400">@fat</td>
      </tr>
      <tr>
        <td class="px-4 py-2 border border-gray-400">3</td>
        <td colspan="2" class="px-4 py-2 border border-gray-400">Larry the Bird</td>
        <td class="px-4 py-2 border border-gray-400">@twitter</td>
      </tr>
    </tbody>
  </table>
</div>



<%@include file="footer_2.jsp"%>
</body>
</html>