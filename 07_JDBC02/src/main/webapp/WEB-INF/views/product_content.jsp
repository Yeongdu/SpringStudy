<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dto" value="${Cont }" />
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
		<h3>제품 상세</h3>
		<br>
			<c:if test="${!empty dto }">
				<div class="mb-3 row">
				<label for="exampleFormControlInput1"
					class="col-sm-2 col-form-label">카테고리</label>
				<div class="col-sm-10">
					<input name="category_fk" class="form-control" value="[${dto.category_fk }] ${Cate}" readonly>
				</div>
			</div>

				<div class="mb-3 row">
				<label for="exampleFormControlInput1"
					class="col-sm-2 col-form-label">제품명</label>
				<div class="col-sm-10">
					<input name="products_name" class="form-control"
						value="${dto.products_name}" readonly>
				</div>
			</div>
			
			<div class="mb-3 row">
				<label for="exampleFormControlInput1"
					class="col-sm-2 col-form-label">상품코드</label>
				<div class="col-sm-10">
					<input name="ep_code_fk" class="form-control" value="${dto.ep_code_fk}" readonly>
				</div>
			</div>
			


			<div class="mb-3 row">
				<label for="exampleFormControlInput1"
					class="col-sm-2 col-form-label">입고가</label>
				<div class="col-sm-10">
					<input name="input_price" class="form-control" value="${dto.input_price}" readonly>
				</div>
			</div>

			<div class="mb-3 row">
				<label for="exampleFormControlInput1"
					class="col-sm-2 col-form-label">출고가</label>
				<div class="col-sm-10">
					<input name="output_price"  class="form-control" value="${dto.output_price}" readonly>
				</div>
			</div>

			<div class="mb-3 row">
				<label for="exampleFormControlInput1"
					class="col-sm-2 col-form-label">배송비</label>
				<div class="col-sm-10">
					<input name="trans_cost"  class="form-control" value="${dto.trans_cost}" readonly>
				</div>
			</div>

			<div class="mb-3 row">
				<label for="exampleFormControlInput1"
					class="col-sm-2 col-form-label">마일리지</label>
				<div class="col-sm-10">
					<input name="mileage"  class="form-control" value="${dto.mileage}" readonly>
				</div>
			</div>

			<div class="mb-3 row">
				<label for="exampleFormControlInput1"
					class="col-sm-2 col-form-label">제조사</label>
				<div class="col-sm-10">
					<input name="company"  class="form-control" value="${dto.company}" readonly>
				</div>
			</div>
			</c:if>
			
			<c:if test="${empty dto }">
				<h3>제품 상세 정보가 없습니다.</h3>
			</c:if>
			
			<div>
				<input type="submit" value="수정"
				onclick="location.href='<%=request.getContextPath() %>/product_update.do?pnum=${dto.pnum }'">&nbsp;&nbsp;
				<input type="button" value="삭제"
					onclick="if(confirm('정말로 제품을 삭제하시겠습니까?')){
					location.href='<%=request.getContextPath() %>/product_delete.do?pnum=${dto.pnum }'} 
					else{return; }">&nbsp;&nbsp;
				
				<input type="button" value="목록"
					onclick="location.href='product_list.do'">
				</div>
			</div>
			
</div>
</div>
</body>
</html>