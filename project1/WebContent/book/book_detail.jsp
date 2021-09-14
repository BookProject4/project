<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<!-- Meta Tag -->
    <meta charset="utf-8">
    <title>Eshop - eCommerce HTML5 Template.</title>
    
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
							<i class="ti-arrow-right"></i></a></li>
							<li><a href="../book/book_list.do?cate1=${vo.category }&cate2=${vo.subCategory }">${vo.subCategory }
							<i class="ti-arrow-right"></i></a></li>
							<li><a href="../book/book_detail.do?isbn=${vo.isbn }">${vo.title }
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
									<div class="image">
										<img src="${vo.poster }">
									</div>

									<div class="blog-detail">
										<h2 class="blog-title">${vo.title } </h2>
										<h4 class="blog-title">${vo.subtitle } </h4>
										<div class="blog-meta">
											<span class="author"><i class="fa fa-user"></i>작가 : ${vo.writer } / 출판사 : ${vo.publisher }
											<br>정가 : ${vo.price } / 할인가 : ${vo.discount }
											<br>제원 : ${vo.etcInfo }	 출판일 : <i class="fa fa-calendar"></i>${vo.publicationDay }
											<br>ISBN(도서번호) : ${vo.isbn }
											</span>
										</div>
										<div class="content">
											<c:if test="${vo.imgs ne ''}">
											<h2> 책 정보</h2>
											<img src=${vo.imgs }>
											<br><hr><br>
											</c:if>
											<c:if test="${vo.text ne ''}">
											<h2> 책 소개</h2>
											<span>${vo.text }</span>
											<br><hr><br>
											</c:if>
											<c:if test="${vo.contentsTable ne ''}">
											<h2> 책 목차</h2>
											<span>${vo.contentsTable }</span>
											<br><hr><br>
											</c:if>
											<blockquote> <i class="fa fa-quote-left"></i> 강조할때 필요할듯??</blockquote>
										</div>
									</div>
									<div class="share-social">
										<div class="row">
											<div class="col-12">
												<div class="content-tags">
													<h4>Tags</h4>
													<ul class="tag-inner">
														<c:forTokens var="tag" items="${vo.tags }" delims="#">
															<li>#${tag }</li>
														</c:forTokens>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>
								
								<!-- 댓글 출력 시작 따로 reply 만들어서  -->
								<div class="col-12">
									<div class="comments">
										<h3 class="comment-title">Comments (3)</h3>
										<!-- Single Comment -->
										<div class="single-comment">
											<img src="https://via.placeholder.com/80x80" alt="사용자 사진">
											<div class="content">
												<h4>작성자~! <span>언제 작성했는지 sysdate 출력(At 8:59 pm On Feb 28, 2018)</span></h4>
												<p>내용들~!!!</p>
												<div class="button">
													<a href="#" class="btn"><i class="fa fa-reply" aria-hidden="true"></i>Reply버튼</a>
												</div>
											</div>
										</div>
										<!-- End Single Comment -->
										<!-- Single Comment -->
										<div class="single-comment left">
											<img src="https://via.placeholder.com/80x80" alt="#">
											<div class="content">
												<h4>john deo <span>Feb 28, 2018 at 8:59 pm</span></h4>
												<p>Enthusiastically leverage existing premium quality vectors with enterprise-wide innovation collaboration Phosfluorescently leverage others enterprisee  Phosfluorescently leverage.</p>
												<div class="button">
													<a href="#" class="btn"><i class="fa fa-reply" aria-hidden="true"></i>Reply</a>
												</div>
											</div>
										</div>
										<!-- End Single Comment -->
										<!-- Single Comment -->
										<div class="single-comment">
											<img src="https://via.placeholder.com/80x80" alt="#">
											<div class="content">
												<h4>megan mart <span>Feb 28, 2018 at 8:59 pm</span></h4>
												<p>Enthusiastically leverage existing premium quality vectors with enterprise-wide innovation collaboration Phosfluorescently leverage others enterprisee  Phosfluorescently leverage.</p>
												<div class="button">
													<a href="#" class="btn"><i class="fa fa-reply" aria-hidden="true"></i>Reply</a>
												</div>
											</div>
										</div>
										<!-- End Single Comment -->
									</div>									
								</div>
								<!-- 댓글 출력 끝 -->			
								
								<!-- 댓글 쓰기 -->							
								<div class="col-12">			
									<div class="reply">
										<div class="reply-head">
											<h2 class="reply-title">댓글 작성</h2>
											<!-- Comment Form -->
											<form class="form" action="#">
												<div class="row">
													<div class="col-lg-6 col-md-6 col-12">
														<div class="form-group">
															<label>작성자<span>*</span></label>
															<input type="text" name="name" placeholder="" required="required">
														</div>
													</div>
													<div class="col-lg-6 col-md-6 col-12">
														<div class="form-group">
															<label>작성자 이메일?? 등 필요한 정보<span>*</span></label>
															<input type="email" name="email" placeholder="" required="required">
														</div>
													</div>
													<div class="col-12">
														<div class="form-group">
															<label>댓글 내용<span>*</span></label>
															<textarea name="message" placeholder=""></textarea>
														</div>
													</div>
													<div class="col-12">
														<div class="form-group button">
															<button type="submit" class="btn">Post comment</button>
														</div>
													</div>
												</div>
											</form>
											<!-- End Comment Form -->
										</div>
									</div>			
								</div>			
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-12">
						<div class="main-sidebar">
							
							<!-- Single Widget -->
							<div class="single-widget category">
								<h3 class="title">퀵 메뉴???</h3>
								<ul class="categor-list">
									<li><a href="#">바로구매</a></li>
									<li><a href="#">창작마당으로 이동</a></li>
									<li><a href="#">장바구니 담기</a></li>
								</ul>
							</div>
							<!--/ End Single Widget -->
							
							<!-- Single Widget -->
							<div class="single-widget recent-post">
								<h3 class="title">창작마당 최근 게시글들 몇개 긁어오기</h3>
								<!-- Single Post -->
								<div class="single-post">
									<div class="image">
										<img src="https://via.placeholder.com/100x100" alt="#">
									</div>
									<div class="content">
										<h5><a href="#">창작마당 게시글 제목</a></h5>
										<ul class="comment">
											<li><i class="fa fa-calendar" aria-hidden="true"></i>창작마당 게시글 등록 날짜 </li>
											<li><i class="fa fa-commenting-o" aria-hidden="true"></i>창작마당 게시글의 댓글 갯수 (35)</li>
										</ul>
									</div>
								</div>
								<!-- End Single Post -->
							</div>
							<!--/ End Single Widget -->
							
							<!-- Single Widget -->
							<div class="single-widget side-tags">
								<h3 class="title">관련 태그 책들 foreach로 책의 태그들 가져와서 출력</h3>
								<ul class="tag">
									<li><a href="#">business</a></li>
									<li><a href="#">wordpress</a></li>
									<li><a href="#">html</a></li>
									<li><a href="#">multipurpose</a></li>
									<li><a href="#">education</a></li>
									<li><a href="#">template</a></li>
									<li><a href="#">Ecommerce</a></li>
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