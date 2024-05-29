<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>ADMIN | Jeju_travel</title>
		<!-- 파비콘 -->
		<link rel="shortcut icon" href="resources/common-image/favicon.ico" type="image/x-icon">
		<link rel="icon" href="resources/common-image/favicon.ico" type="image/x-icon">
		<link href="resources/common-css/reset.css" rel="stylesheet" />
		<link href="resources/lsh_css/admin_login.css" rel="stylesheet" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
		<script type="text/javascript">
			function admin_login_ok(f) {
				if (f.a_id.value === '' || f.a_pwd.value === '') {
					alert("다시 입력하세요");
					return;
				}
				f.action="admin_login_ok.do";
				f.submit();
			}
			
			// 엔터키 활성화
			document.addEventListener('keypress', function(e) {
			    if (e.keyCode === 13) {
			        if (document.activeElement.tagName === 'INPUT') {
			        	admin_login_ok(document.activeElement.form);
			        }
			    }
			});
			
			// 경고창
			let msg = "${msg}";
			if (msg !== "") {
			    alert(msg);
			}
			function back() {
				window.history.back();
			}
		</script>
		<style type="text/css">
			.admin_login_page {
				padding: 8% 0 0;
			  	margin: auto;
			  	width: 100%;
			  	height: 600px;
			  	background-image: url('resources/lsh_images/jeju_island.jpg');
			  	background-position: center;
			  	background-size: cover;
			  	font-family: 'NanumSquare';
			}
			.admin_login_box {
				position: relative;
			  	z-index: 1;
			  	background: white;
			  	max-width: 360px;
			  	height: 450px;
			  	margin: 0 auto 150px;
			  	padding: 45px;
			  	text-align: center;
			  	box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
			  	overflow: auto;
			}
		</style>
	</head>
	<body>
		<%@include file="../common/header.jsp" %>
		<section class="admin_login_page">
			<div class="admin_login_box">
				<form method="post" class="login_form">
					<h3 class="admin_login_text">ADMIN | Login</h3>
					<div>
						<ul>
							<li>
								<input type="text"  id="a_id" name="a_id" placeholder="ID" required>
							</li>
							<li>
								<input type="password" id="a_pwd" name="a_pwd" placeholder="Password" required>
							</li>
							<li>
								<input type="button" class="admin_login_btn" value="Login" onclick="admin_login_ok(this.form)">
							</li>
							<li>
								<input type="button" class="admin_login_btn" onclick="back()" value="Cancel" />
							</li>
						</ul>
					</div>
				</form>
			</div>
		</section>
		<%@include file="../common/footer.jsp" %>
	</body>
</html>