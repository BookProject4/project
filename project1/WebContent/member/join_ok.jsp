<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
	.join_ok{
		margin: 120px auto 200px;
		text-align: center;
	}
	.message{
		text-align: center;
		font-family: 'Poppins', sans-serif;
		color: #343a40;
	}
	.message button {
		  text-transform: uppercase;
		  outline: 0;
		  background: #343a40;
		  width: 130px;
		  border: 0;
		  padding: 15px;
		  color: #FFFFFF;
		  font-size: 14px;
		  -webkit-transition: all 0.3 ease;
		  transition: all 0.3 ease;
		  cursor: pointer;
		  font-family: 'Poppins', sans-serif;
		  margin: 20px;
		}
		.message button:hover,.form button:active,.form button:focus {
		  background: #F7941D;
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
								<li class="active"><a href="../member/join_ok.do">회원가입</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End Breadcrumbs -->
		
	<div class="container">	
	<div class="join_ok">
	 <img width=300px height=100px src="../member/check.png">
		<div class="message">
			<h2>회원가입이 완료되었습니다</h2><br>
			<label>이제 홈페이지에서 제공하는 모든 서비스를 편리하게 이용할 수 있습니다</label>
			<p class="message"><br>
			   <button id="loginBtn" onClick="location.href='../member/login.do'">로그인</button>
			</p>
	 </div>
	 </div>
	</div>
</body>
</html>