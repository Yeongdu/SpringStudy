<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div align="center">
	   <hr width="50%" color="gray">
	      <h3>BOARD 테이블 게시판 글쓰기 수정 폼 페이지</h3>
	   <hr width="50%" color="gray">
	   <br>
	   
	   <form method="post"
	      action="<%=request.getContextPath() %>/board_modify_ok.do">
	      
	      <c:set var="dto" value="${Modify }" />
	      
	      <input type="hidden" name="board_no" value="${dto.getBoard_no() }">
	      <input type="hidden" name="db_pwd" value="${dto.getBoard_pwd() }">
	      
	      <table border="1" cellspacing="0" width="400">
	         <tr>
	            <th>작성자</th>
	            <td> <input name="board_writer"
	                    value="${dto.getBoard_writer() }" readonly> </td>
	         </tr>
	         
	         <tr>
	            <th>글 제목</th>
	            <td> <input name="board_title"
	                    value="${dto.getBoard_title() }"> </td>
	         </tr>
	         
	         <tr>
	            <th>글 내용</th>
	            <td> 
	            	<textarea rows="7" cols="25" name="board_cont">${dto.getBoard_cont() }</textarea> 
	            </td>
	         </tr>
	         
	         <tr>
	            <th>글 비밀번호</th>
	            <td> 
	               <input type="password" name="board_pwd"> 
	            </td>
	         </tr>
	         
	         <tr>
	            <td colspan="2" align="center">
	               <input type="submit" value="글수정">&nbsp;&nbsp;
	               <input type="reset" value="다시작성">
	            </td>
	         </tr>
	         
	      </table>
	   </form>
	
	</div>
	
</body>
</html>