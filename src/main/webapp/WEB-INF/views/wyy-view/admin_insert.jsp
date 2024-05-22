<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- 파비콘 -->
<link rel="shortcut icon" href="resources/common-image/favicon.ico" type="image/x-icon">
<link rel="icon" href="resources/common-image/favicon.ico" type="image/x-icon">
<link href="resources/common-css/reset.css" rel="stylesheet" />
<link href="resources/wyy-css/admin_insert.css" rel="stylesheet" />
<!-- 다음 주소 api  -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 카카오 api -->
<script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=9b1dad637e1ccb6b94f973b276b012bd&libraries=services"></script>
<title>ADMIN | Jeju_travel</title>
<script type="text/javascript">
	
	let idChk = false;
	//아이디 중복 여부
	function id_doublechk() {
		$.ajax({
			url : "idCheck",
			data : "contentsid="+$("#contentsid").val(), 
			method : "post", 	
			dataType : "text",
			success : function(data) {
				if (data === '1') {
					alert("사용 가능");
					idChk = true;
				} else if (data === '0') {
					alert("동일한 콘텐츠 ID가 있습니다.");
					idChk = false;
				}
			},
			error : function() {
				alert("읽기 실패");
				idChk = false;
			}
		});
		return false;
	}

	// 유효성검사
 	function submitForm(f) {
		if (f.contentsid === '' || f.contents_idchk === '' || f.vi_title === ''|| f.vi_intro === '' || f.vi_address === '' 
				|| f.vi_phoneno === ''|| f.vi_image === ''|| f.vi_thumbnail === '') {
			alert("필수 항목을 입력하세요.");
			return false;
		} else if (f.contentsid.value === '') {
			alert("콘텐츠ID를 입력하세요.");
			f.contentsid.focus();
			return false;
		} else if (!idChk) {
			alert("콘텐츠ID 중복 확인을 해주세요.");
			f.contents_idchk.focus();
	        return false;
		} else if (f.vi_title.value === '') {
			alert("장소이름을 입력하세요.");
			f.vi_title.focus();
			return false;
		} else if (f.vi_intro.value === '') {
			alert("장소소개를 입력하세요.");
			f.vi_intro.focus();
			return false;
		} else if (f.vi_address.value === '') {
			alert("주소 찾기 버튼을 이용해주세요.");
			f.input_button.focus();
			return false;
		} else if (f.vi_phoneno.value.length !== 11) {
			alert("전화번호는  '-'을 제외한 11자리로 입력하세요.");
			f.vi_phoneno.focus();
			return false;
		} else if (f.vi_image.value === '') {
			alert("장소 이미지 링크를 입력하세요.");
			f.vi_image.focus();
			return false;
		} else if (f.vi_thumbnail.value === '') {
			alert("장소 썸네일 링크를 입력하세요.");
			f.vi_thumbnail.focus();
			return false;
		}
		f.submit();
		alert("추가되었습니다.")
	} 
</script>
<script>
    function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var roadAddr = data.roadAddress; 
            var extraRoadAddr = ''; 

            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            if(data.buildingName !== '' && data.apartment === 'Y'){
                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            document.getElementById("vi_roadaddress").value = roadAddr;
            document.getElementById("vi_address").value = data.jibunAddress;

            // 위도경도 가지고오는 함수 호출
            getAddressCoordinates(roadAddr);
        }
    }).open();
}

function getAddressCoordinates(address) {
    // 카카오맵 Geocoding API 사용
    var geocoder = new kakao.maps.services.Geocoder();
    geocoder.addressSearch(address, function(result, status) {
        if (status === kakao.maps.services.Status.OK) {
            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
            document.getElementById("vi_latitude").value = coords.getLat(); // 위도
            document.getElementById("vi_longitude").value = coords.getLng(); // 경도
        } else {
            alert('주소를 변환할 수 없습니다: ' + status);
        }
    });
}
function checkInput() {
    var contentsidInput = document.getElementById("contentsid");
    var contentsIdCheckBtn = document.getElementById("contents_idchk");

    if (contentsidInput.value.trim() === "") {
        contentsIdCheckBtn.disabled = true;
    } else {
        contentsIdCheckBtn.disabled = false;
    }
}
</script>

