<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Meta Tag -->
<meta charset="utf-8">
<title>Eshop - eCommerce HTML5 Template.</title>

<script type="text/javascript">
	$(function() {
		//등록
		$('#iBtn').click(function() {
			//내용
			let msg = $('#msg').val();
			if (msg.trim() == "") {
				$('#msg').focus();
				return;
			}
			$('#replyForm').submit();
		})

	})
</script>
</head>
<body class="js">

	<!-- Breadcrumbs -->
	<div class="breadcrumbs">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="bread-inner">
						<ul class="bread-list">
							<li><a href="../book/book_main.do?cate1=${vo.category }">${vo.category }
									<i class="ti-arrow-right"></i>
							</a></li>
							<li><a
								href="../book/book_list.do?cate1=${vo.category }&cate2=${vo.subCategory }">${vo.subCategory }
									<i class="ti-arrow-right"></i>
							</a></li>
							<li><a href="../book/book_detail.do?isbn=${vo.isbn }">${vo.title }</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Breadcrumbs -->

	<!-- Start Blog Single -->
	<section class="blog-single section">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-12">
					<div class="blog-single-main">
						<div class="row">
							<div class="col-12">
								<!--<div class="image">-->
									<img src="${vo.poster }">
								

								<div class="blog-detail">
									<h2 class="blog-title">${vo.title }</h2>
									<h4 class="blog-title">${vo.subtitle }</h4>
									<div class="blog-meta">
										<span class="author"><i class="fa fa-user"></i>작가 :
											${vo.writer } / 출판사 : ${vo.publisher } <br>정가 :
											${vo.price } / 할인가 : ${vo.discount } <br>제원 :
											${vo.etcInfo } 출판일 : <i class="fa fa-calendar"></i>${vo.publicationDay }
											<br>ISBN(도서번호) : ${vo.isbn }
										</span>
									</div>
									<div class="content">
										<c:if test="${vo.imgs ne null}">
											<h2>책 정보</h2>
											<img src=${vo.imgs }>
											<br>
											<hr>
											<br>
										</c:if>
										<c:if test="${vo.text ne null}">
											<h2>책 소개</h2>
											<span>${vo.text }</span>
											<br>
											<hr>
											<br>
										</c:if>
										<c:if test="${vo.contentsTable ne null}">
											<h2>책 목차</h2>
											<span>${vo.contentsTable }</span>
											<br>
											<hr>
											<br>
										</c:if>
									</div>
								</div>
								<div class="share-social">
									<div class="row">
										<div class="col-12">
											<div class="content-tags">
												<h5>Tags</h5>
												<ul class="tag-inner">
													<c:forTokens var="tag" items="${vo.tags }" delims="#">
														<li>#${tag }</li>
													</c:forTokens>
												</ul>
												<c:if test="${tagN eq 0}">
												<p>관련 태그가 없습니다.</p>
												</c:if>
												<br><hr>
											</div>
										</div>
									</div>
								</div>
							</div>
							

							<!-- 댓글 출력 -->
							<div class="col-12">
								<div class="comments">
									<h3 class="comment-title">Comments (${rListCnt })</h3>
									<!-- Single Comment -->
									<c:forEach var="rvo" items="${rList }">
										<div class="single-comment">
											<img src="https://via.placeholder.com/80x80" alt="사용자 사진">
											<div class="content">
												<h4>${rvo.name }
													<span>${rvo.dbday }</span>
												</h4>
												<pre>${rvo.msg }</pre>
												<c:if test="${rvo.id eq sessionScope.id }">
												<form method=post action="../book/reply_delete.do">
													<input type=hidden name=isbn value="${rvo.isbn }">
													<input type=hidden name=no value="${rvo.no }">
													<input type="submit" id="dBtn" class="btn" value="삭제" style="float: right">
												</form>
												<form method=post action="../book/reply_preUpdate.do">
													<input type=hidden name=isbn value="${rvo.isbn }">
													<input type=hidden name=no value="${rvo.no }">
													<input type=hidden name=msg value="${rvo.msg }">
												<input type="submit" id="uBtn" class="btn" value="수정" style="float: right">		
												</form>
												</c:if>
											</div>
										</div>
										<hr>
									</c:forEach>
								</div>
							</div>
							<!-- 댓글 출력 끝 -->


							<!-- 댓글 쓰기 로그인 중일때-->
							<c:if test="${sessionScope.id!=null }">
								<div class="col-12">
									<div class="reply">
										<div class="reply-head">
											<!-- Comment Form -->
											<form method=post class="form"
												action="../book/reply_insert.do" id="replyForm">
												<input type="hidden" name="isbn" value="${vo.isbn }">

												<div class="row">
													<div class="col-lg-6 col-md-6 col-12">
														<div class="form-group">
															<label>${sessionScope.name }</label>
														</div>
													</div>
													<div class="col-12">
														<div class="form-group">
															<label>내용<span>*</span></label>
															
															<textarea name="msg" placeholder="" id="msg"></textarea>
															
														</div>
														<input type="button" id="iBtn" class="btn" value="등록" style="float: right">
														<input type="button" id="iBtn" class="btn" value="수정" style="float: right;display:none">
														<input type="button" class="btn" value="취소" style="float: right;display:none" onclick="javascript:history.back()">
													</div>
												</div>
											</form>
											<!-- End Comment Form -->
										</div>
									</div>
								</div>
							</c:if>

							<!-- 로그인 상태 아닐 때-->
							<c:if test="${sessionScope.id==null }">
								<p>로그인 후 댓글 입력 가능합니다.</p>
							</c:if>


						</div>
					</div>
				</div>
				<div class="col-lg-4 col-12">
					<div class="main-sidebar">

						<!-- Single Widget -->
						<div class="single-widget category">
							<h3 class="title">Quick Menu</h3>
							<ul class="categor-list">
								<li><a href="#">바로구매</a></li>
								<li><a href="../community/list.do">창작마당</a></li>
								<li><a href="#">장바구니</a></li>
							</ul>
						</div>
						<!--/ End Single Widget -->

						<!-- Single Widget -->
						<div class="single-widget recent-post">
							<h3 class="title">창작마당</h3>
							<!-- Single Post -->
							<div class="single-post">
								<div class="image">
									<img src="https://via.placeholder.com/100x100" alt="#">
								</div>
								<div class="content">
									<h5>
										<a href="#">창작마당 게시글 제목</a>
									</h5>
									<ul class="comment">
										<li><i class="fa fa-calendar" aria-hidden="true"></i>창작마당
											게시글 등록 날짜</li>
										<li><i class="fa fa-commenting-o" aria-hidden="true"></i>창작마당
											게시글의 댓글 갯수 (35)</li>
									</ul>
								</div>
							</div>
							<!-- End Single Post -->
						</div>
						<!--/ End Single Widget -->

						<!-- Single Widget -->
						<div class="single-widget side-tags">
							<h3 class="title">관련 태그 다른 서적들</h3>
							<ul class="tag">
								<c:forTokens var="tag" items="${vo.tags }" delims="#">
									<li><a href="../search/search.do?opt=tag&search=${tag }">#${tag }</a></li>
								</c:forTokens>
								<c:if test="${tagN eq 0}">
									<p>관련 태그가 없습니다.</p>
								</c:if>
							</ul>
						</div>
						<!--/ End Single Widget -->

					</div>
				</div>
			</div>
		</div>
	</section>
	<!--/ End Blog Single -->


</body>
</html>