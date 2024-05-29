<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 내용</title>
</head>
<body>
	<div class="detail-section">
		<div class="detail-section__bar">
			<p class="detail-title">Q&A</p>
			<span id="qnaOpenIcon" class="material-symbols-outlined expand_icon" onclick="qnaOpen('qnaDiv', 'qnaOpenIcon')">keyboard_arrow_up</span>
		</div>
		<!-- 내용 -->
		<div id="qnaDiv">
			<div class="qa_title__section">
				<p class="qa_title">
					Q&A <span style="color: #FFBB36;">(${qaNum})</span>
				</p>
				<c:choose>
					<c:when test="${userVO != null}">
						<input class="write_button" type="button" value="질문작성">
					</c:when>
					<c:otherwise>
						<input class="write_button" type="button" value="질문작성" style="display: none;">
					</c:otherwise>
				</c:choose>
			</div>
			<table class="qa_table">
				<thead>
					<tr>
						<td style="width: 10%">공개 여부</td>
						<td style="width: 40%">제목</td>
						<td style="width: 20%">작성자</td>
						<td style="width: 20%">작성일</td>
						<td style="width: 10%">답변 여부</td>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty qaList}">
							<tr>
								<td colspan="5" style="text-align: center;">Q&A가 존재하지 않습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="k" items="${qaList}">
								<tr onclick="qaDetailOpen(this, '${k.disclosure}', '${k.u_idx}', '${userVO.u_idx}', '${admin_loginChk}')">
									<c:choose>
										<c:when test="${k.disclosure == '0'}">
											<td style="text-align: center;">공개</td>
											<td style="text-align: center;">${k.bo_title}</td>
										</c:when>
										<c:otherwise>
											<td style="text-align: center;">비공개</td>
											<td style="text-align: center; color: #9E9E9E;">비밀글입니다.</td>
										</c:otherwise>
									</c:choose>
									<td style="text-align: center;">${k.bo_writer}</td>
									<td style="text-align: center;">${k.bo_regdate.substring(0,10)}</td>
									<c:choose>
										<c:when test="${k.active == '0'}">
											<td style="text-align: center;">N</td>
										</c:when>
										<c:otherwise>
											<td style="text-align: center; color: #FFBB36;">Y</td>
										</c:otherwise>
									</c:choose>
								</tr>
						
								<tr style="display: none;" class="qaDetail">
									<td colspan="5">내용<br>${k.bo_content}</td>
								</tr>
								<c:choose>
									<c:when test="${not empty k.comments}">
										<c:forEach var="j" items="${k.comments}">
											<tr style="display: none;" class="comment">
												<td colspan="5">ㄴ 답변 : ${j.com_content}</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${admin_loginChk == 'ok'}">
												<tr style="display: none;" class="comment">
													<td colspan="5">
														<input class="comment_button" type="button" value="답변달기">
														<input type="hidden" class="bo_idx" value="${k.bo_idx}">
													</td>
												</tr>
											</c:when>
										</c:choose>
									</c:otherwise>
								</c:choose>
									
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<!-- 페이징 -->
			<ol class="paging">
				<!-- 이전 버튼 -->
				<c:choose>
					<c:when test="${qaPaging.beginBlock <= qaPaging.pagePerBlock}">
						<li class="disable">이전</li>
					</c:when>
					<c:otherwise>
						<li><a class="able"
							href="detail?cPage=${qaPaging.beginBlock - qaPaging.pagePerBlock}&contentsid=${placeDetail.contentsid}">이전</a></li>
					</c:otherwise>
				</c:choose>
	
				<!-- 페이지번호들 -->
				<c:forEach begin="${qaPaging.beginBlock}" end="${qaPaging.endBlock}"
					step="1" var="k">
					<c:choose>
						<c:when test="${k == qaPaging.nowPage}">
							<li class="now">${k}</li>
						</c:when>
						<c:otherwise>
							<li><a class="other_page"
								href="detail?cPage=${k}&contentsid=${placeDetail.contentsid}">${k}</a>
							</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
	
				<!-- 이후 버튼 -->
				<c:choose>
					<c:when test="${qaPaging.endBlock >= qaPaging.totalPage}">
						<li class="disable">다음</li>
					</c:when>
					<c:otherwise>
						<li><a class="able"
							href="detail?cPage=${qaPaging.beginBlock + qaPaging.pagePerBlock}&contentsid=${placeDetail.contentsid}">이전</a></li>
					</c:otherwise>
				</c:choose>
			</ol>
		</div>
	</div>
	
	<script type="text/javascript">
		function qaDetailOpen(el, disclosure, writer, user, admin) {
			if (disclosure == '1') {
				if (user == writer || admin == 'ok') {
			 	} else {
					alert("작성자만 확인이 가능합니다.")
					return;					
			 	}
			}
			
		   // Find the next sibling element with the class 'qaDetail'
		   var qaDetail = el.nextElementSibling;
		   while (qaDetail && !qaDetail.classList.contains('qaDetail')) {
		     qaDetail = qaDetail.nextElementSibling;
		   }
		
		   // Toggle the display of the qaDetail element
		   if (qaDetail) {
		     qaDetail.style.display = qaDetail.style.display === 'table-row' ? 'none' : 'table-row';
		   }
		
		   // Find all subsequent sibling elements with the class 'comment'
		   var comment = qaDetail ? qaDetail.nextElementSibling : null;
		   while (comment && comment.classList.contains('comment')) {
		     comment.style.display = comment.style.display === 'table-row' ? 'none' : 'table-row';
		     comment = comment.nextElementSibling;
		   }
		}
	</script>
</body>
</html>