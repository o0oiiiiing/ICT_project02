<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 작성</title>
</head>
<body>
	<!-- Q&A 작성하는 영역 -->
	<form id="qa_write" method="post" action="qaWrite">
		<div class="qa_write__container" style="height: 510px;">
			<p class="qa_wrtie__title">Q&A 작성</p>
			<div class="qa_write__content">
				<table style="margin: 0 auto;">
					<tbody>
						<tr>
							<td>제목</td>
							<td colspan="2"><input style="width: 420px;" type="text"
								name="bo_title" required></td>
						</tr>
						<tr>
							<td style="width: 149px; text-align: center;">
								<div style="display: inline-block; margin-right: 7px;">
									<input type="radio" name="disclosure" value="0"
										onclick="handleDisclosure()" checked="checked">공개 <input
										type="radio" name="disclosure" value="1"
										onclick="handleDisclosure()">비공개
								</div>
							</td>
							<td style="width: 449px;">비밀번호 : <input
								style="width: 200px;" type="password" name="bo_pwd"
								disabled="disabled" id="passwordInput" required="required"></td>
						</tr>
					</tbody>
				</table>
				<br>
				<textarea id="summernote" name="bo_content" maxlength="1000"></textarea>
			</div>
			<div class="qa_write__buttons">
				<input type="hidden" value="${userVO.u_idx}" name="u_idx"> <input
					type="hidden" value="${userVO.u_name}" name="u_name"> <input
					class="qa_write__button" type="reset" value="취소">
				<button type="button" class="qa_write__button"
					onclick="qaWrite(this.form)">등록</button>
			</div>
		</div>
	</form>
	
	<script type="text/javascript">
		// summernote
		$('#summernote').summernote({
			height : 200, // 에디터 높이
			width: 600,
			minHeight : null, // 최소 높이
			maxHeight : null, // 최대 높이
			focus : true, // 에디터 로딩후 포커스를 맞출지 여부
			lang : "ko-KR", // 한글 설정
			placeholder : '최대 1000자까지 쓸 수 있습니다', //placeholder 설정
			toolbar: [
				['fontname', ['fontname']],
				['fontsize', ['fontsize']],
				['color', ['color']],
				['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
				['para', ['ul', 'ol', 'paragraph']],
				['height', ['height']]
			],
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
		});
	</script>
</body>
</html>