<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성</title>
</head>
<body>
<!-- 리뷰 작성하는 영역 -->
	<form id="review_write" method="post" action="reviewWrite"
		enctype="multipart/form-data">
		<div class="qa_write__container" style="height: 510px;">
			<p class="qa_wrtie__title">리뷰 작성</p>
			<p style="font-family: 'NanumSquare'; text-align: center;">별점을
				입력해주세요.</p>
			<div class="qa_write__content">
				<fieldset>
					<input type="radio" name="re_grade" value="5" id="rate1"><label for="rate1">★</label> 
					<input type="radio" name="re_grade" value="4" id="rate2"><label for="rate2">★</label>
					<input type="radio" name="re_grade" value="3" id="rate3"><label for="rate3">★</label>
					<input type="radio" name="re_grade" value="2" id="rate4"><label for="rate4">★</label>
					<input type="radio" name="re_grade" value="1" id="rate5"><label for="rate5">★</label>
				</fieldset>
				<br> <input id="review_images" type="file" name="images" multiple style="display: block; margin-left: 21px;">
				<p id="fileCountMessage"
					style="color: red; margin: 5px 0 0 21px; font-size: 13px;"></p>
				<br>
				<textarea name="re_content" id="review-content"
					style="width: 600px; height: 200px; display: block; margin: 0 auto;"
					placeholder="내용을 입력해주세요."></textarea>
				<div id="charCount">0/350</div>
			</div>
			<div class="qa_write__buttons">
				<input type="hidden" value="${userVO.u_idx}" name="u_idx">
				<input type="hidden" value="${userVO.u_id}" name="u_id">
				<input class="review_write__button" type="reset" value="취소">
				<button type="button" class="review_write__button" onclick="reviewWrite(this.form)">등록</button>
			</div>
		</div>
	</form>

</body>
</html>