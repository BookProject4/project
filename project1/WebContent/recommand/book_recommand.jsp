<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('.rebtn').click(function(){
		let no=$(this).attr("data-no");
		$.ajax({
			type:'post',
			url:'../recommand/book_menu.do',
			data:{"no":no},
			success:function(result)
			{
				$('#menu').html(result);
			}
		})
	})
})
</script>

</head>
<body>
<div class="wrapper row3 reserve_row">
  <main class="container clear">
    <h2 class="sectiontitle">인기 추천</h2>
    <table class="table">
      <tr>
        <td class="text-center">
         <span class="btn btn-sm btn-success rebtn"data-no="1">#계절</span>
         <span class="btn btn-sm btn-info rebtn"data-no="2">#감정</span>
         <span class="btn btn-sm btn-primary rebtn"data-no="3">#행복</span>
         <span class="btn btn-sm btn-danger rebtn"data-no="4">#크리스마스</span>
        </td>
       </tr>
	</table>
	<div id="menu">
		
	</div>
  </main>
</div>

</body>
</html>