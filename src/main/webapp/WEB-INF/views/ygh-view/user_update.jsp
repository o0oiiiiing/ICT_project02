<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원정보수정</title>
<link href="<c:url value="/resources/ygh-css/user_update.css"/>" rel='stylesheet' />
<link href="<c:url value="/resources/pdh-css/home.css"/>" rel='stylesheet' />
<link href="<c:url value="resources/common-css/footer.css"/>" rel='stylesheet' />
<script type="text/javascript">
	function repwd_go() {
		location.href = "repwd_go.do";
	}
</script>
</head>
<body>


	<div id="update_wrap">
		<form method="post">
			<h1>회원정보수정</h1>
			<div id="update_box">
				아이디<input type="text" name="u_id" id="u_id" readonly><br> 
				이름<input type="text" name="u_id" id="u_id" readonly><br> 
				전화번호<input type="text" name="u_id" id="u_id" title="- 를 제외한 11자리를 입력해 주세요."><br> 
				이메일<input type="text" name="u_id" id="u_id"  
				pattern="[a-zA-Z0-9]+[@][a-zA-Z0-9]+[.]+[a-zA-Z]+[.]*[a-zA-Z]*" title="이메일 양식" ><br> 
				
				주소
				<input type="text" id="zip_code" name="zip_code" placeholder="우편번호" required readonly /> 
				<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기" /> <br> 
				<input type="text" id="roadAddr" name="roadAddr" placeholder="도로명주소" style="width: 500px" readonly /><br> 
				<input type="text" id="jibunAddr" name="jibunAddr" placeholder="지번주소" style="width: 500px" readonly /><br>
				<input type="text" id="addrDetail" name="addrDetail" placeholder="상세주소" style="width: 500px" />
			</div>
			<input type="submit" id="update_ok" value="저장" onclick="">
		</form>
			<button id="repwd_go" onclick="repwd_go()">비밀번호변경</button>
	</div>


</body>
</html>