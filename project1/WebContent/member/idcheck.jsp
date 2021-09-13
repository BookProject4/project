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
  		margin-top: 20px;
	}
	.row {
	   margin: 0px auto;
	   width:300px;
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
	$('#idcheckBtn').click(function(){
		// id입력 확인
		let id=$("#id").val();
		if(id.trim()=="")
		{
			$('#id').focus();
			return;
		}
		// 요청처리 , 응답처리를 동시에 한다 
		$.ajax({
			type:'POST',
			url:'../member/idcheck.do',
			data:{"id":id}, // 데이터 전송 idcheck.do?id=hong
			success:function(res) //정상수행시에 => res는 실행된 모든 데이터를 읽어온다 
			{
				let count=res.trim();// 출력된 숫자를 받는다 (0,1)
				if(count==0) //id가 없는 경우
				{
					$('#result').html('<span style="color:#343a40">'+id+'는(은) 사용 가능합니다</span>');
					$('#ok').show(); // 확인 버튼 출력 
				}
				else //id가 있는 경우
				{
					$('#result').html('<span style="color:#343a40">'+id+'는(은) 이미 사용 중입니다</span>');
				}
			}
		})
	})
	$('#okBtn').click(function(){
		parent.joinFrm.id.value=$('#id').val();// 사용가능한 id를 회원가입창에 전송
		parent.Shadowbox.close();// Shadowbox 닫기 
	})
})
</script>
</head>
<body>
	 <div class="container">
     <div class="row">
      <table class="table">
      <caption>　아이디 중복 확인</caption>
       <tr>
         <td class="text-center">
         <input type=text id=id size=20 class="input-sm" placeholder="아이디를 입력하세요">
         <button id="idcheckBtn">확인</button>
         
         </td>
       </tr>
       <tr>
         <td class="text-center" id="result"></td>
       </tr>
       <tr id="ok" style="display:none">
         <td class="text-center">
           <button id="okBtn">사용</button>
         </td>
       </tr>
      </table>
     </div>
   </div>
</body>
</html>