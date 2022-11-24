<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dto" value="${Cont}" />
<c:set var="mName" value="${mName}" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>EMP 테이블 ${dto.ename } 사원 상세정보</title>
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

        <h3>${dto.ename } 사원 상세정보</h3>


        <br />


 
            <div class="form-group row border-bottom py-2">
                <label for="empno" class="col-sm-4 col-form-label">사원번호</label>
                <div class="col-sm-8">
                    <input type="number" name="empno" id="empno" value="${dto.empno}" class="form-control-plaintext" readonly />
                </div>
            </div>
            
            <div class="form-group row border-bottom py-2">
                <label for="ename" class="col-sm-4 col-form-label">사원명</label>
                <div class="col-sm-8">
                    <input type="text" name="ename" id="ename" value="${dto.ename}" class="form-control-plaintext" readonly />
                </div>
            </div>

            <div class="form-group row border-bottom py-2">
                <label for="job" class="col-sm-4 col-form-label">담당업무</label>
                <div class="col-sm-8">
                    <input type="text" name="job" id="job" value="${dto.job}" class="form-control-plaintext" readonly />
                </div>
            </div>

            <div class="form-group row border-bottom py-2">
                <label for="mgr" class="col-sm-4 col-form-label">관리자</label>
                <div class="col-sm-8">
                    <input type="text" name="mgr" id="mgr" value="${mName} [${dto.mgr}]" class="form-control-plaintext" readonly />
                </div>
            </div>


            
            <div class="form-group row border-bottom py-2">
                <label for="memid" class="col-sm-4 col-form-label">급여</label>
                <div class="col-sm-8">
                    <input type="number" name="sal" id="sal" value="${dto.sal}" class="form-control-plaintext" readonly />
                </div>
            </div>
            
            <div class="form-group row border-bottom py-2">
                <label for="memid" class="col-sm-4 col-form-label">보너스</label>
                <div class="col-sm-8">
                    <input type="number" name="comm" id="comm" value="${dto.comm}" class="form-control-plaintext" readonly />
                </div>
            </div>
            
            <div class="form-group row border-bottom py-2">
                <label for="dname" class="col-sm-4 col-form-label">부서명</label>
                <div class="col-sm-8">
                    <input type="text" name="dname" id="dname" value="${dto.dname} [${dto.deptno}] (${dto.loc})" class="form-control-plaintext" readonly />
                </div>
            </div>



			<div class="form-group row mt-4" align="center">
<!--                 <div class="col-4"> -->
<%--                     <a href="<%=request.getContextPath()%>/member_view.do?num=${param.num}" class="btn btn-outline-secondary">돌아가기</a> --%>
<!--                 </div> -->
                <div>
                    <button type="submit" class="btn btn-success"
                    onclick="location.href='<%=request.getContextPath() %>/emp_modify.do?no=${dto.empno }'"
                    >수정하기</button>
                    <input type="button" value="삭제" class="btn btn-outline-danger"
					onclick="if(confirm('정말로 사원을 삭제하시겠습니까? 이 작업은 되돌릴 수 없습니다.')){
					location.href='<%=request.getContextPath() %>/emp_delete.do?no=${dto.empno }'} 
					else{return; }">
                    <input type="button" class="btn btn-secondary" value="사원목록" onclick="location.href='emp_list.do'">
                </div>
            </div>
    </div>
</body>
</html>