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
	   width:450px;
	}
	button {
		  text-transform: uppercase;
		  outline: 0;
		  background: #F7941D;
		  width: 50px;
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
	   $('#postBtn').click(function(){
			let dong=$('#dong').val();
			if(dong.trim()=="")
			{
				$('#dong').focus();
				return;
			}
			$.ajax({
				type:'post',
				url:'../member/postfind_update.do',
				data:{"dong":dong},
				success:function(res)
				{
					$('#print').html(res);
				}				
			})
	    })	
	})
</script>
</head>
<body>
  <div class="container">
    <div class="row">
      <table class="table">
		<caption>　우편번호 찾기</caption>
       <tr>
         <td>
         지번주소 : <input type=text name=dong id=dong size=28 class="input-sm" placeholder="※ 동/읍/면/리 이름을 입력하세요">
         <button id="postBtn">찾기</button>
         </td>
       </tr>
      </table>
      <div id="print"></div>
    </div>
  </div>
</body>
</html>