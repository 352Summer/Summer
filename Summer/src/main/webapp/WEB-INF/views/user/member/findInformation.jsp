<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>아이디 비밀번호 찾기 창 </title>

<style>
	table {margin-left: auto; margin-right: auto;}

</style>

</head>

<body>

	<c:import url="/WEB-INF/views/user/common/header.jsp"/>
	
	<br />
	
	<table width="100%" border="0" cellspacing="0" cellpadding="0" >
	
	<tr>
		<td style="padding:5px 10px;" class="white12bold">아이디/비밀번호 찾기</td>
	</tr>
	
	<tr>
		<td style="padding:5px 10px; text-align:center; font-weight:900; font-size:xx-large; " class="white12bold">SUMMER</td>
	</tr
	
	</table>
	<table width="450" border="0" cellspacing="0" cellpadding="0" class="grey12">
		<tr>
			<td style="padding:20px 0 0 0">
				<table width="420" border="0" align="center" cellpadding="0" cellspacing="0">
					<tr>
						<td style="padding:15px; border-top:2px #cccccc solid; border-right:2px #cccccc solid; border-bottom:2px #cccccc solid; border-left:2px #cccccc solid;">
							<form name="id_f" id="id_f" method="post" action="id_find_ok.php">
							 	<table width="380" border="0" cellspacing="0" cellpadding="0">
	  								<tr>
	  									<td class="stitle">아이디 찾기</td>
	  								</tr>
			  				  	</table>
			  					<table width="380" border="0" cellspacing="1" class="regtable">
			  						<tr>
			  							<td width="100" height="25" bgcolor="#f4f4f4">이름</td>
			  							<td width="130">
			  								<input type="text" name="mem_name" id="mem_name" tabindex="1"/>
			  							</td>
			  							<td rowspan="3" align="center"><div class="bts" ><a href="javascript:id_search();"  tabindex="4"><span style="width:80px">아이디 찾기</span></a></div></td>
			  						</tr>
			  						<tr>
			  							<td height="25" bgcolor="#f4f4f4">생년월일</td>
			  							<td>
			  								<input type="text" name="mem_email" id="mem_email" tabindex="2"/>
			  							</td>
			  						</tr>
			  						<tr>
			  							<td height="25" bgcolor="#f4f4f4">e-Mail</td>
			  							<td>
			  								<input type="text" name="mem_email" id="mem_email" tabindex="2"/>
			  							</td>
			  						</tr>
								</table>
							</form>
									
							<form name="pw_f" id="pw_f" method="post" action="pw_find_ok.php">
			  					<table width="380" border="0" cellspacing="0" cellpadding="0">
			  						 <tr>
			  							<td class="stitle">비밀번호 찾기</td>
			  						</tr>
			  					</table>
			  					<table width="380" border="0" cellspacing="1" class="regtable">
			  						<tr>
			  							<td width="100" height="25" bgcolor="#f4f4f4">ID</td>
			  							<td width="130">
			  								<input type="text" name="mem_id" id="mem_id" tabindex="5"/>
			  							</td>
			  							<td rowspan="4" align="center"><div class="bts"><a href="javascript:pw_search();"  tabindex="8"><span style="width:80px">비밀번호 찾기</span></a></div></td>
			  						</tr>
			  						<tr>
			  							<td height="25" bgcolor="#f4f4f4">이름</td>
			  							<td>
			  								<input type="text" name="mem_email" id="mem_email" tabindex="6"/>
			  							</td>
			  						</tr>
			  						<tr>
			  							<td height="25" bgcolor="#f4f4f4">생년월일</td>
			  							<td>
			  								<input type="text" name="mem_email" id="mem_email" tabindex="6"/>
			  							</td>
			  						</tr>
			  						<tr>
			  							<td height="25" bgcolor="#f4f4f4">e-Mail</td>
			  							<td>
			  								<input type="text" name="mem_email" id="mem_email" tabindex="6"/>
			  							</td>
			  						</tr>
			  					</table>
	           			 	</form>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	
	<c:import url="/WEB-INF/views/user/common/footer.jsp"/>
	
</body>
</html>