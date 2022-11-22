<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
.mb-3 {
	width: 50%
}
</style>
</head>
<body>
	<div align="center">
		<hr width="30%" color="blue">
			<h3>개인정보 입력 폼 페이지</h3>
		<hr width="30%" color="blue">
		<br />
		
		<form method="post" action="<%=request.getContextPath() %>/inputOk">
		
			<div class="mb-3 row">
				<label for="name"
					class="col-sm-2 col-form-label">이름</label>
				<div class="col-sm-10">
					<input type="text" name="name" class="form-control">
				</div>
			</div>

			<div class="mb-3 row">
				<label for="age"
					class="col-sm-2 col-form-label">나이</label>
				<div class="col-sm-10">
					<input type="number" name="age" class="form-control">
				</div>
			</div>
			
			<div class="mb-3 row">
				<label for="phone"
					class="col-sm-2 col-form-label">연락처</label>
				<div class="col-sm-10">
					<input type="text" name="phone" class="form-control">
				</div>
			</div>
			
			<div>
				<input type="submit" value="전송" class="btn btn-primary">&nbsp;&nbsp;
				<input type="reset" value="취소" class="btn btn-outline-primary">
			</div>
			
		</form>
	</div>

</body>
</html>