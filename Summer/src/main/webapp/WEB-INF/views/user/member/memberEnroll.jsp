<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 창</title>

<style>

	div#enroll-container{width:400px; margin:0 auto; text-align:center;}
	div#enroll-container input, div#enroll-container select {margin-bottom:10px;}
	div#enroll-container table th{text-align: right; padding-right:10px;}
	div#enroll-container table td{text-align: left;}
	/*중복아이디체크관련*/
	div#userId-container{position:relative; padding:0px;}
	div#userId-container span.guide {display:none;font-size: 12px;position:absolute; top:12px; right:10px;}
	div#userId-container span.ok{color:green;}
	div#userId-container span.error, span.invalid{color:red;}
	
</style>

</head>

<body>

<div id="container">
	<c:import url="/WEB-INF/views/user/common/header.jsp"/>
		<section id="content">
			<div id="enroll-container">
				<form name="memberEnrollFrm" action="memberEnrollEnd.do" method="post" onsubmit="return fn_enroll_validate();" >
					<table>
						<br />
						<h4>회원가입</h4>
						<h3>SUMMER</h3>
						<tr>
							<th>아이디</th>
							<td>
								<div id="userId-container">
									<input type="text" class="form-control" placeholder="아이디 입력(5자~11자)" name="userId" id="userId_" required>
				            		<input type="hidden" name="idDuplicateCheck" id="idDuplicateCheck" value="0"/>
				            		<button>중복확인</button>
				            	</div>
							</td>
						</tr>
						
						<tr>
							<th>닉네임</th>
							<td>
								<div id="userNickName-container">
									<input type="text" class="form-control" placeholder="닉네임 입력(4자~11자)" name="userNn" id="userNn_" required>
									<button id="nncheck">중복확인</button>
					            	<input type="hidden" name="idDuplicateCheck" id="idDuplicateCheck" value="0"/>
								</div>
							</td>
						</tr>
						
						<tr>
							<th>패스워드</th>
							<td>
								<input type="password" class="form-control" name="password" id="password_" required>
							</td>
						</tr>
						<tr>
							<th>패스워드확인</th>
							<td>	
								<input type="password" class="form-control" id="password2" required>
							</td>
						</tr>  
						<tr>
							<th>이름</th>
							<td>	
							<input type="text" class="form-control" name="userName" id="userName" required>
							</td>
						</tr>
						<tr>
							<th>생년월일</th>
							<td>	
							<input type="number" class="form-control" placeholder="생년월일 8자 입력" name="age" id="age">
							</td>
						</tr> 
						
						<tr>
							<th>주소</th>
							<td>	
								<input type="text" class="form-control" placeholder="" name="address" id="address">
								<button>주소검색</button>
							</td>
						</tr>
						
						<tr>
							<th>이메일</th>
							<td>	
								<input type="email" class="form-control" placeholder="이메일 주소 입력" name="email" id="email">
							</td>
						</tr>
						<tr>
							<th>휴대폰</th>
							<td>	
								<input type="tel" class="form-control" placeholder="전화번호 입력('-'없이 숫자만 입력)" name="phone" id="phone" maxlength="11" required>
							</td>
						</tr>
				
					</table>
					
					<br />
					<br />
					<br />
					<br />
					
					<input type="submit" class="btn btn-outline-success" value="가입하기" >
					<input type="reset"  class="btn btn-outline-danger" value="뒤로가기">
				</form>
			</div>
			
			<script>
			$(function(){
				
				$("#password2").blur(function(){
					var p1=$("#password_").val(), p2=$("#password2").val();
					if(p1!=p2){
						alert("패스워드가 일치하지 않습니다.");
						$("#password_").focus();
					}
				});
				
				/* 아이디 중복검사 이벤트 추가 */
				$("#userId_").on("keyup", function(){
			        var userId = $(this).val().trim();
			        
			        if(userId.length<5) {
			        	$(".guide.error").hide();
			        	$(".guide.ok").hide();
			        	$(".guide.invalid").show();
			        	return;
			        	
			        } else {
			        	
				        $.ajax({
				            url  : "${pageContext.request.contextPath}/member/checkIdDuplicate.do",
				            data : {userId:userId},
				            dataType: "json",
				            success : function(data){
				                console.log(data);
				                // if(data=="true") //stream 방식
				                if(data.isUsable==true){ //viewName 방식
				                    $(".guide.error").hide();
				                    $(".guide.invalid").hide();
				                    $(".guide.ok").show();
				                    $("#idDuplicateCheck").val(1);
				                } else {
				                    $(".guide.error").show();
				                    $(".guide.invalid").hide();
				                    $(".guide.ok").hide();
				                    $("#idDuplicateCheck").val(0);
				                }
				            }, error : function(jqxhr, textStatus, errorThrown){
				                console.log("ajax 처리 실패");
				                //에러로그
				                console.log(jqxhr);
				                console.log(textStatus);
				                console.log(errorThrown);
				            }
			        	});
			     	}
			     //console.log(userId);
				});
			});
			
			function validate(){
				var userId = $("#userId_");
				if(userId.val().trim().length<5){
					alert("아이디는 최소 5자리이상이어야 합니다.");
					userId.focus();
					return false;
				}
				
				//아이디중복체크여부
			    if($("#idDuplicateCheck").val()==0){
			        alert("사용가능한 아이디를 입력해주세요.");
			        return false();
			    }
				
				return true;
			}
			</script>
		</section>	
		<c:import url="/WEB-INF/views/user/common/footer.jsp"/>
	</div>
</body>
</html>