<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="upload.uploadDAO" %>
<%@ page import="java.sql.ResultSet"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String id = request.getParameter("id");
String bulletin = request.getParameter("bulletin");
String title = request.getParameter("title");
String number = request.getParameter("number");
%>

<h1 style="text-align: center;"><%=title %></h1>
<hr>
<%=bulletin%>
<form action="postupdate.jsp" method="post">
<input type="hidden" name="number" value="<%=number%>">
<input type="hidden" name="id" value="<%=id%>">
<input type="submit" value="update" name="update">
</form>

<form action="postdelete.jsp" method="post">
<input type="hidden" name="number" value="<%=number%>">
<input type="hidden" name="id" value="<%=id%>">
<input type="submit" value="delect">
</form>
</body>
</html>