<%@page import="com.sist.dao.CommunityDAO"%>
<%@page import="java.net.URL"%>
<%@page import="com.sist.vo.CommunityVO"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="wrapper row3">
  <main class="container clear">
    <table class="table">
      <tr>
        <th class="text-center" width=20%>번호</th>
        <td class="text-center" width=30%>${vo.no }</td>
        <th class="text-center" width=20%>작성일</th>
        <td class="text-center" width=30%>${vo.regdate }</td>
      </tr>
      <tr>
        <th class="text-center" width=20%>이름</th>
        <td class="text-center" width=30%>${vo.name }</td>
        <th class="text-center" width=20%>조회수</th>
        <td class="text-center" width=30%>${vo.hit }</td>
      </tr>
      <tr>
        <th class="text-center" width=20%>제목</th>
        <td colspan="3">${vo.subject }</td>
      </tr>
      
      <tr>
        <th class="text-center" width=20%>그림</th>
        <td colspan="3"><img src="../img/${vo.filename }" width="100px" height="100px"></td>
      </tr>
      <tr>
        <td colspan="4" class="text-left" valign="top" height="200">
         <pre style="white-space: pre-wrap;border:none;background-color:white">${vo.content }</pre>
        </td>
      </tr>
      <tr>
        <td colspan="4" class="text-right">
          <a href="../community/update.do?no=${vo.no }" class="btn btn-xs btn-success">수정</a>
          <a href="../community/delete.do?no=${vo.no }" class="btn btn-xs btn-info">삭제</a>
          <a href="../community/list.do" class="btn btn-xs btn-warning">목록</a>
        </td>
      </tr>
    </table>
    <div id="comments">
        <h2>댓글</h2>
        <ul>
         <c:forEach var="rvo" items="${list }">
	          <li>
	            <article>
	              <header>
	                <figure class="avatar">
	                  <c:if test="${sessionScope.id==rvo.id }">
	                    <a href="#" class="btn btn-xs btn-danger" style="color:black">수정</a>
	                    <a href="#" class="btn btn-xs btn-success" style="color:black">삭제</a>
	                  </c:if>
	                </figure>
	                <address>
	                By <a href="#">${rvo.name }</a>
	                </address>
	                <span>(${rvo.dbday })</span>
	              </header>
	              <div class="comcont">
	                <p>${rvo.msg }</p>
	              </div>
	            </article>
	          </li>
          </c:forEach>
         </ul>
      </div>
  </main>
</div>
</body>
</html>