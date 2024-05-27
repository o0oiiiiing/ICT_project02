<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>신고 게시판 목록</title>
<!-- 파비콘 -->
<link rel="shortcut icon" href="resources/common-image/favicon.ico" type="image/x-icon">
<link rel="icon" href="resources/common-image/favicon.ico" type="image/x-icon">
<!-- summer note -->
<link href="<c:url value="/resources/common-css/summernote-lite.css"/>" rel='stylesheet' />
<link href="<c:url value="/resources/pdh-css/detail.css"/>" rel='stylesheet' />
<link href="<c:url value="/resources/ygh-css/report_detail.css"/>" rel='stylesheet' />
<script type="text/javascript">
	function report_list(f) {
		f.action="report_list.do";
		f.submit();
	}

</script>
</head>
<body>
<%@include file="../common/header.jsp"%>
	<form method="post">
		<div id="report_detail">
		<table>
			<caption>신고 게시판</caption>
			<tbody>
				<tr>
					<th>제목</th>
					<td>${revo.report_title}</td>
				</tr>
				<tr>
					<th>날짜</th>
					<td>${revo.report_regdate.substring(0,10)}</td>
				</tr>
				<tr>
					<th>신고리뷰</th>
						<td>
							 <p><a href="detail?contentsid=${ReviewVO.contentsid}">신고 리뷰 페이지 바로가기</a></p>
							<%-- <p><a href="#" onclick="detail_go('${ReviewVO.contentsid}'">신고 리뷰 페이지 바로가기</a></p> --%>
							<div class="review-content" style="border: 1px solid lightgray; padding: 10px; margin: 10px 0px 0px;">
								<div class="review-content__left">
									<img style="width: 130px; height: 130px; border-radius: 50%;"
										alt="프로필사진" src="resources/upload/${ReviewVO.u_profile_img}">
									<p>${ReviewVO.u_name}</p>
									<p>${ReviewVO.re_regdate.substring(0,10)}</p>
									<c:choose>
										<c:when test="${ReviewVO.re_grade == 1}">
											<span style="color: #FFDF6B;" class="star">★</span>
											<span style="color: #f0f0f0;" class="star">★★★★</span>
										</c:when>
										<c:when test="${ReviewVO.re_grade == 2}">
											<span style="color: #FFDF6B;" class="star">★★</span>
											<span style="color: #f0f0f0;" class="star">★★★</span>
										</c:when>
										<c:when test="${ReviewVO.re_grade == 3}">
											<span style="color: #FFDF6B;" class="star">★★★</span>
											<span style="color: #f0f0f0;" class="star">★★</span>
										</c:when>
										<c:when test="${ReviewVO.re_grade == 4}">
											<span style="color: #FFDF6B;" class="star">★★★★</span>
											<span style="color: #f0f0f0;" class="star">★</span>
										</c:when>
										<c:otherwise>
											<span style="color: #FFDF6B;" class="star">★★★★★</span>
										</c:otherwise>
									</c:choose>
								</div>

								<div class="review-content__right" style="border-left: 1px solid lightgray; padding: 20px;">
										<p style="color: black;">${ReviewVO.re_content}</p>

										<div class="images">
											<img style="width: 150px; height: 150px;" alt="사진"
												src="resources/upload/${ReviewVO.pic_file}">
									</div>
								</div>
							</div>
						</td>
					</tr>
					
				<tr>
					<th>신고내용</th>
					<td>
						<textarea rows="10" cols="60" id="report_content" name="report_content">${revo.report_content}</textarea>
					</td>
				</tr>

			</tbody>
			</table>
			</div>
			<div id="report_detail_btn">
				<input type="hidden" value="${revo.report_idx}" name="report_idx"> 
				<input type="hidden" value="${cPage2}" name="cPage2"> 
				<input type="button" value="목록" onclick="report_list(this.form)" /> 
			</div>
	</form>
	
	<br><br><br>
	
	<%-- 답글 출력 --%>
	<div style="display: table; margin: 0 auto;">
		<c:forEach var="k" items="${rep_list}">
			<form method="post">
				<div id="comment_box2">
					<table>
						<tr>
							<th colspan="2" style="text-align: left;">답변</th>
						</tr>
						<tr>
							<th>작성자</th>
							<td>${k.rep_writer}</td>
						</tr>
						<tr>
							<th>날짜</th>
							<td>${k.rep_regdate.substring(0,10)}</td>
						</tr>
						<tr>
							<th>내용</th>
							<td>${k.rep_content}</td>
						</tr>
					</table>
				</div>
			</form>
		</c:forEach>
	</div>
	<!-- jQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js" crossorigin="anonymous"></script>
	<script src="resources/common-js/summernote-lite.js"></script>
	<script src="resources/common-js/lang/summernote-ko-KR.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		$("#report_content").summernote({
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
		$('#report_content').summernote('disable');
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
			$("#report_content").summernote("editor.insertImage",path+"/"+fname);
		});
	}
	</script>

<%@include file="../common/footer.jsp"%>
</body>
</html>