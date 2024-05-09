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
		<%@include file="../common/header.jsp" %>
		<section>
			<div class="login_box">
				<form method="post">
					<h3>로그인</h3>
					<div>
						<ul>
							<li>
								<input type="text"  id="u_id" name="u_id" placeholder="아이디" required>
							</li>
							<li>
								<input type="password" id="u_pwd" name="u_pwd" placeholder="비밀번호" required>
							</li>
							<li>
								<input type="button" value="로그인" onclick="login_ok(this.form)">
							</li>
						</ul>
					</div>
					
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
					
					<div>
						<a href="https://kauth.kakao.com/oauth/authorize?client_id=b3c8cdc497ebc0c70d13c3383ee0f676&redirect_uri=http://localhost:8090/kakao_login.do&response_type=code">
							<img src="resources/images/kakao_login_medium_narrow.png" width="160px">
						</a>
						<a href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=J3r3NWMEm1CJS2vNYtQm&state=STATE_STRING&redirect_uri=http://localhost:8090/naver_login.do">
							<img src="resources/images/btnG.png" width="150px">
						</a>
					</div>
					
					
					<%-- 
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
						
							카카오 REST API : b3c8cdc497ebc0c70d13c3383ee0f676
							RedirectURL : http://localhost:8090/kakao_login.do 
						
						<a href="https://kauth.kakao.com/oauth/authorize?client_id=b3c8cdc497ebc0c70d13c3383ee0f676&redirect_uri=http://localhost:8090/kakao_login.do&response_type=code">
							<img src="resources/images/kakao_login_medium_narrow.png" width="160px">
						</a>
						
							client id : J3r3NWMEm1CJS2vNYtQm
							client secret : YpYaVN0u1m
						
						<a href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=J3r3NWMEm1CJS2vNYtQm&state=STATE_STRING&redirect_uri=http://localhost:8090/naver_login.do">
							<img src="resources/images/btnG.png" width="150px">
						</a>
					</div>
					 --%>
				</form>
			</div>
		</section>
		<%@include file="../common/footer.jsp" %>
	</body>
</html>