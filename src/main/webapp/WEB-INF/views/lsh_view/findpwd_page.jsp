<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>비밀번호 찾기</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
		<script type="text/javascript">
			let msg = "${msg}";
			if (msg !== "") {
				alert(msg);
			}
		</script>
	</head>
	<body>
		<%@include file="../common/header.jsp" %>
		<section>
			<div>
				<form method="post" action="email_send_ok.do">
				<h3>비밀번호 찾기</h3>
				<div>
					<ul>
						<li>
							<input type="text" name="u_id" placeholder="아이디를 입력하세요">
						</li>
						<li>
							<input type="email" name="u_email" placeholder="이메일을 입력하세요" pattern="[a-zA-Z0-9]+[@][a-zA-Z0-9]+[.]+[a-zA-Z]+[.]*[a-zA-Z]*">
						</li>
						<li>
							<input type="submit" value="임시 비밀번호 발급 받기">
						</li>
					</ul>
				</div>
				
				
				
				<!-- 
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
									<input type="submit" value="임시 비밀번호 발급 받기">
								</td>
							</tr>
						</tbody>
					</table>
					 -->
					
				</form>
			</div>
		</section>
		<%@include file="../common/footer.jsp" %>
	</body>
</html>