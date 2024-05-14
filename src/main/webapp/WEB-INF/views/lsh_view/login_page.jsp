<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>로그인</title>
		<link href="resources/common-css/reset.css" rel="stylesheet" />
		<link href="resources/lsh_css/login_page.css" rel="stylesheet" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
		<script type="text/javascript">
			function login_ok(f) {
				if (f.u_id.value === '' || f.u_pwd.value === '') {
					alert("다시 입력하세요");
					return;
				}
				f.action="login_ok.do";
				f.submit();
			}
			// 경고창
			let msg = "${msg}";
			if (msg !== "") {
			    alert(msg);
			}
		</script>
	</head>
	<body>
		<%@include file="../common/header.jsp" %>
		<section class="login_page">
			<div class="login_box">
				<form method="post" class="login_form">
					<h3 class="login_text">Login</h3>
					<div>
						<ul>
							<li>
								<input type="text" id="u_id" name="u_id" class="login_box_input" placeholder="아이디" required />
							</li>
							<li>
								<input type="password" id="u_pwd" name="u_pwd" class="login_box_input" placeholder="비밀번호" required />
							</li>
							<li>
								<input type="button" class="login_btn" value="로그인" onclick="login_ok(this.form)" />
							</li>
						</ul>
					</div>
					
					<div class="login_find">
						<a href="findID_go.do" >아이디 찾기 &nbsp;&nbsp; | </a>
						<a href="findpwd_go.do" >비밀번호 찾기</a>
					</div>
					
					<div class="login_sns">
						<a href="https://kauth.kakao.com/oauth/authorize?client_id=b3c8cdc497ebc0c70d13c3383ee0f676&redirect_uri=http://localhost:8090/kakao_login.do&response_type=code">
							<img src="resources/lsh_images/kakao_login.png" class="login_sns_btn" />
						</a>
						<a href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=J3r3NWMEm1CJS2vNYtQm&state=STATE_STRING&redirect_uri=http://localhost:8090/naver_login.do">
							<img src="resources/lsh_images/naver_login.png" class="login_sns_btn" />
						</a>
					</div>
					<div class="login_find">
						<a href="admin_login.do">관리자로그인</a>
					</div>
				</form>
			</div>
		</section>
		<%@include file="../common/footer.jsp" %>
	</body>
</html>