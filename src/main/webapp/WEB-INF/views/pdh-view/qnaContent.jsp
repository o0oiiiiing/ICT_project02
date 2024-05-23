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
			<span class="material-symbols-outlined expand_icon">expand_more</span>
		</div>
		<!-- 내용 -->
		<div class="qa_title__section">
			<p class="qa_title">
				Q&A <span style="color: #FFBB36;">(${qaNum})</span>
			</p>
			<input class="write_button" type="button" value="질문작성">
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
							<tr>
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
</body>
</html>