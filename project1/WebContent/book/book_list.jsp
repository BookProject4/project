<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- Breadcrumbs -->
	<div class="breadcrumbs">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="bread-inner">
						<ul class="bread-list">
							<li class="active"><a href="../book/book_list.do?cate1=${cate1 }">${cate1 }<i class="ti-arrow-right"></i></a></li>
							<li class="active"><a href="../book/book_list.do?cate1=${cate1 }&cate2=${cate2 }">${cate2 }</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Breadcrumbs -->
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
													
													<c:forEach var="cate2" items="${cList }">
													<li class="active" style="display:inline;">
													<a href="../book/book_list.do?cate1=${cate1 }&cate2=${cate2 }">${cate2 }</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													</li>
													</c:forEach>
																						
																
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
	
	
	<div class="product-area section">
		<div class="container">
			<div class="tab-content" id="myTabContent">
				<!-- Start Single Tab -->
				<div class="tab-pane fade show active" id="man" role="tabpanel">
					<div class="tab-single">
						<div class="row">
							<c:forEach var="vo" items="${list }">
								<div class="col-xl-3 col-lg-4 col-md-4 col-12">
									<div class="single-product">
										<div class="product-img">
											<a href="../book/book_detail.do?isbn=${vo.isbn }">
												<img class="default-img" src="${vo.poster }" alt="#">
												<img class="hover-img" src="${vo.poster }" alt="#">
											</a>
											<div class="button-head">
												<div class="product-action">
													<a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#">
														<i class=" ti-eye"></i><span>Quick Shop</span></a>
												</div>
												<div class="product-action-2">
													<a title="Add to cart" href="#">Add to cart</a>
												</div>
											</div>
										</div>
										<div class="product-content">
											<h3>
												<a href="../book/book_detail.do?isbn=${vo.isbn }">${vo.title }</a>
											</h3>
											<div class="product-price">
												<span>${vo.price }</span>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
			<!--/ End Single Tab -->
		</div>
	</div>

	<div class="text-center">
		<a
			href="../book/book_list.do?cate1=${cate1 }&cate2=${cate2 }&page=${curpage>1?curpage-1:curpage }"
			class="btn btn-sm btn-danger">이전</a> ${curpage } page / ${totalpage }pages
		<a
			href="../book/book_list.do?cate1=${cate1 }&cate2=${cate2 }&page=${curpage<totalpage?curpage+1:curpage }"
			class="btn btn-sm btn-danger">다음</a>
	</div>

</body>
</html>