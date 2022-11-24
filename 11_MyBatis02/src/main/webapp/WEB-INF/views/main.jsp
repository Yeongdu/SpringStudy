<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="UTF-8" %>
<html>
<head>
	<title>EMP 테이블</title>
</head>
<body>
	<br>
	<div align="center">
		<hr color="Crimson">
		<h3>EMP 테이블 메인 페이지</h3>
		<hr color="Crimson">
		<br><br>
		
		<a href="<%=request.getContextPath() %>/emp_list.do">[전체 사원 목록]</a>
	</div>

</body>
</html>
