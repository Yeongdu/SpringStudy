<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
	crossorigin="anonymous"></script>
<style type="text/css">
body{
background-color: #f2f0f0;
}
</style>
</head>
<body>
	<div align="center">
		<br />
		<h3 style="font-weight: bold; color: FloralWhite; text-shadow: 2px 2px 0 #ffd217, 5px 5px 0 #5ac7ff, 7px 7px 0 #ffd217, 10px 10px 0 #5ac7ff; ">PRODUCTS 테이블 메인 페이지</h3>
		<br>
		<input class="btn btn-dark" value="제품전체목록" onclick="location.href='product_list.do'">
	</div>
	
</body>
</html>
