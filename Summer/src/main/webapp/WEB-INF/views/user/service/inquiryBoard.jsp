<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의</title>
<style>
	/*문의사항작성버튼*/
	input#btn-add{float:right; margin: 0 0 15px;}
</style>
<script>
	function fn_goinquiryBoardForm(){
		location.href = "${pageContext.request.contextPath}/service/inquiryBoardForm.do";
	}
	
	$(function(){
		$("tr[id]").on("click",function(){
			var QNO = $(this).attr("id");
			console.log("QNO="+QNO);
			location.href = "${pageContext.request.contextPath}/user/inquiryBoardService/inquiryBoarView.do?no="+QNO;
		});
	});
	
</script>
</head>
<body>
	<c:import url="/WEB-INF/views/user/common/header.jsp"/>
	<div id="container" style="background:white; padding:5%" >
		<section id="question-container" class="container">
			<input type="button" value="문의사항작성" id="btn-add" class="btn btn-outline-success" onclick="fn_goinquiryBoardForm();"/>
			<table id="tbl-question" class="table table-striped table-hover">
				<tr>
					<th>문의번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
				<c:forEach items="${list}" var="q"> 
				<tr id="${q.QNO}">
					<td>${q.QNO}</td>
					<td>${q.QTITLE}</td>
					<td>${q.USERID}</td>
					<td>${q.QDATE}</td>
				</tr>
				</c:forEach>
			</table>
				<!-- 페이징 처리 사직-->
				<div class="row">
					<div class="col-md-12 text-center">
						<div class="block-27">
							<c:out value="${pageBar}" escapeXml="false"/>
		            	</div>
					</div>
				</div>
				<!-- 페이징 처리 끝-->
		</section> 
	</div>
	
	<c:import url="/WEB-INF/views/user/common/footer.jsp"/>
	
</body>
</html>