<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	.cal_addAll{
		text-align: center;
	}
</style>
<title>일정 추가하기</title>
</head>
<body>
	<div class="cal_addAll">
		<h3>일정 추가하기</h3>
		<form action="calSave" method="post">
		<p>일정 제목 : <input type="text" name="c_title"></p>
		<p>시작 날짜 : <input type="date" name="c_start"></p>
		<p>끝 날짜 : <input type="date" name="c_end"></p>
		<input type="submit" value="추가">
		<input type="hidden" name="contentsid" id="contentsid" value="${param.contentsid}">	
		<input type="reset" value="취소하기">
		</form>
	</div>	
</body>
</html>