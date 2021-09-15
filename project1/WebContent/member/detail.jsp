<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보</title>
</head>
<style type="text/css">
	 .form-group label{
		width:150px;
		float:left;
	 }
	 .form-group p
	 {
	 	padding-bottom: 15px;
	 }
	 .form-group legend
	 {
	 	font-size: 16px;
	 	padding-top: 15px;
	 	padding-bottom: 5px;
	 }
	 .button-wrap button {
		text-transform: uppercase;
		outline: 0;
		background: #F7941D;
		width: 100px;
		border: 0;
		padding: 10px;
		color: #FFFFFF;
		font-size: 14px;
		-webkit-transition: all 0.3 ease;
		transition: all 0.3 ease;
		cursor: pointer;
		font-family: 'Poppins', sans-serif;
		margin-top:30px;
		margin-left:50%;
	}
	.button-wrap button:hover,.form button:active,.form button:focus
	{
		background: #343a40;
	}
	
</style>
</head>
<body>
	<!-- Breadcrumbs -->
		<div class="breadcrumbs">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<div class="bread-inner">
							<ul class="bread-list">
								<li><a href="../main/main.do">Home<i class="ti-arrow-right"></i></a></li>
								<li class="active">마이페이지<i class="ti-arrow-right"></i></li>
								<li class="active"><a href="../member/detail.do">회원정보 보기</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End Breadcrumbs -->
				
		<!-- Start Checkout -->
		<section class="blog-single section">
			<div class="container">
				<div class="row">
					<div class="col-lg-8 col-12">
						<div class="detail-form">
							<!-- Form -->
							<form method="post" action="../member/detail.do" id="detailFrm" name="detailFrm">
								<div class="row2">
									<div class="col-12">
										<h2 class="blog-title">내정보</h2>
										<div class="form-group">
											<legend>로그인 정보</legend>
											<label>아이디</label>
											<p>${vo.id }</p>
										</div>
									</div>
									<div class="col-12">
										<div class="form-group">
											<label>비밀번호</label>
											<p>**********</p>
										</div>
									</div>
									<div class="col-12">
										<div class="form-group">
											<legend>회원 정보</legend>
											<label>성명</label>
											<p>${vo.name }</p>
										</div>
									</div>
									<div class="col-12">
										<div class="form-group">
											<label>생년월일</label>
											<p>${vo.birthday }</p>
										</div>
									</div>
									<div class="col-12">
										<div class="form-group">
											<label>이메일</label>
											<p>${vo.email }</p>
										</div>
									</div>
									<div class="col-12">
										<div class="form-group">
											<label>성별</label>
											<p>${vo.sex }</p>
										</div>
									</div>
									<div class="col-12">
										<div class="form-group">
											<label>전화번호</label>
											<p>${vo.tel }</p>
										</div>
									</div>
									<div class="col-12">
										<div class="form-group">
											<div class="inline">
										 <label>우편번호</label>
		          							<p>${vo.post }</p>
										</div>
									   </div>
									</div>
									<div class="col-12">
										<div class="form-group">
											<label>주소</label>
											<p>${vo.addr1 }</p>
										</div>
									</div>
									<div class="col-12">
										<div class="form-group">
											<label>상세주소</label>
											<p>${vo.addr2 }</p>
										</div>
									</div>
									<div class="button-wrap">
									<button onclick="location.href='../member/update.do'; return false;">수정</button>
									</div>
								    </div>
						        </form>
						       <!--/ End Form -->
						   	</div>
					  </div>
					  <div class="col-lg-4 col-12">
						<div class="main-sidebar">
							<!-- Single Widget -->
							<div class="single-widget category">
								<h3 class="title">마이페이지</h3>
								<ul class="categor-list">
									<li><a href="../member/detail.do">회원정보 보기</a></li>
									<li><a href="../member/update.do">회원정보 수정</a></li>
									<li><a href="../member/delete.do">회원탈퇴</a></li>
								</ul>
							</div>
							<!--/ End Single Widget -->
							<!-- Single Widget -->
							<div class="single-widget category">
								<h3 class="title">Blog Categories</h3>
								<ul class="categor-list">
									<li><a href="#">Men's Apparel</a></li>
									<li><a href="#">Women's Apparel</a></li>
									<li><a href="#">Bags Collection</a></li>
									<li><a href="#">Accessories</a></li>
									<li><a href="#">Sun Glasses</a></li>
								</ul>
							</div>
							<!--/ End Single Widget -->
							<!-- Single Widget -->
							<div class="single-widget category">
								<h3 class="title">Blog Categories</h3>
								<ul class="categor-list">
									<li><a href="#">Men's Apparel</a></li>
									<li><a href="#">Women's Apparel</a></li>
									<li><a href="#">Bags Collection</a></li>
									<li><a href="#">Accessories</a></li>
									<li><a href="#">Sun Glasses</a></li>
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