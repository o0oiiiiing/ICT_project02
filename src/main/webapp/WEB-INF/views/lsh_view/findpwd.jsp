<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>비밀번호 찾기</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	</head>
	<body>
		<section>
			<div>
				<form method="post" action="email_send_ok.do">
					<table>
						<thead>
							<tr>
								<td>비밀번호 찾기</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<input type="text" name="u_id" placeholder="아이디를 입력하세요">
								</td>
								<td>
									<input type="email" name="u_email" placeholder="이메일을 입력하세요" pattern="[a-zA-Z0-9]+[@][a-zA-Z0-9]+[.]+[a-zA-Z]+[.]*[a-zA-Z]*">
								</td>
								<td>
									<input type="submit" value="임시 비밀번호 발급">
								</td>
							</tr>
						</tbody>
					</table>
					<div>
						<a href="login_go.do">로그인</a>
					</div>
				</form>
			</div>
		</section>
	</body>
</html>