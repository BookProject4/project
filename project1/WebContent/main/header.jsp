<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- Preloader -->
	<div class="preloader">
		<div class="preloader-inner">
			<div class="preloader-icon">
				<span></span>
				<span></span>
			</div>
		</div>
	</div>
	<!-- End Preloader -->
	
	
	<!-- Header -->
	<header class="header shop">
		<!-- Topbar -->
		<div class="topbar">
			<div class="container">
				<div class="row">
					<div class="col-lg-5 col-md-12 col-12">
						<!-- Top Left -->
						<div class="top-left">
							<ul class="list-main">
								<li><i class="ti-headphone-alt"></i> +82 10 0000-0000</li>
								<li><i class="ti-email"></i>support@bookProject.com</li>
							</ul>
						</div>
						<!--/ End Top Left -->
					</div>
					<div class="col-lg-7 col-md-12 col-12">
						<!-- Top Right -->
						<div class="right-content">
							<ul class="list-main">
								<li><i class="ti-pencil"></i> <a href="#">회원가입</a></li>
								<li><i class="ti-key"></i><a href="#">로그인</a></li>
								<li><i class="ti-search"></i> <a href="#">ID/PW 찾기</a></li>
							</ul>
						</div>
						<!-- End Top Right -->
					</div>
				</div>
			</div>
		</div>
		<!-- End Topbar -->
		<div class="middle-inner">
			<div class="container">
				<div class="row">
					<div class="col-lg-2 col-md-2 col-12">
						<!-- Logo -->
						<div class="logo">
							BookPorject
							<!-- <a href="index.html"><img src="images/logo.png" alt="logo"></a> -->
						</div>
						<!--/ End Logo -->
						<!-- Search Form -->
						<div class="search-top">
							<div class="top-search"><a href="#0"><i class="ti-search"></i></a></div>
							<!-- Search Form -->
							<div class="search-top">
								<form class="search-form" method="post" action="#">
									<input type="text" placeholder="Search here..." name="search">
									<button value="search" type="submit"><i class="ti-search"></i></button>
								</form>
							</div>
							<!--/ End Search Form -->
						</div>
						<!--/ End Search Form -->
						<div class="mobile-nav"></div>
					</div>
					<div class="col-lg-8 col-md-7 col-12">
						<div class="search-bar-top">
							<div class="search-bar">
								<select>
									<option selected="selected">All</option>
									<option>도서</option>
									<option>문의</option>
									<option>창작마당</option>
									<option>...</option>
								</select>
								<form>
									<input name="search" placeholder="검색어를 입력하세요!" type="search">
									<button class="btnn"><i class="ti-search"></i></button>
								</form>
							</div>
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-12">
						<div class="right-bar">
							<!-- Search Form -->
							<div class="sinlge-bar">
								<a href="#" class="single-icon"><i class="fa fa-user-circle-o" aria-hidden="true"></i></a>
							</div>
							<div class="sinlge-bar shopping">
								<a href="#" class="single-icon"><i class="ti-bag"></i> <span class="total-count">2</span></a>
								<!-- Shopping Item -->
								<div class="shopping-item">
									<div class="dropdown-cart-header">
										<span>2 Items</span>
										<a href="#">View Cart</a>
									</div>
									<ul class="shopping-list">
										<!--<c:forEach var="shop" items="${sList }">
										<li>
											<a href="#" class="remove" title="Remove this item"><i class="fa fa-remove"></i></a>
											<a class="cart-img" href="#"><img src="https://via.placeholder.com/70x70" alt="#"></a>
											<h4><a href="#">책1</a></h4>
											<p class="quantity">1x - <span class="amount">12,000원</span></p>
										</li>
										</c:forEach>-->
										<li>
											<a href="#" class="remove" title="Remove this item"><i class="fa fa-remove"></i></a>
											<a class="cart-img" href="#"><img src="https://via.placeholder.com/70x70" alt="#"></a>
											<h4><a href="#">책1</a></h4>
											<p class="quantity">1x - <span class="amount">12,000원</span></p>
										</li>
										<li>
											<a href="#" class="remove" title="Remove this item"><i class="fa fa-remove"></i></a>
											<a class="cart-img" href="#"><img src="https://via.placeholder.com/70x70" alt="#"></a>
											<h4><a href="#">책1</a></h4>
											<p class="quantity">1x - <span class="amount">12,000원</span></p>
										</li>
									</ul>
									<div class="bottom">
										<div class="total">
											<span>Total</span>
											<span class="total-amount">45,000원</span>
										</div>
										<a href="checkout.html" class="btn animate">구매</a>
									</div>
								</div>
								<!--/ End Shopping Item -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Header Inner -->
			<div class="header-inner">
				<div class="container">
					<div class="cat-nav-head">
						<div class="row">
							<div class="col-12">
								<div class="menu-area">
									<!-- Main Menu -->
									<nav class="navbar navbar-expand-lg">
										<div class="navbar-collapse">	
											<div class="nav-inner">	
												<ul class="nav main-menu menu navbar-nav">
													<li class="active"><a href="#">Home</a></li>
													<li><a href="#">도서(부교재포함)<i class="ti-angle-down"></i></a>
														<ul class="dropdown">
															<li><a href="../book/book_main.do?cate1=가정">가정</a></li>
															<li><a href="../book/book_main.do?cate1=여가">여가</a></li>
															<li><a href="../book/book_main.do?cate1=학문">학문</a></li>
															<li><a href="../book/book_main.do?cate1=교육">교육</a></li>
															<li><a href="../book/book_main.do?cate1=문학">문학</a></li>
															<li><a href="../book/book_main.do?cate1=해외">해외</a></li>
															<li><a href="../book/book_main.do?cate1=기타">기타</a></li>
														</ul>
													</li>										
													<li><a href="#">추천<i class="ti-angle-down"></i><span class="new">New</span></a>
														<ul class="dropdown">
															<li><a href="#">신간</a></li>
															<li><a href="#">인기</a></li>
															<li><a href="#">태그</a></li>
														</ul>
													</li>
													<li><a href="../community/community.do">창작마당</a></li>	
													<li><a href="#">QnA</a></li>	
													<li><a href="../contact/contact.do">문의</a></li>
													<li><a href="#">공지사항</a></li>	
												</ul>
											</div>
										</div>
									</nav>
									<!--/ End Main Menu -->	
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--/ End Header Inner -->
		
		
		
	</header>
	<!--/ End Header -->
</body>
</html>