</head>
<body>
<%@include file="../common/header.jsp"%>

	<div id="menubar">
		<h1>나의 여행(관리자)</h1>
		<table>
			<tr>
				<td>아이콘</td>
				<td>아이콘</td>
				<td>아이콘</td>
				<td>아이콘</td>
				<td>아이콘</td>
			</tr>
			<tr>
				<td><a href="dashboard.do">대시보드</a></td>
				<td><a href="user_list.do">회원관리</a></td>
				<td><a href="admin_list.do">Q&A</a></td>
				<td><a href="admin_list.do">신고</a></td>
				<td><a href="admin_insert">일정 추가</a></td>
				
				<c:if test="${adminVO.a_status == '1'}">
					<td><a href="admin_join.do">관리자 생성</a></td>
				</c:if>
			</tr>
		</table>
	</div>
	
	<form action="admin_insert_ok" method="post" >
		<div class="admin_result">
		<h3>장소 추가</h3>
		<br>
		<div class="name_category">
			<p>카테고리 : </p>
			<p>콘텐츠 ID : </p>
			<p>장소 이름 : </p>
			<p>장소 소개 : </p>
			<br>
			<p>지번 주소 : </p>
			<p>도로명 주소 : </p>
			<p>위도 : </p>
			<p>경도 : </p>
			<p>전화번호 : </p>
			<p>장소 이미지 링크 : </p>
			<p>장소 썸네일 링크 : </p>
		</div>
		<div class="input_category">
			<p>
				<select class="admin_category" name="vi_value" required>
					<option value="관광지" >관광지</option>
					<option value="쇼핑" >쇼핑</option>
					<option value="숙박" >숙박</option>
					<option value="음식점" >음식점</option>
					<option value="축제" >축제/행사</option>
				</select>
			</p>
			<p>
				<input type="text"  class="admin_input" id="contentsid" name="contentsid" required oninput="checkInput()">
				<input type="button" class="join_btn" id="contents_idchk"  name="contents_idchk" value="중복 확인" onclick="id_doublechk()" disabled/>
			</p>
			<p>
				<input type="text"  class="admin_input" id= "vi_title" name="vi_title" required>
			</p>
			<p>
				<input type="text"  class="admin_input" id="vi_intro" name="vi_intro" required >
			</p>
			<p>
				<input type="button" id="input_button" name="input_button" onclick="sample4_execDaumPostcode()" value="주소 찾기">
				<input type="text" class="admin_input" id="vi_address"name="vi_address" required readonly>
			</p>
			<p>
				<input type="text" class="admin_input" id="vi_roadaddress" name="vi_roadaddress" required readonly>
			</p>
			<p>
				<input type="text"  class="admin_input" name="vi_latitude" id="vi_latitude" required readonly>
			</p>
			<p>
				<input type="text" class="admin_input" name="vi_longitude" id="vi_longitude" required readonly>
			</p>
			<p>
				<input type="text" class="admin_input" id = "vi_phoneno" name="vi_phoneno" required>
			</p>
			<p>
				<input type="text" class="admin_input" id="vi_image" name="vi_image" required>
			</p>
			<p>
				<input type="text" class="admin_input" id="vi_thumbnail" name="vi_thumbnail" required>
			</p>
			<p>
				<input type="button" id="input_submit" value="제출" onclick="submitForm(this.form)" >
				<input type="button" id="input_submit" value="취소" onclick="history.go(-1)">
			</p>
		</div>
		</div>
	</form>
	<%@include file="../common/footer.jsp"%>
</body>
</html>