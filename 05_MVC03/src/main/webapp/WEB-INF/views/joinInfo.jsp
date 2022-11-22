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
</head>
<body>
	<div align="center">
		<hr width="30%">
		<h3>회원가입 정보</h3>
		<hr width="30%">
		<br />
		<table class="table table-bordered" style="width: 36em">
		<c:set var="dto" value="${Member }" />
		<c:if test="${!empty dto }">
		
		<tr>
            <th>아이디</th>
            <td>${dto.id }</td>
        </tr>
		<tr>
            <th>이름</th>
            <td>${dto.name }</td>
        </tr>
		<tr>
            <th>비밀번호</th>
            <td>${dto.pwd }</td>
        </tr>
		<tr>
            <th>나이</th>
            <td>${dto.age }</td>
        </tr>
		<tr>
            <th>연락처</th>
            <td>${dto.phone }</td>
        </tr>
		<tr>
            <th>메일</th>
            <td>${dto.email }</td>
        </tr>
		<tr>
            <th>주소</th>
            <td>${dto.addr }</td>
        </tr>
        
		</c:if>
	</div>

</body>
</html>