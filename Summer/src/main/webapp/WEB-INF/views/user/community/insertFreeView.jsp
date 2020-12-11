<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="selectMenu" value="community" scope="request"/>
<!DOCTYPE HTML>
<html>
	<head>
	<title>Summer - COMMUNITY</title> 
	<meta charset="utf-8">
   
	</head>
	<body>
		
	<div class="colorlib-loader"></div>

	<div id="page">
	
		<c:import url="/WEB-INF/views/user/common/header.jsp"/>
		
		<!-- 상단 페이지 정보 -->
		<div class="breadcrumbs">
			<div class="container">
				<div class="row">
					<div class="col">
						<p class="bread"><span><a href="${pageContext.request.contextPath}">Home</a></span> / <span>Community</span></p>
					</div>
				</div>
				<h1>자유게시판 작성</h1>
				<hr style="margin-top:-10px;"/>
			</div>
		</div>

		<div class="colorlib-product" style="margin-top:-80px; clear: both;">
			<div class="container">
				<div class="row row-pb-md">
					<div class="col" >
						<div style="padding : 10px; margin-bottom : 10px;">
							<table style="width : 100%">
								<tr>
									<td><input type="text" placeholder="제목을 입력해주세요" style="width : 100%"/></td>
								</tr>
								<tr>
									<td><br /><textarea rows="20" placeholder="내용을 입력해주세요" style="width : 100%"></textarea></td>
								</tr>
								<tr>
									<td>파일첨부 <img class="imageArea" width="100" height="100" onchange="fileAdd(this);"></td>
								</tr>
								<tr>
									<td style="text-align: center;">
									<br />
										<button type="button" class="btn btn-primary" style="background : #88c8bc; border : #88c8bc;"
												onclick="fn_submit();">등록</button>
										<button type="button" class="btn btn-primary" style="background : #88c8bc; border : #88c8bc;"
												onclick="fn_cancel();">취소</button>							
									</td>
								</tr>
							</table>
							<div id="fileArea">
								<input type="file" name="imageFile" class="imageFile" onchange="loadImg(this, 0);" />
							</div>
						</div>
					</div>
				</div>
				
			</div>
		</div>
		
		<c:import url="/WEB-INF/views/user/common/footer.jsp"/>
		
	</div>
		
	<script>
		var $imageTag = $('.imageArea')[0];
		
		$(function(){
			$('.imageArea').each(function(idx, item){
				$(item).click(function(){
					$('.imageFile')[idx].click();
				});
			});
		});

		function loadImg(img, num){
			if(img.files && img.files[0]) {
				
				var reader = new FileReader();
				
				reader.onload = function(e){
					
					$($('.imageArea')[num]).attr('src', e.target.result);
				}
				reader.readAsDataURL(img.files[0]);
				// 여기에 태그 추가
				//$('#imageArea').clone(true).appendTo($('#result'));
				console.log(img);
				//img.clone(true).appendTo($('#fileArea'));
				$('.imageArea').parent().append($($imageTag).clone(true));
			}
		}

		function fileAdd(img) {
			alert('adsf');
		}
		
		function fn_submit() {
			if(confirm('등록 하시겠습니까?')) {
				
			}
		}

		function fn_cancel() {
			if(confirm('작성 취소하시겠습니까?')) {
				location.href='${pageContext.request.contextPath}/community/selectFreeList.do?';
			}
		}
		
	</script>
	
	</body>
</html>

