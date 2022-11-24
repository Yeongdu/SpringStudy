<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
color: black;
}

</style>
</head>
<body>

<div align="center">

		<br>
		<br>
		<p><span style="border-radius: 15px 15px 15px 0; border: 3px solid LightSeaGreen; padding: 0.5em 0.6em; color: LightSeaGreen; font-size: 2em; box-shadow: 3px 3px 5px #80808066;">EMP테이블 전체 사원 목록페이지</span></p>
		<br>

		<table class="table table-hover" style="width: 36em">
			<tr>
				<th>사번</th>
				<th>이름</th>
				<th>담당업무</th>
				<th>부서</th>
				<th>근무지</th>
				<th>입사일</th>
			</tr>
			<c:set var="list" value="${List }" />
			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="dto">
					<tr>
						<td>${dto.empno }</td>
						<td><a style="display: block;" href="<%=request.getContextPath() %>/emp_content.do?no=${dto.empno }">${dto.ename }</a> </td>
						<td>${dto.job }</td>
						<td>${dto.dname }</td>
						<td>${dto.loc }</td>
						<td>${dto.hiredate.substring(0,10) }</td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty list }">
				<tr>
					<td colspan="6" align="center">
						<h3>사원 리스트가 없습니다.</h3>
					</td>
				</tr>
			</c:if>

			<tr>
				<td colspan="6" align="center">
					<input type="button" class="btn btn-secondary" value="사원등록" onclick="location.href='emp_insert.do'">
				</td>
			</tr>
		</table>
		<br />

	
	</div>


</body>
</html>