<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>로그인</title>
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
		<section>
			<div class="login_box">
				<form method="post">
					<table>
						<thead class="login_header">
							<tr>
								<td>로그인</td>
							</tr>
						</thead>
						<tbody class="login_body">
							<tr>
								<td>
									<input type="text"  id="u_id" name="u_id" placeholder="아이디" required>
								</td>
								<td>
									<input type="password" id="u_pwd" name="u_pwd" placeholder="비밀번호" required>
								</td>
								<td>
									<input type="button" value="로그인" onclick="login_ok(this.form)">
								</td>
							</tr>
						</tbody>
					</table>
					
					<div class="anyitems_box">
						<a href="findID_go.do">아이디 찾기</a> | 
						<a href="findpwd_go.do">비밀번호 찾기</a> &nbsp;&nbsp;&nbsp;
						<c:choose>
							<c:when test="${loginChk == 'ok'}">
								<span>${userVO.u_name}님 환영합니다.</span>
								<a href="logout_go.do">로그아웃</a> 
							</c:when>
						</c:choose>
					</div>
					
					<div class="sns_login_box">
						<%-- 
							카카오 REST API : b3c8cdc497ebc0c70d13c3383ee0f676
							RedirectURL : http://localhost:8090/kakao_login.do 
						--%>
						<a href="https://kauth.kakao.com/oauth/authorize?client_id=b3c8cdc497ebc0c70d13c3383ee0f676&redirect_uri=http://localhost:8090/kakao_login.do&response_type=code">
							<img src="resources/images/kakao_login_medium_narrow.png" width="160px">
						</a>
						<%-- 
							아직 안됨 네이버 안해놨슴
							네이버 클라이언트 아이디 : i3iG6_9k8h7tam0e8JLn 
							클라이언트 시크릿 : nPGni9yRqK 
							RedirectURL : http://localhost:8090/kakao_login.do
						--%>
						<a href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=i3iG6_9k8h7tam0e8JLn&state=STATE_STRING&redirect_uri=http://localhost:8090/naver_login.do">
							<img src="resources/images/btnG.png" width="150px">
						</a>
					</div>
				</form>
			</div>
		</section>
		<div id="kakao_loginChk"></div>
	</body>
</html>