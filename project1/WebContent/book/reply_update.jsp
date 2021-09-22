<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Meta Tag -->
<meta charset="utf-8">

</head>
<body>
	<form method=post class="form" action="../book/reply_update.do">
		<input type="hidden" name="isbn" value="${isbn }">
		<input type="hidden" name="no" value="${no }">
		<textarea cols=100 rows=20 name="msg" placeholder="" id="msg">${msg }</textarea>
		<input type="submit" id="iBtn" class="btn" value="수정">
		<input type="button" class="btn" value="취소" onclick="javascript:history.back()">
	</form>
</body>
</html>