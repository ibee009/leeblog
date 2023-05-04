<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deleteAccount</title>
</head>
<body>
<% 
    String userid =null;
    if(session.getAttribute("userid") !=null){
         userid = (String) session.getAttribute("userid");
    }
%>

<h1 style="text-align: center;">delete Account</h1>
<hr>
<form action="deleteAccountaction.jsp" method ="post">
Userpassword<input name="userpw" type="password">
<input type="hidden" name="userid" value="<%= userid%>">
<input type="submit" value="Submit">
</form>
</body>
