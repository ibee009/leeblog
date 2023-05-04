<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SIGN IN</title>
</head>
<body>
<h1 style="text-align: center;">SIGN IN</h1>
<hr>
<form action="loginaction.jsp" method ="post">
<div>
ID<input type="text" name ="userid"id ="userid" placeholder="Username"></input>
PW<input type="password" name ="userpw" id ="userpw" placeholder="Password"></input>
<input type="submit" value ="SIGN IN"></input>
</div>
</form>
<nav>
        <ul>
          <li><a href="findid.jsp">아이디 찾기</a></li>
          <li><a href="findpw.jsp">비밀번호 찾기</a></li>
          <li><a href="signup.jsp">회원가입</a></li>
        </ul>
      </nav>
</body>
</html>