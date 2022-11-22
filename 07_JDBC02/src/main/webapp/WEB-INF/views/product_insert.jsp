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
</style>
</head>
<body>
<div align="center">
<div style="width: 40em;">


		<br>
		<h3>제품 추가</h3>
		<br>
		<%-- enctype : 파일을 업로드 하기 위한 속성 --%>
		<form method="post"
			action="<%=request.getContextPath() %>/product_insert_ok.do">
				<div class="mb-3 row">
					<label for="form-select" class="col-sm-2 col-form-label">카테고리</label>
					<div class="col-sm-10">
						<select required class="form-select" name="category_fk" aria-label="Default select example">
							<option value="">카테고리 코드</option>
							<c:set var="clist" value="${CategoryList }" />
							<c:if test="${!empty clist }">
								<c:forEach items="${clist }" var="cdto">
									<option value="${cdto.category_code }" required>[${cdto.category_code }]
										${cdto.category_name }</option>
								</c:forEach>
							</c:if>
							<c:if test="${empty clist }">
								<option value="">::카테고리 코드 없음::</option>
							</c:if>
						</select>
					</div>
				</div>

				<div class="mb-3 row">
				<label for="exampleFormControlInput1"
					class="col-sm-2 col-form-label">제품명</label>
				<div class="col-sm-10">
					<input name="products_name" class="form-control" required>
				</div>
			</div>
			
			<div class="mb-3 row">
				<label for="exampleFormControlInput1"
					class="col-sm-2 col-form-label">상품코드</label>
				<div class="col-sm-10">
					<input name="ep_code_fk" class="form-control" required>
				</div>
			</div>
			


			<div class="mb-3 row">
				<label for="exampleFormControlInput1"
					class="col-sm-2 col-form-label">입고가</label>
				<div class="col-sm-10">
					<input name="input_price" class="form-control" required>
				</div>
			</div>

			<div class="mb-3 row">
				<label for="exampleFormControlInput1"
					class="col-sm-2 col-form-label">출고가</label>
				<div class="col-sm-10">
					<input name="output_price"  class="form-control" required>
				</div>
			</div>

			<div class="mb-3 row">
				<label for="exampleFormControlInput1"
					class="col-sm-2 col-form-label">배송비</label>
				<div class="col-sm-10">
					<input name="trans_cost"  class="form-control" required>
				</div>
			</div>

			<div class="mb-3 row">
				<label for="exampleFormControlInput1"
					class="col-sm-2 col-form-label">마일리지</label>
				<div class="col-sm-10">
					<input name="mileage"  class="form-control" required>
				</div>
			</div>

			<div class="mb-3 row">
				<label for="exampleFormControlInput1"
					class="col-sm-2 col-form-label">제조사</label>
				<div class="col-sm-10">
					<input name="company"  class="form-control">
				</div>
			</div>

			<div>
				<input type="submit" value="등록">&nbsp;&nbsp;
						<input type="reset" value="다시작성">&nbsp;&nbsp;
						<input type="button" value="목록"
					onclick="location.href='product_list.do'">
				</div>
			</div>


</body>
</html>