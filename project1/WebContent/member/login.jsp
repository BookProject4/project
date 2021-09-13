<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>LOGIN</title>
  <meta charset="utf-8">
  <style type="text/css">

		.login login-page {
		  width: 360px;
		  padding: 8% 0 0;
		  margin: auto;
		}
		.login form {
		  position: relative;
		  z-index: 1;
		  background: #FFFFFF;
		  max-width: 360px;
		  margin: 150px auto 200px;
		  padding: 45px;
		  text-align: center;
		  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
		}
		.login form input {
		  outline: 0;
		  background: #f2f2f2;
		  width: 100%;
		  border: 0;
		  margin: 0 0 15px;
		  padding: 15px;
		  box-sizing: border-box;
		  font-size: 14px;
		}
		.login form button {
		  text-transform: uppercase;
		  outline: 0;
		  background: #F7941D;
		  width: 100%;
		  border: 0;
		  padding: 15px;
		  color: #FFFFFF;
		  font-size: 14px;
		  -webkit-transition: all 0.3 ease;
		  transition: all 0.3 ease;
		  cursor: pointer;
		  font-family: 'Poppins', sans-serif;
		}
		.login form button:hover,.form button:active,.form button:focus {
		  background: #343a40;
		}
		.login form .message {
		  margin: 15px 0 0;
		  color: #b3b3b3;
		  font-size: 12px;
		}
		
		.login form .message a {
		  color: #F7941D;
		  text-decoration: none;
		}

		.login container {
		  position: relative;
		  z-index: 1;
		  max-width: 300px;
		  margin: 0 auto;
		}
		.login container:before, .container:after {
		  content: "";
		  display: block;
		  clear: both;
		}
		.login container .info {
		  margin: 50px auto;
		  text-align: center;
		}
		.login container .info h1 {
		  margin: 0 0 15px;
		  padding: 0;
		  font-size: 36px;
		  font-weight: 300;
		  color: #1a1a1a;
		}
		.login container .info span {
		  color: #4d4d4d;
		  font-size: 12px;
		}
		.login container .info span a {
		  color: #000000;
		  text-decoration: none;
		}
		.login container .info span .fa {
		  color: #EF3B3A;
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
						alert("아이디 또는 비밀번호가 잘못 입력되었습니다\n아이디와 비밀번호를 정확히 입력해 주세요");
						$('#log_id').val("");
						$('#log_pwd').val("");
						$('#log_id').focus();
					}
					else if(result=='NOPWD')
					{
						alert("아이디 또는 비밀번호가 잘못 입력되었습니다\n아이디와 비밀번호를 정확히 입력해 주세요");
						$('#log_pwd').val("");
						$('#log_pwd').focus();
					}
					else
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
	
		   <div class="login">
			<div class="login-page">
			  <div class="form">
			    <form class="login-form">
			      <img src="../layout/images/logo.png">
			      <input type="text" placeholder="username" id="log_id" name="id"/>
			      <input type="password" placeholder="password" id="log_pwd" name="pwd"/>
				  <button id="logBtn" name="logBtn">로그인</button>
			      <p class="message">
			      <!-- 넣을지 말지 고민!!! ID/PWD 찾기 -->
			      	<a href="#">아이디</a>
			      	/ <a href="#">비밀번호 찾기</a><br>
			      	아직 계정이 없으신가요? <a href="../member/join.do">회원가입</a>
			      </p>
			    </form>
			  </div>
			</div>
		   </div>
</body>
</html>