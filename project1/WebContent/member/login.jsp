<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>LOGIN</title>
  <meta charset="utf-8">
  <style type="text/css">

		.login-page login-page {
		  width: 360px;
		  padding: 8% 0 0;
		}
		.login-page form {
		  position: relative;
		  z-index: 1;
		  background: #FFFFFF;
		  max-width: 360px;
		  margin: 80px auto 80px;
		  padding: 45px;
		  text-align: center;
		  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
		}
		.login-page form input {
		  outline: 0;
		  background: #f2f2f2;
		  width: 100%;
		  border: 0;
		  margin: 0 0 15px;
		  padding: 15px;
		  box-sizing: border-box;
		  font-size: 14px;
		}
		.button-wrap button{
		  text-transform: uppercase;
		  outline: 0;
		  background: #343a40;
		  width: 100%;
		  border: 0;
		  padding: 13px;
		  color: #FFFFFF;
		  font-size: 16px;
		  -webkit-transition: all 0.3 ease;
		  transition: all 0.3 ease;
		  cursor: pointer;
		}
		.button-wrap button:hover,.button-wrap button:active,.button-wrap button:focus {
		  background: #F7941D;
		  color: #FFFFFF;
		}
		.login-page form .message {
		  margin: 15px 0 0;
		  color: #b3b3b3;
		  font-size: 12px;
		}
		
		.login-page form .message a {
		  color: #F7941D;
		  text-decoration: none;
		}

		.login-page container {
		  position: relative;
		  z-index: 1;
		  max-width: 300px;
		  margin: 0 auto;
		}
		.login-page container:before, .container:after {
		  content: "";
		  display: block;
		  clear: both;
		}
		form img{
			padding: 30px;
		}
  </style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#logBtn').click(function(){
		let id=$('#log_id').val();
		if(id.trim()=="")
		{
			$('#log_id').focus();
			return;
		}
		let pwd=$('#log_pwd').val();
		if(pwd.trim()=="")
		{
			$('#log_pwd').focus();
			return;
		}
	$.ajax({
		type:'post',
		url:'../member/loginok.do',
		data:{"id":id,"pwd":pwd},
		success:function(res)
		{
			let result=res.trim();
			if(result=='NOID')
			{
				alert("아이디가 존재하지 않습니다\n다시 입력하세요");
				$('#log_id').val("");
				$('#log_pwd').val("");
				$('#log_id').focus();
			}
			else if(result=='NOPWD')
			{
				alert("비밀번호가 틀립니다\n다시 입력하세요");
				$('#log_pwd').val("");
				$('#log_pwd').focus();
			}
			else // 로그인 
			{
				location.href="../main/main.do";
			}
		}
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
								<li class="active"><a href="../member/login.do">로그인</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End Breadcrumbs -->
		<section class="blog-single section">
			<div class="login-page">
			  <div class="form">
			    <form class="login-form">
			      <img src="../template/images/logo.png">
			      <input type="text" placeholder="아이디" id="log_id" name="log_id"/>
			      <input type="password" placeholder="비밀번호" id="log_pwd" name="log_pwd"/>
			      <div class="button-wrap">
			      <button id="logBtn" class="button">로그인</button>
				  </div>
			      <p class="message">
			      	<a href="#">아이디</a>
			      	/ <a href="#">비밀번호 찾기</a><br>
			      	아직 계정이 없으신가요? <a href="../member/join.do">회원가입</a>
			      </p>
			    </form>
			  </div>
			</div>
		  </section>
</body>
</html>