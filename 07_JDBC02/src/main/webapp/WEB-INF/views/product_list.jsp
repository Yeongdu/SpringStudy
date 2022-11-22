<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product list</title>
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
a{
text-decoration: none;
color: white;
}


</style>
</head>
<body>
	<div align="center">
	<div>

		<br>
		<h3 style="font-weight: bold; color: FloralWhite; text-shadow: 2px 2px 0 #ffd217, 5px 5px 0 #5ac7ff, 7px 7px 0 #ffd217, 10px 10px 0 #5ac7ff; ">Member10 테이블 목록</h3>
		<br>

		<table class="table table-dark table-hover" style="width: 40em">
			<tr>
				<th>제품번호</th>
				<th>제품명</th>
				<th>출고가</th>
				<th>제조사</th>
			</tr>
			<c:set var="list" value="${productList }" />
			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="dto">
					<tr>
						<td>${dto.pnum }</td>
						<td><a style="display: block;" href="<%=request.getContextPath() %>/product_content.do?pnum=${dto.pnum }">${dto.products_name }</a> </td>
						<td><fmt:formatNumber value="${dto.output_price }" /></td>
						<td>${dto.company }</td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty list }">
				<tr>
					<td colspan="4" align="center">
						<h3>상품 리스트가 없습니다.</h3>
					</td>
				</tr>
			</c:if>

			<tr>
				<td colspan="4" align="center"><input type="button"
					value="제품등록" onclick="location.href='product_insert.do'">
					<c:if test="${!empty keyword }">
						<input type="button" value="전체목록"
							onclick="location.href='product_list.do'">
					</c:if>
				</td>
			</tr>
		</table>
		
</div>
	</div>

</body>
</html>