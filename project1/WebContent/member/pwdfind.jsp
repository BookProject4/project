<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
	.container{
  		margin-top: 40px;
	}
	.row {
	   margin: 0px auto;
	   width:350px;
	}
	.find_form label{
		width: 120px;
		text-align: right;
		margin-top: 10px;
	}
	.table tr{
		border: hide;
	}
	button {
		  text-transform: uppercase;
		  outline: 0;
		  background: #F7941D;
		  width: 20%;
		  border: 0;
		  padding: 6px;
		  color: #FFFFFF;
		  font-size: 12px;
		  -webkit-transition: all 0.3 ease;
		  transition: all 0.3 ease;
		  cursor: pointer;
		  font-family: 'Poppins', sans-serif;
		}
	button:hover,.form button:active,.form button:focus {
		  background: #343a40;
		}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#pwdfindBtn').click(function(){
		// 이름 입력 확인
		let name=$("#find_name").val();
		if(name.trim()=="")
		{
			$('#find_name').focus();
			return;
		}
		// 아이디 입력 확인
		let id=$("#find_id").val();
		if(id.trim()=="")
		{
			$('#find_id').focus();
			return;
		}
		// 이메일 입력 확인
		let email=$("#find_email").val();
		if(email.trim()=="")
		{
			$('#find_email').focus();
			return;
		}
		$.ajax({
			type:'POST',
			url:'../member/pwdfind.do',
			data:{"id":id,"name":name,"email":email}, // 데이터 전송
			success:function(res) //정상수행시에 => res는 실행된 모든 데이터를 읽어온다 
			{
				let pwd=res.trim();
				if(pwd=="$nonepwd")
				{
					$('#result').html('다시 입력해 주세요');
					$('#pwdfindBtn').hide();
					$('#okBtn').show();
				}
				else 
				{
					$('#result').html(pwd);
					$('#findpwd').hide();
					$('#modifypwd').show();
				}
			}
		})
	})
	$('#okBtn').click(function(){
		parent.Shadowbox.close();
	})
})
</script>
</head>
<body>
	 <div class="container">
     <div class="row">
      <table class="table" id="findpwd">
      <caption>　비밀번호 찾기</caption>
      <tr>
      <td class="find_form" id="findfrm">
      <label>이름 :　</label><input type=text id=find_name size=20 class="input-sm" placeholder="">
      <label>아이디 :　</label><input type=text id=find_id size=20 class="input-sm" placeholder="">
	  <label>이메일 :　</label><input type=email id=find_email size=20 class="input-sm" placeholder="">
      </td>
      </tr>
       <tr>
       	 <td class="text-center">
         <button id="pwdfindBtn">찾기</button>
         </td>
       </tr>
      <tr>
         <td class="text-center" id="result"></td>
	  </tr>
       <tr id="ok">
         <td class="text-center" style="display:none">
           <button id="okBtn">확인</button>
         </td>
       </tr>
       </table>
       <table class="table" id="modifypwd" style="display:none">
       <caption>　비밀번호 수정</caption>
       <tr>
         <td class="find_form">
         <label>비밀번호 :　</label><input type=text id=modify_pwd size=20 class="input-sm" placeholder="">
         <label>비밀번호 확인 :　</label><input type=text id=modify_pwd1 size=20 class="input-sm" placeholder="">
         </td>
       </tr>
        <tr>
         <td class="text-center">
           <button id="okBtn">확인</button>
         </td>
       </tr>
      </table>
     </div>
   </div>
</body>
</html>