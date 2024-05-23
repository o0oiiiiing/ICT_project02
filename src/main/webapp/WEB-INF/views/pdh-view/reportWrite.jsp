<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 작성</title>
</head>
<body>
<!-- 신고 작성하는 영역 -->
	<form id="report_write" method="post" action="reportWrite">
		<div class="qa_write__container" style="height: 430px;">
			<p class="qa_wrtie__title">신고하기</p>
			<div class="qa_write__content">
				<p>
					제목 : <input type="text" name="report_title" id="report_title" placeholder="제목을 입력해주세요.">
				</p>
				<br>
				<textarea name="report_content" id="report_content"
					style="width: 600px; height: 200px; display: block; margin: 0 auto;"
					placeholder="내용을 입력해주세요."></textarea>
				<div id="charCount2">0/500</div>
			</div>
			<div class="qa_write__buttons">
				<input type="hidden" value="${userVO.u_idx}" name="u_idx">
				<input type="hidden" value="${userVO.u_name}" name="report_writer">
				<input type="hidden" value="" name="re_idx" class="reIdx">
				<input type="hidden" value="" name="m_idx" class="mIdx">
				<input class="review_write__button" type="reset" value="취소">
				<button type="button" class="review_write__button" onclick="reportWrite(this.form)">등록</button>
			</div>
		</div>
	</form>
</body>
</html>