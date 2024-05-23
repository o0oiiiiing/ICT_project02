<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>나의 리뷰</title>
<!-- 파비콘 -->
<link rel="shortcut icon" href="resources/common-image/favicon.ico" type="image/x-icon">
<link rel="icon" href="resources/common-image/favicon.ico" type="image/x-icon">
<!-- summer note -->
<link href="<c:url value="/resources/common-css/summernote-lite.css"/>" rel='stylesheet' />
<link href="<c:url value="/resources/ygh-css/board_detail.css"/>" rel='stylesheet' />
<script type="text/javascript">
	function board_list(f) {
		f.action="board_list.do";
		f.submit();
	}
	
	function board_delete(f) {
		f.action="board_delete.do";
		f.submit();
	}

</script>
</head>
<body>
<%@include file="../common/header.jsp"%>
	<form method="post">
		<div id="board_detail">
			<table>
				<caption>내가 쓴 리뷰</caption>
				<tbody>
					<tr>
						<th>카테고리</th>
						<%-- <td>${myreview_detail_list.contentsid}</td> --%>
						<td>d</td>
					</tr>

					<tr>
						<th>작성자</th>
						<td>${myreview_detail_list.u_name}</td>
					</tr>

					<tr>
						<th>날짜</th>
						<td>${myreview_detail_list.re_regdate.substring(0,10)}</td>
					</tr>

					<tr>
						<th>내용</th>
						<td>
							<textarea rows="10" cols="60" id="bo_content" name="bo_content" readonly style="margin: 5px;">${myreview_detail_list.re_content}</textarea>
						</td>
					</tr>
				</tbody>
			</table>
			</div>
			<c:choose>
				<c:when test="${bovo.active eq 0}">
					<div id="board_detail_btn">
						<input type="hidden" value="${bovo.bo_idx}" name="bo_idx"> 
						<input type="hidden" value="${cPage}" name="cPage">  
						<input type="button" value="삭제" onclick="board_delete(this.form)" />
					</div>
				</c:when>
				<c:otherwise>
					<div id="board_detail_btn">
						<input type="hidden" value="${bovo.bo_idx}" name="bo_idx"> 
						<input type="hidden" value="${cPage}" name="cPage"> 
						<input type="button" value="삭제" onclick="board_delete(this.form)" />
					</div>
				</c:otherwise>
			</c:choose>
	</form>
	
	<br><br><br>
	
	<!-- jQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js" crossorigin="anonymous"></script>
	<script src="resources/common-js/summernote-lite.js"></script>
	<script src="resources/common-js/lang/summernote-ko-KR.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		$("#bo_content").summernote({
			lang: "ko-KR",								// 한글 설정
			height: 300,              		 			// 에디터 높이
			focus: true,               					// 에디터 로딩후 포커스를 맞출지 여부
			placeholder: '최대3000자까지 쓸 수 있습니다', 	// placeholder 설정
			callbacks : {
				onImageUpload :  function(files, editor){
					for (var i = 0; i < files.length; i++) {
						sendImage(files[i], editor);
					}
				}
			}
		});
		$('#bo_content').summernote('disable');
	});

	function sendImage(file, editor) {
		var frm = new FormData();
		frm.append("s_file",file);
		$.ajax({
			url : "/saveImg.do",
			data : frm,
			type : "post",
			contentType : false,
			processData : false,
			dataType : "json"
		}).done(function(data) {
			var path = data.path;
			var fname = data.fname;
			$("#bo_content").summernote("editor.insertImage",path+"/"+fname);
		});
	}
	</script>

<%@include file="../common/footer.jsp"%>
</body>
</html>