<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>LOGIN | Jeju_travel</title>
		<link href="resources/common-css/reset.css" rel="stylesheet" />
		<!-- 파비콘 -->
		<link rel="shortcut icon" href="resources/common-image/favicon.ico" type="image/x-icon">
		<link rel="icon" href="resources/common-image/favicon.ico" type="image/x-icon">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
		<script type="text/javascript">
			function login_ok(f) {
				// 아이디, 비밀번호 입력하지 않을시 경고창
				if (f.u_id.value === '' || f.u_pwd.value === '') {
					alert("입력한 정보를 확인해주세요.");
					return;
				}
				f.action="login_ok.do";
				f.submit();
			}
			
			// 엔터키 활성화
			document.addEventListener('keypress', function(e) {
			    if (e.keyCode === 13) {
			        if (document.activeElement.tagName === 'INPUT') {
			            login_ok(document.activeElement.form);
			        }
			    }
			});
			
			// 경고창
			let msg = "${msg}";
			if (msg !== "") {
			    alert(msg);
			}
		</script>
		<style type="text/css">
			.login_page {
				padding: 8% 0 0;
			  	margin: auto;
			  	width: 100%;
			  	height: 600px;
			  	background-image: url('resources/lsh_images/jeju_island.jpg');
			  	background-position: center;
			  	background-size: cover;
			}
			.login_container {
				position: relative;
			  	z-index: 1;
			  	background: white;
			  	max-width: 360px;
			  	max-height: 450px;
			  	margin: 0 auto 150px;
			  	padding: 45px;
			  	text-align: center;
			  	box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
			  	overflow: auto;
			}
			.login_container::-webkit-scrollbar {
				width: 7px;
			}
			
			.login_container::-webkit-scrollbar-thumb {
				height: 30%;
				background: #a5deeb;
				border-radius: 10px;
			}
			
			.login_container::-webkit-scrollbar-track {
				background: rgba(33, 122, 244, .1);
			}
			.login_box input {
			  	outline: 0;
			  	background: lightgray;
			  	width: 100%;
			  	border: 0;
			  	margin: 0 0 15px;
			  	padding: 15px;
			  	box-sizing: border-box;
			  	font-size: 14px;
			  	border-radius: 10px;
			}
			
			.login_btn {
			  	text-transform: uppercase;
			  	outline: 0;
			  	width: 100%;
			  	border: 0;
			  	padding: 15px;
			  	color: #6c6c6c;
			  	font-size: 14px;
			  	-webkit-transition: all 0.3 ease;
			  	transition: all 0.3 ease;
			  	cursor: pointer;
			  	border-radius: 10px;
			}
			
			.login_btn:hover, .login_btn:active, .login_btn:focus {
				background: #b6dedc;
			}
			
			.login_text{
				padding: 20px;
				font-weight: bold;
			}
			
			.login_sns_btn{
				margin: 10px;
				width: 300px;
				height: 45px;
			}
			
			.login_sns {
				margin-top: 15px;
				text-decoration: none;
				color: #6c6c6c;
			}
			
			.login_find a {
				margin: 15px 0 0 0;
				text-decoration: none;
				color: #6c6c6c;
			}
			
			.login_find {
				margin: o auto;
				margin-top: 15px;
			}
		</style>
	</head>
	<body>
		<%@include file="../common/header.jsp" %>
		<section class="login_page">
			<div class="login_container">
				<form method="post" class="login_form">
					<h3 class="login_text">Login</h3>
					<div class="login_box">
						<ul>
							<li>
								<input type="text" id="u_id" name="u_id" class="login_box_input" placeholder="ID" required />
							</li>
							<li>
								<input type="password" id="u_pwd" name="u_pwd" class="login_box_input" placeholder="Password" required />
							</li>
							<li>
								<input type="button" class="login_btn" value="Login" onclick="login_ok(this.form)" />
							</li>
						</ul>
					</div>
					
					<div class="login_find">
						<a href="findID_go.do" >find your ID &nbsp;&nbsp; | </a>
						<a href="findpwd_go.do" >&nbsp;&nbsp;find your Password</a>
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
						<a href="notification.do">모다알</a>
			</div>
		</section>
		<%@include file="../common/footer.jsp" %>
	</body>
</html>