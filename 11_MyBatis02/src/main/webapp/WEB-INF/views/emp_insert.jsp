<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dto" value="${Modify}" />
<c:set var="jlist" value="${JobList}" />
<c:set var="mlist" value="${MgrList}" />
<c:set var="dlist" value="${DeptList}" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"> 

    <title>EMP 테이블 사원 관리</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<style type="text/css">
body{
background-color: #f2f0f0;
}
</style>

</head>
<body>
    <div style="width: 400px; margin: 50px auto; text-align: center;">
		<c:if test="${ !empty Modify }" > 

        <h3>EMP 테이블 사원 수정</h3>
		</c:if>
        
        <c:if test="${ empty Modify }" >
 
        <h3>EMP 테이블 사원 등록</h3>
		</c:if>


        <br />
		<!-- 수정 -->
		<c:if test="${ !empty Modify }" > 

		    <c:set var="required" value="" />
		    <c:set var="disabled" value="disabled='disabled'" />
		    <c:set var="page" value="emp_modify_ok.do" />
		    <c:set var="empno" value="empno" />
		    <c:set var="btn" value="수정완료" />
		</c:if>
		<!-- 생성 -->
		<c:if test="${ empty Modify }" >

		    <c:set var="required" value="required='required'" />
		    <c:set var="disabled" value="" />
		    <c:set var="page" value="emp_insert_ok.do" />
		    <c:set var="empno" value="" />
		    <c:set var="btn" value="등록하기" />
		</c:if>


        <form method="post" action="<%=request.getContextPath()%>/${page}" class="border-top">
        <input type="hidden" value="${ dto.empno }" name="${ empno }" />
        
            <div class="form-group row border-bottom py-2">
                <label for="empno" class="col-sm-4 col-form-label">사원번호</label>
                <div class="col-sm-8">
                    <input type="number" name="empno" id="empno" value="${dto.empno}" class="form-control-plaintext" ${required } ${disabled } />
                </div>
            </div> 
            
            <div class="form-group row border-bottom py-2">
                <label for="ename" class="col-sm-4 col-form-label">사원명</label>
                <div class="col-sm-8">
                    <input type="text" name="ename" id="ename" value="${dto.ename}" class="form-control-plaintext" ${required } ${disabled } />
                </div>
            </div>

			<div class="form-group row border-bottom py-2">
				<label for="form-select" class="col-sm-4 col-form-label">담당업무</label>
				<div class="col-sm-8">
					<select required class="form-select" name="job"
						aria-label="Default select example">
						<option value="">담당업무 선택</option>
						
						<c:if test="${empty jlist }">
							<option value="">:: 담당업무 없음 ::</option>
						</c:if>
						
						<c:if test="${!empty jlist }">
							<c:forEach items="${jlist }" var="str">
								<c:if test="${dto.job == str}">
									<option value="${str }" selected>${str }</option>
								</c:if>

								<c:if test="${dto.job != str}">
									<option value="${str }">${str }</option>
								</c:if>
							</c:forEach>
						</c:if>


					</select>
				</div>
			</div>

			<div class="form-group row border-bottom py-2">
					<label for="form-select" class="col-sm-4 col-form-label">관리자 번호</label>
					<div class="col-sm-8">
						<select required class="form-select" name="mgr" aria-label="Default select example">
							<option value="">관리자 선택</option>
							<c:if test="${empty mlist }">
								<option value="">:: 관리자 없음 ::</option>
							</c:if>
							
							<c:if test="${!empty mlist }">
								<c:forEach items="${mlist }" var ="mdto">
									<c:if test="${dto.mgr == mdto.empno }">
									<option value = "${mdto.empno }" selected>
										${mdto.ename }[${mdto.empno }]
									</option>								
									</c:if>
									
									<c:if test="${dto.mgr != mdto.empno }">
									<option value = "${mdto.empno }">${mdto.ename }[${mdto.empno }]</option>								
									</c:if>
								</c:forEach>
							</c:if>

						</select>
					</div>
				</div>
            
            <div class="form-group row border-bottom py-2">
                <label for="memid" class="col-sm-4 col-form-label">급여</label>
                <div class="col-sm-8">
                    <input type="number" name="sal" id="sal" value="${dto.sal}" class="form-control-plaintext" required />
                </div>
            </div>
            
            <div class="form-group row border-bottom py-2">
                <label for="memid" class="col-sm-4 col-form-label">보너스</label>
                <div class="col-sm-8">
                    <input type="number" name="comm" id="comm" value="${dto.comm}" class="form-control-plaintext" required />
                </div>
            </div>


			<div class="form-group row border-bottom py-2">
				<label for="form-select" class="col-sm-4 col-form-label">부서번호</label>
				<div class="col-sm-8">
					<select required class="form-select" name="deptno"
						aria-label="Default select example">
						<option value="">부서 선택</option>
						<c:if test="${empty dlist }">
							<option value="">:: 부서번호 없음 ::</option>
						</c:if>

						<c:if test="${!empty dlist }">
							<c:forEach items="${dlist }" var="ddto">
								<c:if test="${dto.deptno == ddto.deptno }">
									<option value="${ddto.deptno }" selected>
										${ddto.dname } [${ddto.deptno }]</option>
								</c:if>

								<c:if test="${dto.deptno != ddto.deptno }">
									<option value="${ddto.deptno }">
										${ddto.dname } [${ddto.deptno }]</option>
								</c:if>
							</c:forEach>
						</c:if>
					</select>
				</div>
			</div>


			<div class="form-group row mt-4" align="center">
<!--                 <div class="col-4"> -->
<%--                     <a href="<%=request.getContextPath()%>/member_view.do?num=${param.num}" class="btn btn-outline-secondary">돌아가기</a> --%>
<!--                 </div> -->
                <div>
                    <button type="submit" class="btn btn-success">${btn }</button>
                    <button type="reset" class="btn btn-outline-danger">다시작성</button>
                    <input type="button" class="btn btn-secondary" value="사원목록" onclick="location.href='emp_list.do'">
                </div>
            </div>
        </form>
    </div>
</body>
</html>