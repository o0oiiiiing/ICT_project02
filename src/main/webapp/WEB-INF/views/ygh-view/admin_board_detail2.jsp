<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ADMIN | Jeju_travel</title>
<!-- 파비콘 -->
<link rel="shortcut icon" href="resources/common-image/favicon.ico" type="image/x-icon">
<link rel="icon" href="resources/common-image/favicon.ico" type="image/x-icon">
<!-- summer note -->
<link href="<c:url value="/resources/common-css/summernote-lite.css"/>"
	rel='stylesheet' />
<link href="<c:url value="/resources/ygh-css/board_detail.css"/>"
	rel='stylesheet' />
<script type="text/javascript">
function admin_list2(f) {
	f.action = "admin_list2.do";
	f.submit();
}

function admin_board_delete2(f) {
	 if (confirm("해당 Q&A를 삭제 하시겠습니까?")) {
         alert("해당 Q&A가 삭제 되었습니다.");
		f.action = "admin_board_delete2.do";
		f.submit();
     } else {
         alert("해당 Q&A 삭제가 취소되었습니다.");
     }
}

function toggleCommentBox() {
	let comment_box = document.getElementById("comment_box");
	let comment_btn = document.getElementById("comment_btn");
	if (comment_box.style.display === "none" || comment_btn.style.display === "none") {
		comment_box.style.display = "block";
		comment_btn.style.display = "block";
	} else {
		comment_box.style.display = "none";
		comment_btn.style.display = "none";
	}
}

// 답글수정 버튼 클릭 시
function comment_update2(f) {
	let comment_box3 = document.getElementById("comment_box3");
	let comment_btn3 = document.getElementById("comment_btn3");
	let comment_box = document.getElementById("comment_box");
	let comment_btn = document.getElementById("comment_btn");
	if (comment_box3.style.display === "none" || comment_btn3.style.display === "none") {
		comment_box3.style.display = "block";
		comment_btn3.style.display = "block";
		comment_box.style.display = "none";
		comment_btn.style.display = "none";
	} else {
		comment_box3.style.display = "none";
		comment_btn3.style.display = "none";
	}
	f.action = "comment_update2.do";
}

function comment_update_ok2(f) {
	if (f.com_content.value === '') {
		alert("내용을 입력하세요.");
		return false;
	}
	f.action = "comment_update_ok2.do";
	f.submit();
}
</script>

<body>
<%@include file="../common/header.jsp"%>
<%@include file="../ygh-view/admin_bar.jsp"%>

<form method="post">
	<div id="board_detail">
		<table>
			<caption>Q&A 게시판</caption>
			<tbody>
				<tr>
					<th>제목</th>
					<td>${bovo.bo_title}</td>
				</tr>

				<tr>
					<th>작성자</th>
					<td>${bovo.bo_writer}</td>
				</tr>

				<tr>
					<th>날짜</th>
					<td>${bovo.bo_regdate.substring(0,10)}</td>
				</tr>
				<c:choose>
					<c:when test="${empty bovo.contentsid}"></c:when>
					<c:otherwise>
						<tr>
							<th>문의 장소</th>
							<td>
								<p><a href="detail?contentsid=${bovo.contentsid}">장소 상세페이지 바로가기</a></p>
							</td>
						</tr>
					</c:otherwise>
				</c:choose>
				
				<tr>
					<th>내용</th>
					<td><textarea rows="10" cols="60" id="bo_content" readonly 
							name="bo_content" style="margin: 5px;">${bovo.bo_content}</textarea>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div id="board_detail_btn">
		<input type="hidden" value="${bovo.bo_idx}" name="bo_idx"> 
		<input type="hidden" value="${cPage}" name="cPage"> 
		<input type="button" value="목록" onclick="admin_list2(this.form)" /> 
		<input type="button" value="삭제" onclick="admin_board_delete2(this.form)" />
	</div>
</form>

<br>
<br>
<br>

<%-- 답글 출력 --%>
<div style="display: table; margin: 0 auto;">
	<c:forEach var="k" items="${com_list}">
		<form method="post">
			<div id="comment_box2">
				<table>
					<tr>
						<th colspan="2" style="text-align: left;">답변</th>
					</tr>
					<tr>
						<th>작성자</th>
						<td>${k.com_writer}</td>
					</tr>
					<tr>
						<th>날짜</th>
						<td>${k.com_regdate.substring(0,10)}</td>
					</tr>
					<tr>
						<th>내용</th>
						<td><pre style="margin: 10px 0px;"><c:out value="${k.com_content}" /></pre></td>
					</tr>
				</table>
			</div>
			<div id="comment_btn">
				<input type="button" value="답글수정" onclick="comment_update2(this.form)"> 
				<input type="hidden" name="com_idx" value="${k.com_idx}"> 
				<input type="hidden" name="bo_idx" value="${k.bo_idx}">
				<input type="hidden" name="a_name" value="${adminVO.a_name}"> 
				<input type="hidden" name="cPage" value="${cPage}">
			</div>
		</form>
		<br>
		<br>
		<br>
	</c:forEach>
</div>

<%-- 답글 수정 --%>
<form method="post">
	<div id="comment_box3" style="display: none;" >
	<c:forEach var="k" items="${com_list}">
		<table>
			<tr>
				<th colspan="2" style="text-align: left;">답변하기</th>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="100" name="com_content" >${k.com_content}</textarea>
				</td>
			</tr>
		</table>
	</c:forEach>
	</div>
	<div id="comment_btn3" style="display: none;">
		<input type="hidden" name="bo_idx" value="${bovo.bo_idx}"> 
		<input type="hidden" name="a_name" value="${adminVO.a_name}"> 
		<input type="hidden" name="cPage" value="${cPage}">
		<input type="button" value="수정" onclick="comment_update_ok2(this.form)" />
	</div>
</form>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"
	crossorigin="anonymous"></script>
<script src="resources/common-js/summernote-lite.js"></script>
<script src="resources/common-js/lang/summernote-ko-KR.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#bo_content").summernote({
			lang : "ko-KR", // 한글 설정
			height : 300, // 에디터 높이
			focus : true, // 에디터 로딩후 포커스를 맞출지 여부
			placeholder : '최대3000자까지 쓸 수 있습니다', // placeholder 설정
			callbacks : {
				onImageUpload : function(files, editor) {
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
		frm.append("s_file", file);
		$.ajax({
			url : "/saveImg.do",
			data : frm,
			type : "post",
			contentType : false,
			processData : false,
			dataType : "json"
		}).done(
				function(data) {
					var path = data.path;
					var fname = data.fname;
					$("#bo_content").summernote("editor.insertImage",
							path + "/" + fname);
				});
	}
</script>

<%@include file="../common/footer.jsp"%>
</body>
</html>