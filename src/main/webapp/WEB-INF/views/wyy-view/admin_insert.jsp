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
	
	function submitForm() {
		if (idChk) {
			$('form').submit();
		} else {
			alert("콘텐츠 ID 중복 확인을 해주세요.");
		}
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

            document.getElementById("sample4_roadAddress").value = roadAddr;
            document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

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

</script>
</head>
<body>
<%@include file="../common/header.jsp"%>
	<form action="admin_insert_ok" method="post" >
		<div class="admin_result">
		<h3 style="margin-bottom: 30px; font-size: 28px; font-weight: bold;">장소 추가</h3>
		<br>
		<div class="name_category">
			<p>카테고리 : </p>
			<p>콘텐츠 ID : </p>
			<p>장소 이름 : </p>
			<p>지번 주소 : </p>
			<p>도로명 주소 : </p>
			<p>장소 소개 : </p>
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
				<input type="text"  class="admin_input" id="contentsid" name="contentsid" required>
				<input type="button" class="join_btn" id="contents_idchk"  value="중복 확인" onclick="id_doublechk()"/>
			</p>
			<p>
				<input type="text"  class="admin_input" name="vi_title" required>
			</p>
			<p>
				<input type="text" class="admin_input" id="sample4_jibunAddress"name="vi_address" required>
				<input type="button" id="input_button" onclick="sample4_execDaumPostcode()" value="주소 찾기">
			</p>
			<p>
				<input type="text" class="admin_input" id="sample4_roadAddress" name="vi_roadaddress" required>
			</p>
			<p>
				<input type="text"  class="admin_input" name="vi_intro" required>
			</p>
			<p>
				<input type="text"  class="admin_input" name="vi_latitude" id="vi_latitude" required>
			</p>
			<p>
				<input type="text" class="admin_input" name="vi_longitude" id="vi_longitude" required>
			</p>
			<p>
				<input type="text" class="admin_input" name="vi_phoneno" required>
			</p>
			<p>
				<input type="text" class="admin_input" name="vi_image" required>
			</p>
			<p>
				<input type="text" class="admin_input" name="vi_thumbnail" required>
			</p>
			<p>
				<input type="button" id="input_submit" value="제출" onclick="submitForm()" >
				<input type="reset" id="input_submit" value="취소" onclick="history.go(-1)">
			</p>
		</div>
		</div>
	</form>
	<%@include file="../common/footer.jsp"%>
</body>
</html>