<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.loginDAO"%>
<%@ page import="user.loginDTO"%>
<%@ page import="upload.uploadDAO"%>
<%@ page import="upload.uploadDTO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
    String userid =null;
    if(session.getAttribute("userid") !=null){
         userid = (String) session.getAttribute("userid");
    }
    String id = (String) request.getParameter("id");
%>
<h2>게시글 작성</h2>
      <h4>작성자:
      <%=
      userid
      %>
      </h4>
      <form action="update.jsp" method="post">
      <input type="hidden" name="userid" value="<%=id %>">
      <h3>title</h3>
      <input type="text" name="title"> 
      <br>
      <h3>main</h3>
      <textarea rows="5" cols="50" name="bulletin"></textarea>
      <br>
      <input type="submit" value="update">
      </form>
</body>
</html>