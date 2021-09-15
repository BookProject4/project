<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 회원정보 보기</title>
</head>
<style type="text/css">
	 .form-group legend
	 {
	 	font-size: 16px;
	 	padding-top: 15px;
	 	padding-bottom: 5px;
	 }
	 .form-group label{
		width:150px;
		float:left;
		margin-top: 10px;
		margin-bottom: 10px;
	 }
	 .form-group p
	 {
	 	padding-bottom: 15px;
	 }
	 .form-group input
	 {
	 	margin-top: 10px;
	 }
	 .button-wrap button {
		text-transform: uppercase;
		outline: 0;
		background: #F7941D;
		width: 110px;
		border: 0;
		padding: 10px;
		color: #FFFFFF;
		font-size: 14px;
		-webkit-transition: all 0.3 ease;
		transition: all 0.3 ease;
		cursor: pointer;
		font-family: 'Poppins', sans-serif;
		margin-top:30px;
		margin-left:65%;
	}
	.button-wrap button:hover,.form button:active,.form button:focus
	{
		background: #343a40;
	}
	.box blockquote
	{
		margin-top: 30px;
	}
	.box input
	{
		font-size:14px;
		margin-left:90%;
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
								<li class="active"><a href="../member/delete.do">회원탈퇴</a></li>
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
					<div class="blog-single-main">
					<div class="row2">
					 <div class="col-12">
						<div class="detail-form">
							<!-- Form -->
							<form method="post" action="../member/delete_ok.do">
								<div class="row">
									<div class="col-12">
										<div class="form-group">
											<h2 class="blog-title">회원탈퇴</h2>
											<legend></legend>
											<label>비밀번호 확인<sapn>*</sapn></label>
											<input type="password" name="pwd" id="pwd" size=20 placeholder="" required="required">
										</div>
									</div>
									<div class="col-12">
										<div class="box">
											<blockquote>
											<i class="fa fa-quote-left"></i>
											<br><b>개인정보 수집, 이용, 제공에 대한 동의 철회</b><br><br>
											① 회원가입 등을 통해 개인정보의 수집, 이용, 제공에 대해 이용자께서 동의하신 내용을 이용자는 언제든지 철회하실 수 있습니다.
											    동의 철회를 하고 개인정보를 파기하는 등의 조치를 한 경우에는 그 사실을 이용자께 바로 통지하도록 하겠습니다.<br>
											② 개인정보의 수집에 대한 동의 철회(계정 삭제)를 개인정보를 수집하는 방법보다 쉽게 할 수 있도록 필요한 조치를 하겠습니다.<br>
											<br><b>개인정보의 보유 및 이용 기간</b><br><br>
											① 이용자의 개인정보는 다음과 같이 개인정보의 수집목적 또는 제공받은 목적이 달성되면 파기됩니다.
											단, 상법 등 법령의 규정에 의하여 보존할 필요성이 있는 경우에는 예외로 합니다.<br>
											② 위 개인정보 수집목적 달성 시 즉시 파기 원칙에도 불구하고 다음과 같이 거래 관련 권리 의무 관계의 확인 등을
											이유로 일정 기간 보유하여야 할 필요가 있으면 '전자상거래 등에서의 소비자보호에 관한 법률' 등에 근거하여 일정 기간 보유합니다.<br>
											<br><b>개인정보의 파기 절차 및 방법</b><br><br>
											① 파기 절차<br>
											- 이용자가 회원가입 등을 위해 입력한 정보는 이용목적이 달성된 후 별도의 DB로 옮겨져(종이의 경우 별도의 서류함)
											내부 방침 및 기타 관련 법령에 의한 정보보호 사유에 따라(보유 및 이용 기간 참조) 일정 기간 저장된 후 파기됩니다.<br>
											- 동 개인정보는 법률에 의한 경우가 아니고서는 보유되는 이외의 다른 목적으로 이용되지 않습니다.<br>
											② 파기 방법<br>
											- 종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다.<br>
											- 전자적 파일 형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.<br>
											</blockquote>
											<input id="1" type="checkbox" required> 동의</label>
										</div>
									</div>
									<div class="col-sm-4 col-sm-8">
										<div class="button-wrap">
											<button>회원탈퇴</button>
										</div>
									</div>
								    </div>
						        </form>
						       <!--/ End Form -->
						   	</div>
						  </div>
					  </div>
					</div>
				</div>
					  <div class="col-lg-4 col-12">
						<div class="main-sidebar">
							<!-- Single Widget -->
							<div class="single-widget category">
								<h3 class="title">마이페이지</h3>
								<ul class="categor-list">
									<li><a href="../member/detail.do">내 정보</a></li>
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