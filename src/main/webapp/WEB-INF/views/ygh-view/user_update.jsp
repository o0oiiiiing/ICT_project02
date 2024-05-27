<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>USER UPDATE | Jeju_travel</title>
<!-- 파비콘 -->
<link rel="shortcut icon" href="resources/common-image/favicon.ico" type="image/x-icon">
<link rel="icon" href="resources/common-image/favicon.ico" type="image/x-icon">
<link href="<c:url value="/resources/ygh-css/user_update.css"/>" rel='stylesheet' />
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		let pwdchk = "${pwdchk}";
		if (pwdchk == 'fail') {
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}
		
	});
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	//주소 api
	function execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						let addr = ''
						let extraAddr = '';

						if (data.userSelectedType === 'R') {
							addr = data.roadAddress;
						} else {
							addr = data.jibunAddress;
						}

						if (data.userSelectedType === 'R') {
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}

							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}

							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							document.getElementById("u_detail_addr2").value = extraAddr;
						} else {
							document.getElementById("u_detail_addr2").value = '';
						}

						document.getElementById('u_postcode').value = data.zonecode;
						document.getElementById('u_addr').value = addr;
						document.getElementById('u_detail_addr').focus();
					}
				}).open();
	}
	
	// 첨부파일 선택 시 실시간으로 이미지 변경
	function previewImage(event) {
	    const reader = new FileReader();
	    reader.onload = function(){
	        const output = document.getElementById('profile-img');
	        output.src = reader.result;
	    };
	    reader.readAsDataURL(event.target.files[0]);
	}
	
	// 회원정보수정 버튼 클릭 시
	function user_update_ok(f) {
		if (f.u_phone.value.length !== 11) {
			alert("전화번호는 '-'을 제외한 11자리를 입력해 주세요.");
			f.u_phone.focus();
			return false;
		} else if (!/^[\w-]+(?:\.[\w-]+)*@(?:[\w-]+\.)+[a-zA-Z]{2,}$/
				.test(f.u_email.value)) {
			alert("이메일 형식을 확인하세요.");
			f.u_email.focus();
			return false;
		}
		f.action = "user_update_ok.do?u_profile_img=${userVO.u_profile_img}";
		f.submit();
		
	}
	
	// 비밀번호변경
	function repwd_go() {
		location.href = "repwd_go.do";
	}
	
	let msg = "${msg}";
    if (msg !== "") {
        alert(msg);
    }
    
</script>
<style type="text/css">
</style>
</head>
<body>
	<%@include file="../common/header.jsp"%>

		<form method="post" enctype="multipart/form-data">
			<div id="update_wrap">
				<h1>회원정보수정</h1>
			<div id="update_box">
				<table>
					<tbody>
						<tr>
							<th style="vertical-align: top; padding-top: 10px;">프로필</th>
							<td style="display: flex; align-items: center;">
								<img id="profile-img" src="resources/upload/${userVO.u_profile_img}" style="width: 100px; height: 100px; margin-right: 10px;"> 
								<div style="flex-direction: column;">
						            <input type="file" name="file" id="file" onchange="previewImage(event)" style="width: 200px; border:none;">
						            <input type="hidden" name="old_f_name" id="old_f_name" value="${userVO.u_profile_img}">
						        </div>
							</td>
						</tr>
						<tr>
							<th>아이디</th>
							<td><input type="text" name="u_id" id="u_id"
								value="${userVO.u_id}" readonly></td>
						</tr>
						<tr>
							<th>이름</th>
							<td><input type="text" name="u_name" id="u_name"
								value="${userVO.u_name}" readonly></td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td><input type="text" name="u_phone" id="u_phone"
								value="${userVO.u_phone}" title="- 를 제외한 11자리를 입력해 주세요."></td>
						</tr>
						<tr>
							<th>이메일</th>
							<td><input type="email" name="u_email" id="u_email"
								value="${userVO.u_email}"
								pattern="[a-zA-Z0-9]+[@][a-zA-Z0-9]+[.]+[a-zA-Z]+[.]*[a-zA-Z]*"
								title="이메일 양식"></td>
						</tr>
						<tr>
							<th>우편번호</th>
							<td style="display: flex;">
								<input type="text" id="u_postcode" name="u_postcode"
								placeholder="우편번호" value="${userVO.u_postcode}" readonly />
								<input type="button" class="join_btn" onclick="execDaumPostcode()"
								value="우편번호 찾기" id="find_postcode" /></td>
						</tr>
						<tr>
							<th>도로명주소</th>
							<td><input type="text" id="u_addr" name="u_addr"
								placeholder="도로명주소" value="${userVO.u_addr}" readonly /></td>
						</tr>
						<tr>
							<th>상세주소1</th>
							<td><input type="text" id="u_detail_addr"
								name="u_detail_addr" placeholder="상세주소1"
								value="${userVO.u_detail_addr}" /></td>
						</tr>
						<tr>
							<th>상세주소2</th>
							<td><input type="text" id="u_detail_addr2"
								name="u_detail_addr2" placeholder="상세주소2"
								value="${userVO.u_detail_addr2}" readonly /></td>
						</tr>
						<tr>
							<th>비밀번호확인</th>
							<td><input type="password" name="u_pwd" id="u_pwd"></td>
						</tr>
					</tbody>
				</table>
			</div>
				<div class="update_submit">
					<input type="hidden" value="${userVO.u_idx}" name="u_idx">
					<input type="button" id="update_ok" value="저장" onclick="user_update_ok(this.form)"> 
					<input type="button" id="u_pwd" onclick="repwd_go()" value="비밀번호변경">
				</div>
			</div>
		</form>

	<%@include file="../common/footer.jsp"%>
</body>
</html>