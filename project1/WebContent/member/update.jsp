<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<style type="text/css">
	 label{
		width:150px;
		float:left;
	 }
	 .form-group input
	 {
	 	margin-bottom: 10px;
	 }
	 legend
	 {
	 	font-size: 16px;
	 	padding-top: 15px;
	 	padding-bottom: 10px;
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
			  margin-left:35%;
	}
	.button-wrap button:hover,.form button:active,.form button:focus 
	{
			  background: #343a40;
	}
</style>
<link rel="stylesheet" href="../shadow/css/shadowbox.css">
<script type="text/javascript" src="../shadow/js/shadowbox.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
Shadowbox.init({
	players:['iframe']
})
$(function(){
	$('#postBtn').click(function(){
		Shadowbox.open({
			content:'../member/postfind_update.jsp',
			player:'iframe',
			width:530,
			height:350
		})
	})
})
</script>
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
								<li class="active"><a href="../member/update.do">회원정보 수정</a></li>
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
				<div class="row2"> 
					<div class="col-lg-8 col-12">
						<div class="update-form">
							<!-- Form -->
							 <form method="post" action="../member/update_ok.do" id="updateFrm" name="updateFrm">
								<div class="row">
									<div class="col-12">
										<div class="form-group">
											<h2 class="blog-title">회원정보 수정</h2>
											<p>변경된 주소나 연락처, 이메일 주소를 수정해주세요</p>
											<legend>로그인 정보</legend>
										</div>
									</div>
									<div class="col-12">
										<div class="form-group">
											<label>비밀번호 확인<span>*</span></label>
											<input type="password" name="pwd" id="pwd" size=20 placeholder="" required="required">
										</div>
									</div>
									<div class="col-12">
										<div class="form-group">
											<legend>회원 정보</legend>
											<label>성명<span>*</span></label>
											<input type="text" name="name" id="name" size=20 placeholder="" required="required" value="${vo.name }">
										</div>
									</div>
									<div class="col-12">
										<div class="form-group">
											<label>생년월일<span>*</span></label>
											<input type="date" name="birthday" id="birthday" placeholder="" required="required" value="${vo.birthday }">
										</div>
									</div>
									<div class="col-12">
										<div class="form-group">
											<label>이메일<span>*</span></label>
											<input type="email" name="email" id="email" size=20 placeholder="" required="required" value="${vo.email }">
										</div>
									</div>
									<div class="col-12">
										<div class="form-group">
											<label>성별<span>*</span></label>
											<input type="radio" value="남자" name=sex checked>남자
		           							<input type="radio" value="여자" name=sex>여자
										</div>
									</div>
									<div class="col-12">
										<div class="form-group">
											<label>전화번호<span>*</span></label>
											<input type=text name=tel id="tel" size=20 placeholder="" required="required" value="${vo.tel }">
										</div>
									</div>
									<div class="col-12">
										<div class="form-group">
											<div class="inline">
										 	<label>우편번호<span>*</span></label>
											<input type=text name=post1 id="post1" size=7 readonly value="${vo.post.substring(0,3)}">-<input type=text id=post2 name=post2 size=7 readonly value="${vo.post.substring(4,7)}">
											<input type=button value="검색" class="btn btn-sm btn-warning" id=postBtn>
										</div>
									   </div>
									  
									</div>
									<div class="col-12">
										<div class="form-group">
											<label>주소<span>*</span></label>
											<input type=text name=addr1 id="addr1" size=40 placeholder="" required="required" value="${vo.addr1 }">
										</div>
									</div>
									<div class="col-12">
										<div class="form-group">
											<label>상세주소</label>
											<input type=text name=addr2 id="addr2" size=40 placeholder="" value="${vo.addr2 }">
										</div>
									</div>
									<div class="col-12">
										<div class="form-group">
											<div class="button-wrap">
												<button class=submit>정보 수정</button>
											</div>
										</div>
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
									<li><a href="../member/detail.do">내 정보</a></li>
									<li><a href="../member/update.do">회원정보 수정</a></li>
									<li><a href="../member/delete.do">회원탈퇴</a></li>
									<li><a href="#">배송주소록</a></li>
									<li><a href="#">마이리뷰</a></li>
								</ul>
							</div>
							<!--/ End Single Widget -->
							<!-- Single Widget -->
							<div class="single-widget category">
								<h3 class="title">주문내역</h3>
								<ul class="categor-list">
									<li><a href="#">주문조회/변경/취소</a></li>
									<li><a href="#">반품/교환 내역</a></li>
									<li><a href="#">취소 주문 내역</a></li>
									<li><a href="#">eBook 구매목록</a></li>
								</ul>
							</div>
							<!--/ End Single Widget -->
							<!-- Single Widget -->
							<div class="single-widget category">
								<h3 class="title">고객센터</h3>
								<ul class="categor-list">
									<li><a href="#">나의계정 도움말</a></li>
									<li><a href="#">자주 묻는 질문 FAQ</a></li>
									<li><a href="#">공지사항</a></li>
									<li><a href="#">1:1 고객상담</a></li>
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