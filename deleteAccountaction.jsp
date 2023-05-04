<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.loginDAO"%>
<%@ page import="user.loginDTO"%>
<%@ page import="java.io.PrintWriter"%>

<%
    request.setCharacterEncoding("UTF-8");

    String userpw = null;
    String userid = null;

    if(request.getParameter("userpw") != null){
        userpw = (String) request.getParameter("userpw");
    }

    if(request.getParameter("userid") != null){
        userid = (String) request.getParameter("userid");
    }
    
    if(userpw == null) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('password를 입력해 주세요.');");
        script.println("history.back();");
        script.println("</script>");
        script.close();
    }else{
    	loginDAO loginDAO = new loginDAO();
    	int result = loginDAO.deleteAccount(userpw , userid);
    	if(result == 1){
    	PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('success');");
        script.println("location.href = 'main.html';");
        script.println("</script>");
        script.close();
    	}else{
    		PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('비밀번호가 틀립니다.');");
            script.println("history.back();");
            script.println("</script>");
            script.close();
    	}
    }
%>