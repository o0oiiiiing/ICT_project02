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
	function user_list() {
		location.href="user_list.do";
	}
</script>
</head>
<body>
<%@include file="../common/header.jsp"%>

	 <div id="user_detail">
		<div class="user_container">
			<div class="user_content">
				<table style="margin: auto;">
				<caption>회원정보</caption>
					<tbody>
						<tr><td style="width: 40%">아이디</td><td>${uvo.u_id}</td></tr>
						<tr><td>이름</td><td>${uvo.u_name}</td></tr>
						<tr><td>생년월일</td><td>${uvo.u_birth}</td></tr>
						<tr><td>이메일</td><td>${uvo.u_email}</td></tr>
						<tr><td>전화번호</td><td>${uvo.u_phone}</td></tr>
						<tr><td>우편번호</td><td>${uvo.u_postcode}</td></tr>
						<tr><td>주소</td><td>${uvo.u_addr}</td></tr>
						<tr><td>상세주소</td><td>${uvo.u_detail_addr}</td></tr>
						<tr><td>상세주소2</td><td>${uvo.u_detail_addr2}</td></tr>
						<tr><td>성별</td><td>${uvo.u_gender}</td></tr>
						<tr><td>신고누적</td><td>${uvo.u_report}</td></tr>
						<tr><td>가입일</td><td>${uvo.u_regdate.substring(0,10)}</td></tr>
						<tr><td>탈퇴일</td><td>${uvo.out_regdate.substring(0,10)}</td></tr>
						<tr><td>탈퇴사유</td><td>${uvo.u_del}</td></tr>
						<tr><td>복구일</td><td>${uvo.re_regdate}</td></tr>
						<tr><td>복구사유</td><td>${uvo.u_restore}</td></tr>
					</tbody>
				</table>
			</div>
			<div class="user_buttons">
				<input type="hidden" value="${k.u_idx}" name="u_idx"> 
				<input type="hidden" value="${paging.nowPage}" name="cPage"> 
				<input type="button" class="user_button" value="닫기" onclick="user_list()">
			</div>
		</div>
		</div>
<%@include file="../common/footer.jsp"%>
</body>
</html>