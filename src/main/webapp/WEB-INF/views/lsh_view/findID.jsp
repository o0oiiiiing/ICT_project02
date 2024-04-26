<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>아이디 찾기</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
		<script type="text/javascript">
			function findID_go(f) {
				f.action="findID_go.do";
				f.submit();
			}
		</script>
	</head>
	<body>
		<section>
			<div>
				<form method="post">
					<table>
						<thead>
							<tr>
								<td>아이디 찾기</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<input type="text" name="u_name" placeholder="이름을 입력하세요">
								</td>
								<td>
									<input type="email" name="u_email" placeholder="이메일을 입력하세요"  pattern="[a-zA-Z0-9]+[@][a-zA-Z0-9]+[.]+[a-zA-Z]+[.]*[a-zA-Z]*">
								</td>
								<td>
									<input type="submit" value="아이디 찾기" onclick="findID_go(this.form)">
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
			
			<div>
				<p>아이디 찾기 결과</p>
				<input type="text" name="u_id" value="${userVO.u_id}">
			</div>
			
			<div>
				<a href="login_go.do">로그인</a> | 
				<a href="findpwd_go.do">비밀번호 찾기</a>
			</div>
		</section>
	</body>
</html>


