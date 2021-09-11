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
													<c:if test="${cate1=='국내도서'}">
													<li class="active"><a href="#">국내도서</a>
														<ul class="dropdown">
															<c:forEach var="cate2" items="${cList }">
																<li><a href="../book/book_list.do?cate1=${cate1 }&cate2=${cate2 }">${cate2 }</a></li>
															</c:forEach>
														</ul>
													</li>
													</c:if>
													<c:if test="${cate1=='외국도서'}">
													<li><a href="#">외국도서</a>
														<ul class="dropdown">
															<c:forEach var="cate2" items="${cList }">
																<li><a href="../book/book_list.do?cate1=${cate1 }&cate2=${cate2 }">${cate2 }</a></li>
															</c:forEach>
														</ul>
													</li>							
													</c:if>			
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
			

</body>
</html>