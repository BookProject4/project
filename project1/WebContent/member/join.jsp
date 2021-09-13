<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="../shadow/css/shadowbox.css">
<script type="text/javascript" src="../shadow/js/shadowbox.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
Shadowbox.init({
	players:['iframe']
})
$(function(){
	// 아이디 중복 확인 버튼
	$('#idBtn').click(function(){
		Shadowbox.open({
			content:'../member/idcheck.jsp',
			player:'iframe',
			width:340,
			height:200
		})
	})
	// 우편번호 검색 버튼
	$('#postBtn').click(function(){
		Shadowbox.open({
			content:'../member/postfind.jsp',
			player:'iframe',
			width:530,
			height:350
		})
	})
	$('#sendBtn').click(function(){
		// 비밀번호
		let pwd=$('#pwd').val();
		if(pwd.trim()=="")
		{
			$('#pwd').focus();
			return;
		}
		// 비밀번호 확인
		let pwd1=$('#pwd1').val();
		if(pwd!=pwd1)
		{
			$('#pwd1').focus();
			return;
		}
		// 이름 
		let name=$('#name').val();
		if(name.trim()=="")
		{
			$('#name').focus();
			return;
		}
		// 생년월일
		let birth=$('#birthday').val();
		if(birth.trim()=="")
		{
			$('#birthday').focus();
			return;
		}
		// 이메일
		let email=$('#email').val();
		if(email.trim()=="")
		{
			$('#email').focus();
			return;
		}
		// 전화번호
		let tel2=$('#tel').val();
		if(tel2.trim()=="")
		{
			$('#tel').focus();
			return;
		}
		
		// 정상수행 
		$('#joinFrm').submit();
	})
})
</script>
<style type="text/css">
 .row2{
 	width:2000px;
 	margin:30px;
 	height:950px;
 }
 label{
	width:150px;
	float:left;
}
 div.container div div div p
 {
 	padding-bottom: 20px;
 }
 legend
 {
 	font-size: 16px;
 	padding-top: 15px;
 }
 form button {
		  text-transform: uppercase;
		  outline: 0;
		  background: #F7941D;
		  width: 80%;
		  border: 0;
		  padding: 15px;
		  color: #FFFFFF;
		  font-size: 14px;
		  -webkit-transition: all 0.3 ease;
		  transition: all 0.3 ease;
		  cursor: pointer;
		  font-family: 'Poppins', sans-serif;
		  margin-top:50px;
		}
	form button:hover,.form button:active,.form button:focus {
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
								<li class="active"><a href="../member/join.do">회원가입</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End Breadcrumbs -->
				
		<!-- Start Checkout -->
			<div class="container">
				<div class="row2"> 
					<div class="col-lg-8 col-12">
						<div class="join-form">
							<h2>회원가입</h2>
							<p>회원 전용 서비스를 편리하게 이용하세요.</p>
							<!-- Form -->
							<form method="post" action="../member/join_ok.do" id="joinFrm" name="joinFrm">
								<div class="row">
									<div class="col-sm-4 col-sm-8">
										<div class="form-group">
											<legend>로그인 정보</legend>
											<label>아이디<span>*</span></label>
											<input type="text" name=id id=id size=20 placeholder="" readonly>
											<input type=button value="확인" id="idBtn" class="btn btn-sm btn-warning">
										</div>
									</div>
									<div class="col-sm-4 col-sm-8">
										<div class="form-group">
											<label>비밀번호<span>*</span></label>
											<input type="password" name="pwd" id="pwd" size=20 placeholder="" required="required">
										</div>
									</div>
									<div class="col-sm-4 col-sm-8">
										<div class="form-group">
											<label>비밀번호 확인<span>*</span></label>
											<input type="password" name="pwd1" id="pwd1" size=20 placeholder="" required="required">
										</div>
									</div>
									<div class="col-sm-4 col-sm-8">
										<div class="form-group">
											<legend>회원 정보</legend>
											<label>성명<span>*</span></label>
											<input type="text" name="name" id="name" size=20 placeholder="" required="required">
										</div>
									</div>
									<div class="col-sm-4 col-sm-8">
										<div class="form-group">
											<label>생년월일<span>*</span></label>
											<input type="date" name="birthday" id="birthday" placeholder="" required="required">
										</div>
									</div>
									<div class="col-sm-4 col-sm-8">
										<div class="form-group">
											<label>이메일<span>*</span></label>
											<input type="email" name="email" id="email" size=20 placeholder="" required="required">
										</div>
									</div>
									<div class="col-sm-4 col-sm-8">
										<div class="form-group">
											<label>성별<span>*</span></label>
											<input type="radio" value="남자" name=sex checked>남성
		           							<input type="radio" value="여자" name=sex>여성
										</div>
									</div>
									<div class="col-sm-4 col-sm-8">
										<div class="form-group">
											<label>전화번호<span>*</span></label>
											<input type=text name=tel id="tel" size=20 placeholder="" required="required">
										</div>
									</div>
									<div class="col-sm-4 col-sm-8">
										<div class="form-group">
											<div class="inline">
										 <label>우편번호<span>*</span></label>
											<input type=text name=post1 id="post1" size=10 readonly>-<input type=text id=post2 name=post2 size=10 readonly>
		          							<input type=button value="찾기" class="btn btn-sm btn-warning" id=postBtn>
										</div>
									   </div>
									</div>
									<div class="col-sm-4 col-sm-8">
										<div class="form-group">
											<label>주소<span>*</span></label>
											<input type=text name=addr1 id="addr1" size=55 placeholder="" required="required">
										</div>
									</div>
									<div class="col-sm-4 col-sm-8">
										<div class="form-group">
											<label>상세주소</label>
											<input type=text name=addr2 id="addr2" size=55 placeholder="">
										</div>
									</div>
									<div class="col-sm-4 col-sm-8">
									<div class="form-group">
										<button id=sendBtn name=sendBtn>회원가입</button>
									</div>
									</div>
								</div>
							</form>
							<!--/ End Form -->
						</div>
					</div>
				</div>
			</div>
</body>
</html>