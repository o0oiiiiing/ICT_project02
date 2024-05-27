<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답변달기</title>
</head>
<body>
	<!-- 관리자가 답변 작성하는 영역 -->
	<form id="comment_write" method="post" action="commentWrite">
		<div class="qa_write__container" style="height: 430px;">
			<p class="qa_wrtie__title">답변달기</p>
			<div class="qa_write__content">
				<br>
				<textarea name="com_content" id="comment-content" style="width: 600px; height: 200px; display: block; margin: 0 auto;"
					placeholder="내용을 입력해주세요."></textarea>
			</div>
			<div class="qa_write__buttons">
				<input type="hidden" value="" name="bo_idx" class="boIdx">
				<input type="hidden" value="${adminVO.a_name}" name="com_writer">
				<input class="comment_write__button" type="reset" value="취소">
				<button type="button" class="comment_write__button" onclick="commentWrite(this.form)">등록</button>
			</div>
		</div>
	</form>
	
	<script type="text/javascript">
    	// Q&A 답변 내용 입력안할 시에 alert 뜨기
	    function commentWrite(f) {
	    	var commentContent = document.getElementById('comment-content').value.trim();
		    if (!commentContent) {
		    	alert("내용을 입력해 주세요.");
	            return false;
		    } else {
		    	f.action = "commentWrite?contentsid=${placeDetail.contentsid}";
		    	alert("답변 작성이 완료되었습니다.")
				f.submit();
		    }
		}
	</script>
</body>
</html>