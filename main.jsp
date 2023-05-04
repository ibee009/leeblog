<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.loginDAO" %>
<%@ page import="upload.uploadDAO" %>
<%@ page import="java.sql.ResultSet"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 CDN 주소 추가 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
<% 
    String userid =null;
    if(session.getAttribute("userid") !=null){
         userid = (String) session.getAttribute("userid");
    }
%>
    <header>
      <h1 style="text-align: center;">LEE BLOG</h1>
      <hr>
      <nav>
      <h2>계정</h2>
        <ul>
          <li><a href="main.jsp">Home</a></li>
          <li><a href="#">게시판</a></li>
          <li>
          <%
          if(userid == null){
          %>
          <a href="login.jsp">로그인</a>
          <%
          } else{
          %>
          <a href="userinfo.jsp">회원정보</a>
          <%
          }
          %>
          </li>
        </ul>
    </nav>
    </header>
    <main>
      <section>
        <h2>게시글</h2>
        <ul>
          <% uploadDAO uploadDAO = new uploadDAO();
          ResultSet result = uploadDAO.upload();
          while(result.next()) {
          %>
          <li>
          <a href="post.jsp?id=<%=result.getString("id")%>&bulletin=<%=result.getString("bulletin")%>&title=<%=result.getString("title")%>&number=<%=result.getString("number")%>">
          <%= result.getString("title")%>
          (<%= result.getString("id")%>)
          </a></li>
          <% } %>
        </ul>
      </section>
      <form action="upload.jsp" method ="post">
      <h2>게시글 작성</h2>
      <h4>작성자:
      <%=
      userid
      %>
      </h4>
      <input type="hidden" name="userid" value="<%= userid %>">
      <h3>title</h3>
      <input type="text" name="title"> 
      <br>
      <h3>main</h3>
      <textarea rows="5" cols="50" name="bulletin"></textarea>
      <br>
      <input type="submit" value="upload">
      </form>
    </main>
    <hr>
    <footer>
      <p>Copyright &copy; LEE BLOG </p>
    </footer>
    
</body>
</html>