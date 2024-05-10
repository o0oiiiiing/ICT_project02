<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/common-css/reset.css" rel="stylesheet" />
<title>관리자 장소추가</title>
<style type="text/css">
	.admin_result{
		text-align: center;
    	margin: 135px auto;
    	line-height: 2;
    	width: 50%;
	}
	.admin_result p{
		padding-bottom: 17px;
	}
	.admin_result textarea{
		resize: none;
	}
	.admin_category{
		padding: 10px;
	}
	.admin_input{
		padding: 10px;
	}
</style>
</head>
<body>
<%@include file="../common/header.jsp"%>
	<form action="admin_insert_ok" method="post">
		<div class="admin_result">
		<h3 >장소 추가</h3>
		<br>
		<p>카테고리 : 
			<select class="admin_category" name="vi_value" required>
				<option value="관광지" >관광지</option>
				<option value="쇼핑" >쇼핑</option>
				<option value="숙박" >숙박</option>
				<option value="음식점" >음식점</option>
				<option value="축제" >축제/행사</option>
			</select>
		</p>
		<!-- 중복검사예정 -->
		<p>콘텐츠 ID : <input type="text"  class="admin_input" name="contentsid" required></p>
		<p>장소 이름 : <input type="text"  class="admin_input" name="vi_title" required></p>
		<p>지번 주소 : <input type="text" class="admin_input" name="vi_address" required></p>
		<p>도로명 주소 : <input type="text" class="admin_input" name="vi_roadaddress" required></p>
		<p style="padding-bottom: 7px;">장소 소개 : <textarea rows="4" cols="50" name="vi_intro" required></textarea></p>
		<p>위도 : <input type="text"  class="admin_input" name="vi_latitude" required></p>
		<p>경도 : <input type="text" class="admin_input" name="vi_longitude" required></p>
		<p>전화번호 : <input type="text" class="admin_input" name="vi_phoneno" required></p>
		<p>장소 이미지 링크 : <input type="text" class="admin_input" name="vi_image" required></p>
		<p>장소 썸네일 링크 : <input type="text" class="admin_input" name="vi_thumbnail" required></p>
		<input type="submit" value="추가하기">
		<input type="reset" value="취소">
		</div>
	</form>
	<%@include file="../common/footer.jsp"%>
</body>
</html>