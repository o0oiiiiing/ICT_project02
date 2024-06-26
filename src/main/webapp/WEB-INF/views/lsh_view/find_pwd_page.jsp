<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>FIND_PW | Jeju_travel</title>
		<!-- 파비콘 -->
		<link rel="shortcut icon" href="resources/common-image/favicon.ico" type="image/x-icon">
		<link rel="icon" href="resources/common-image/favicon.ico" type="image/x-icon">
		<link href="resources/common-css/reset.css" rel="stylesheet" />
		<link href="resources/lsh_css/find_pwd.css" rel="stylesheet" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
		<script type="text/javascript">
			let msg = "${msg}";
			if (msg !== "") {
				alert(msg);
			}
			
			function back() {
				window.history.back();
			}
		</script>
		<style type="text/css">
			.find_pwd_page {
				padding: 8% 0 0;
			  	margin: auto;
			  	width: 100%;
			  	height: 600px;
			  	background-image: url('resources/lsh_images/jeju_island.jpg');
			  	background-position: center;
			  	background-size: cover;
			  	font-family: 'NanumSquare';
			}
			.find_pwd_container {
				position: relative;
			  	z-index: 1;
			  	background: white;
			  	max-width: 360px;
			  	max-height: 450px;
			  	margin: 0 auto 150px;
			  	padding: 45px;
			  	text-align: center;
			  	box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
			}
		</style>
	</head>
	<body>
		<%@include file="../common/header.jsp" %>
		<section class="find_pwd_page">
			<div class="find_pwd_container">
				<form action="find_pwd_go.do" method="post">
				<h3 class="find_pwd_text">비밀번호 찾기</h3>
					<div class="find_pwd_box">
						<ul>
							<li>
								<input type="text" name="u_id" placeholder="ID" />
							</li>
							<li>
								<input type="email" name="u_email" placeholder="E-Mail" pattern="[a-zA-Z0-9]+[@][a-zA-Z0-9]+[.]+[a-zA-Z]+[.]*[a-zA-Z]*" />
							</li>
							<li>
								<input type="submit" class="find_pwd_btn" value="Send to your E-Mail" />
							</li>
							<li>
								<input type="button" class="find_pwd_btn" onclick="back()" value="Cancel">
							</li>
						</ul>
					</div>
					<div class="find_pwd_link_box">
						<a href="login_go.do" >Login &nbsp; &nbsp;</a> 
					</div>
				</form>
			</div>
		</section>
		<%@include file="../common/footer.jsp" %>
	</body>
</html>