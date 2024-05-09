<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>회원가입</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
		<script type="text/javascript">
			function back() {
				window.history.back();
			}
			function double_chk(f) {
				f.action = "double_chk.do";
				f.submit();
			}
			
			// 아이디 중복 여부
			let idChk = false;
			function id_doublechk() {
				$.ajax({
					url : "id_doublechk.do",
					data : "u_id="+$("#u_id").val(), 
					method : "post", 	
					dataType : "text",
					success : function(data) {
						if (data === '1') {
							alert("사용 가능");
							idChk = true;
						} else if (data === '0') {
							alert("사용 불가능");
							idChk = false;
						}
					},
					error : function() {
						alert("읽기 실패");
						idChk = false;
					}
				});
			}
			
			// 비밀번호 확인
			function pwdchk_go() {
				let u_pwd = document.getElementById('u_pwd');
				let u_pwdchk = document.getElementById('u_pwdchk');
				let msg = document.getElementById('msg');
				
				let ok = "green";	
				let no = "red";
				if (u_pwd.value == u_pwdchk.value) {
					msg.style.color = ok;
					msg.innerHTML = "비밀번호가 일치합니다."
				} else {
					msg.style.color = no;
					msg.innerHTML = "비밀번호가 일치하지 않습니다."
				}
			}
			
			// 약관 전체 동의 확인필요
			function terms_box() {
				let clickAll = document.getElementById('click_all');
				let clickItem = document.querySelectorAll('.click_item');

				clickItem.forEach(function(item) {
					item.checked = clickAll.checked;
				});
			}
			
			// 개별 동의 확인필요
			function terms_click() {
				let clickAll = document.getElementById('click_all');
				let clickItem = document.querySelectorAll('.click_item');
				let allChecked = true;
				// .click_item 체크박스 중 하나라도 해제되면 전체 해제
				clickItem.forEach(function(item) {
					if (! item.checked) {
						allChecked = false;
					}
				});
				clickAll.checked = allChecked;
			}
			
			// 유효성검사
			function join_ok(f) {
				if (f.u_id === '' || f.u_pwd === '' || f.u_pwdchk === '' || f.u_name === '' || f.u_birth === '' || 
						f.u_email === '' || f.u_phone === '' || f.u_addr === '' || f.u_detail_addr === '') {
					alert("필수 항목을 입력하세요.");
					return false;
				} else if (! f.click_1.checked) {
					alert("필수 이용 약관1에 동의해주세요.");
					f.click_1.focus();
					return false;
				} else if (! f.click_2.checked) {
					alert("필수 이용 약관2에 동의해주세요.");
					f.click_2.focus();
					return false;
				} else if (! idChk) {
					alert("아이디 중복 확인을 해주세요.");
					f.idChk.focus();
			        return false;
				} else if (f.u_birth.value === '') {
					alert("생년월일 입력하세요.");
					f.u_birth.focus();
					return false;
				} else if (f.u_phone.value.length !== 11) {
					alert("전화번호는  '-'을 제외한 11자리로 입력하세요.");
					f.u_phone.focus();
					return false;
				} else if (!/^[\w-]+(?:\.[\w-]+)*@(?:[\w-]+\.)+[a-zA-Z]{2,}$/.test(f.u_email.value)) {
					alert("이메일 형식을 확인하세요.");
					return false;
				}
				f.action = "join_ok.do";
				f.submit();
			}
			
			function chk_disabled() {
				let u_id = document.getElementById('u_id').value;
				let u_idchk = document.getElementById('u_idchk');
				if (u_id === '') {
					u_idchk.disabled = true;
				} else {
					u_idchk.disabled = false;
				}
			}
			window.onload = function() {
				chk_disabled(); 
		        document.getElementById("u_id").addEventListener("input", chk_disabled);
		    };
		</script>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script type="text/javascript">
			// 주소 api
			function execDaumPostcode() {
				new daum.Postcode({
					oncomplete : function(data) {
						let addr = ''
						let extraAddr = '';
		
						if (data.userSelectedType === 'R') {
							addr = data.roadAddress;
						} else {
							addr = data.jibunAddress;
						}
		
						if (data.userSelectedType === 'R') {
							if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							
							if (data.buildingName !== '' && data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							document.getElementById("u_detali_addr2").value = extraAddr;
						} else {
							document.getElementById("u_detali_addr2").value = '';
						}
						
						document.getElementById('u_postcode').value = data.zonecode;
						document.getElementById('u_addr').value = addr;
						document.getElementById('u_detali_addr').focus();
					}
				}).open();
			}
		</script>
	</head>
	<body>
		<%@include file="../common/header.jsp" %>
		<section>
			<form method="post">
				<div class="join_box1">
				<h3>회원가입</h3>
				<div>
					<ul>
						<li>
							<span>아이디 *</span>
							<input type="text"  id="u_id" name="u_id" required />
							<input type="button" id="u_idchk"  value="중복 확인" onclick="id_doublechk()" disabled />
						</li>
						<li>
							<span>비밀번호 *</span>
							<input type="password" id="u_pwd" name="u_pwd" required />
						</li>
						<li>
							<span>비밀번호 확인 *</span>
							<input type="password" id="u_pwdchk" name="u_pwdchk" required oninput="pwdchk_go()" />
							<span id="msg" ></span>
						</li>
						<li>
							<span>이름 *</span>
							<input type="text" id="u_name" name="u_name" required />
						</li>
						<li>
							<span>생년월일 *</span>
							<input type="date" id="u_birth" name="u_birth" required />
						</li>
						<li>
							<span>성별 *</span>
							<input type="radio" name="u_gender" value="1" checked /> 남자
							<input type="radio" name="u_gender" value="2" /> 여자
						</li>
						<li>
							<span>이메일 *</span>
							<input type="email" id="u_email" name="u_email" required 
										pattern="[a-zA-Z0-9]+[@][a-zA-Z0-9]+[.]+[a-zA-Z]+[.]*[a-zA-Z]*"/>
						</li>
						<li>
							<span>전화번호 *</span>
							<input type="number" id="u_phone" name="u_phone" required />
						</li>
						<li>
							<span>주소 *</span>
							<input type="text" id="u_postcode" name="u_postcode" placeholder="우편번호">
							<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기">
							<input type="text" id="u_addr" name="u_addr">
							<input type="text" id="u_detail_addr" name="u_detail_addr" placeholder="상세주소1">
							<input type="text" id="u_detail_addr2" name="u_detail_addr2" placeholder="상세주소2">
						</li>
					</ul>
				</div>
				
				
				
				<!-- 
					<table>
						<thead class="join_header">
							<tr>
								<td>회원가입</td>
							</tr>
						</thead>
						<tbody class="join_body">
							<tr>
								<td>
									<label>아이디</label>
									<input type="text"  id="u_id" name="u_id" required />
									<input type="button" id="u_idchk"  value="중복 확인" onclick="id_doublechk()" disabled />
								</td>
								
								<td>
									<label>비밀번호</label>
									<input type="password" id="u_pwd" name="u_pwd" required />
								</td>
								
								<td>
									<label>비밀번호 확인</label>
									<input type="password" id="u_pwdchk" name="u_pwdchk" required oninput="pwdchk_go()" />
									<span id="msg" ></span>
								</td>
								
								<td>
									<label>이름</label>
									<input type="text" id="u_name" name="u_name" required />
								</td>
								
								<td>
									<label>생년월일</label>
									<input type="date" id="u_birth" name="u_birth" required />
								</td>
								
								<td>
									<label>성별</label>
									<input type="radio" name="u_gender" value="1" checked /> 남자
									<input type="radio" name="u_gender" value="2" /> 여자
								</td>
								
								<td>
									<label>이메일</label>
									<input type="email" id="u_email" name="u_email" required 
										pattern="[a-zA-Z0-9]+[@][a-zA-Z0-9]+[.]+[a-zA-Z]+[.]*[a-zA-Z]*"/>
								</td>
								
								<td>
									<label>전화번호</label>
									<input type="number" id="u_phone" name="u_phone" required />
								</td>
								
								<td>
									<label>주소</label>
									<input type="text" id="u_postcode" name="u_postcode" placeholder="우편번호">
									<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기">
									<input type="text" id="u_addr" name="u_addr">
									<input type="text" id="u_detail_addr" name="u_detail_addr" placeholder="상세주소1">
									<input type="text" id="u_detail_addr2" name="u_detail_addr2" placeholder="상세주소2">
								</td>
							</tr>
						</tbody>
					</table> -->
				</div>
				
				<div class="join_box2">
					<table>
						<tr>
							<th >
								<input type="checkbox" id="click_all" onclick="terms_box()"> 
								<label for="click_all">이용약관 전체 동의</label>
							</th>
						</tr>
		
						<tr>
							<td>
								<p>[필수] 이용약관1 동의</p> 
								<div class="terms_box">
									<p>필수 동의임</p> 
								</div>
								<input type="checkbox" id="click_1" onclick="terms_click()" class="click_item">
								<label for="click_1">동의</label>
							</td>
						</tr>
						<tr>
							<td>
								<p>[필수] 이용약관2 동의</p>
								<div class="terms_box">
									<p>필수 동의임</p>
								</div>
								<input type="checkbox" id="click_2" onclick="terms_click()" class="click_item">
								<label for="click_2">동의</label>
							</td>
						</tr>
						<tr>
							<td>
								<p>[선택] 광고 수신 동의</p>
								<div class="terms_box">
									<p>선택 동의임</p>
								</div>
								<input type="checkbox" id="click_3" onclick="terms_click()" class="click_item">
								<label for="click_3">동의</label>
							</td>
						</tr>
					</table>
				</div>
				
				<div class="joinOK_box">
					<input type="button" onclick="join_ok(this.form)" value="가입하기">
					<input type="button" onclick="back()" value="취소">
				</div>
			</form>
		</section>
		<%@include file="../common/footer.jsp" %>
	</body>
</html>