<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원정보수정</title>
<!-- 파비콘 -->
<link rel="shortcut icon" href="resources/common-image/favicon.ico" type="image/x-icon">
<link rel="icon" href="resources/common-image/favicon.ico" type="image/x-icon">
<link href="<c:url value="/resources/ygh-css/user_list.css"/>" rel='stylesheet' />
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
	function user_list(cPage) {
		location.href="user_list.do?cPage="+cPage;
	}
</script>
</head>
<body>
<%@include file="../common/header.jsp"%>

	 <div id="user_detail">
		<div class="user_container">
			<div class="user_content">
				<table>
				<caption>회원정보</caption>
					<tbody>
						<%-- <tr><th >프로필</th><td colspan="2">${uvo.u_profile_img}</td></tr> --%>
						<tr><th >아이디</th><td colspan="2">${uvo.u_id}</td></tr>
						<tr><th>이름</th><td colspan="2">${uvo.u_name}</td></tr>
						<tr><th>생년월일</th><td colspan="2">${uvo.u_birth}</td></tr>
						<tr><th>이메일</th><td colspan="2">${uvo.u_email}</td></tr>
						<tr><th>전화번호</th><td colspan="2">${uvo.u_phone}</td></tr>
						<tr><th>우편번호</th><td colspan="2">${uvo.u_postcode}</td></tr>
						<tr><th style="vertical-align: middle;">주소</th><td colspan="2">${uvo.u_addr} ${uvo.u_detail_addr} ${uvo.u_detail_addr2}</td></tr>
						<tr><th>성별</th><td colspan="2">${uvo.u_gender}</td></tr>
						<tr><th>신고누적</th><td colspan="2">${uvo.u_report}</td></tr>
						<tr><th>가입일</th><td colspan="2">${uvo.u_regdate.substring(0,10)}</td></tr>
					</tbody>
				</table>
				<br>
				<table>
					<tbody>
						<tr><th>탈퇴사유</th><th>탈퇴일</th><th>처리관리자</th></tr>
						<tr><td>${uvo.u_del}</td><td>${uvo.out_regdate.substring(0,10)}</td><td>${uvo.out_admin}</td></tr>
						<tr><th>복구사유</th><th>복구일</th><th>처리관리자</th></tr>
						<tr><td>${uvo.u_restore}</td><td>${uvo.re_regdate.substring(0,10)}</td><td>${uvo.re_admin}</td></tr>
					</tbody>
				</table>
			</div>
			<div class="user_buttons">
				<input type="hidden" value="${k.u_idx}" name="u_idx"> 
				<%-- <input type="hidden" value="${cPage}" name="cPage">  --%>
				<input type="button" class="user_button" value="닫기" onclick="user_list('${cPage}')">
			</div>
		</div>
		</div>
<%@include file="../common/footer.jsp"%>
</body>
</html>