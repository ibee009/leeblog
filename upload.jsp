<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.loginDAO"%>
<%@ page import="user.loginDTO"%>
<%@ page import="upload.uploadDTO"%>
<%@ page import="upload.uploadDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
request.setCharacterEncoding("UTF-8");
String bulletin = null;
String userid = null;
String title = null;

if((request.getParameter("bulletin")=="")||(request.getParameter("bulletin")==null)||(request.getParameter("title")=="")||(request.getParameter("title") == null)){
	PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("alert('게시글을 입력하세요.');");
    script.println("history.back();");
    script.println("</script>");
    script.close();
}else{
	bulletin = (String) request.getParameter("bulletin");
	userid = (String) request.getParameter("userid");
	title = (String) request.getParameter("title");
	uploadDAO uploadDAO = new uploadDAO();
	int result = uploadDAO.mainupload(userid,title,bulletin);
	if(result == -1){
		PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('upload에 실패하였습니다.');");
        script.println("history.back();");
        script.println("</script>");
        script.close();
	} else{
		PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('upload에 성공하였습니다.');");
        script.println("location.href ='main.jsp';");
        script.println("</script>");
        script.close();
	}
}
%>