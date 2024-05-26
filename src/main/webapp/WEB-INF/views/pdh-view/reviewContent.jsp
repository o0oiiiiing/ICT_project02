<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 내용</title>
</head>
<body>
	<div class="detail-section">
		<div class="detail-section__bar">
			<p class="detail-title">리뷰</p>
			<span class="material-symbols-outlined expand_icon">expand_more</span>
		</div>
		<!-- 내용 -->
		<div class="review_title__section">
			<p class="qa_title">
				<c:choose>
					<c:when test="${reviewAvg != null}">
							리뷰 <span style="color: #FFBB36;">(${reviewNum})</span> | 총 평점 : <span
							style="color: #FFBB36;">${reviewAvg}</span>
					</c:when>
					<c:otherwise>
							리뷰 <span style="color: #FFBB36;">(${reviewNum})</span>
					</c:otherwise>
				</c:choose>
			</p>
			<input class="write_r_button" type="button" value="리뷰작성">
		</div>
		<hr class="hr">
		<c:choose>
			<c:when test="${empty reviewList}">
				<p
					style="text-align: center; font-family: 'NanumSquare'; font-size: 18px;">리뷰가
					존재하지 않습니다.</p>
				<hr class="hr">
			</c:when>
			<c:otherwise>
				<c:forEach var="k" items="${reviewList}">
					<div class="review-content">
						<div class="review-content__left">
							<img style="width: 130px; height: 130px; border-radius: 50%;"
								alt="프로필사진" src="resources/upload/${k.u_profile_img}">
							<p>${k.u_name}</p>
							<p>${k.re_regdate.substring(0,10)}</p>
							<c:choose>
								<c:when test="${k.re_grade == 1}">
									<span style="color: #FFDF6B;" class="star">★</span><span style="color: #f0f0f0;" class="star">★★★★</span>
								</c:when>
								<c:when test="${k.re_grade == 2}">
									<span style="color: #FFDF6B;" class="star">★★</span><span style="color: #f0f0f0;" class="star">★★★</span>
								</c:when>
								<c:when test="${k.re_grade == 3}">
									<span style="color: #FFDF6B;" class="star">★★★</span><span style="color: #f0f0f0;" class="star">★★</span>
								</c:when>
								<c:when test="${k.re_grade == 4}">
									<span style="color: #FFDF6B;" class="star">★★★★</span><span style="color: #f0f0f0;" class="star">★</span>
								</c:when>
								<c:otherwise>
									<span style="color: #FFDF6B;" class="star">★★★★★</span>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="review-content__right">
							<c:choose>
								<c:when test="${empty k.imageList}">
									<div class="review-content__text" style="height: 240px;">
										<div style="letter-spacing: 1px; line-height: 20px;">${k.re_content}</div>
										<p class="report">
											<c:choose>
												<c:when test="${userVO.u_idx == k.u_idx}">
													<input class="delete-button" type="button" value="삭제하기">
													<span style="font-family: 'NanumSquare'; font-size: 18px;">&nbsp;|&nbsp;</span>
													<input type="hidden" class="re_idx" name="re_idx" value="${k.re_idx}">
												</c:when>
											</c:choose>
											<span class="material-symbols-outlined declaration">notifications</span>
											<input class="report-button" type="button" value="신고하기">
											<input type="hidden" class="re_idx" value="${k.re_idx}">
											<input type="hidden" class="u_idx" value="${k.u_idx}">
											<input type="hidden" class="u_id" value="${k.u_id}">
											<input type="hidden" class="u_name" value="${k.u_name}">
										</p>
									</div>
								</c:when>
								<c:otherwise>
									<div class="review-content__text" style="height: 100px;">
										<div style="letter-spacing: 1px; line-height: 20px;">${k.re_content}</div>
									</div>
									<div class="images">
										<c:forEach var="j" items="${k.imageList}">
											<img style="width: 150px; height: 150px;" alt="사진"
												src="resources/upload/${j.pic_file}">
										</c:forEach>
										<p class="report">
											<c:choose>
												<c:when test="${userVO.u_idx == k.u_idx}">
													<input class="delete-button" type="button" value="삭제하기">
													<span style="font-family: 'NanumSquare'; font-size: 18px;">&nbsp;|&nbsp;</span>
													<input type="hidden" class="re_idx" name="re_idx" value="${k.re_idx}">
												</c:when>
											</c:choose>
											<span class="material-symbols-outlined declaration">notifications</span>
											<input class="report-button" type="button" value="신고하기">
											<input type="hidden" class="re_idx" value="${k.re_idx}">
											<input type="hidden" class="u_idx" value="${k.u_idx}">
											<input type="hidden" class="u_id" value="${k.u_id}">
											<input type="hidden" class="u_name" value="${k.u_name}">
										</p>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<hr class="hr">
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
	<!-- 페이징 -->
	<ol class="paging">
		<!-- 이전 버튼 -->
		<c:choose>
			<c:when test="${rPaging.beginBlock <= rPaging.pagePerBlock}">
				<li class="disable">이전</li>
			</c:when>
			<c:otherwise>
				<li><a class="able"
					href="detail?rCPage=${rPaging.beginBlock - rPaging.pagePerBlock}&contentsid=${placeDetail.contentsid}">이전</a></li>
			</c:otherwise>
		</c:choose>

		<!-- 페이지번호들 -->
		<c:forEach begin="${rPaging.beginBlock}" end="${rPaging.endBlock}"
			step="1" var="k">
			<c:choose>
				<c:when test="${k == rPaging.nowPage}">
					<li class="now">${k}</li>
				</c:when>
				<c:otherwise>
					<li><a class="other_page"
						href="detail?rCPage=${k}&contentsid=${placeDetail.contentsid}">${k}</a>
					</li>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<!-- 이후 버튼 -->
		<c:choose>
			<c:when test="${rPaging.endBlock >= rPaging.totalPage}">
				<li class="disable">다음</li>
			</c:when>
			<c:otherwise>
				<li><a class="able"
					href="detail?rCPage=${rPaging.beginBlock + rPaging.pagePerBlock}&contentsid=${placeDetail.contentsid}">이전</a></li>
			</c:otherwise>
		</c:choose>
	</ol>
</body>
</html>