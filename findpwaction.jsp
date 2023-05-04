<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.loginDAO"%>
<%@ page import="user.loginDTO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.sql.ResultSet" %>
<%
    request.setCharacterEncoding("UTF-8");

    String username = null;
    String userid = null;

    if(request.getParameter("username") !=null){
    	username = (String) request.getParameter("username");
    }

    if(request.getParameter("userid") != null){
        userid = (String) request.getParameter("userid");
    }
    
    if(userid == null) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('id을 입력해 주세요.');");
        script.println("history.back();");
        script.println("</script>");
        script.close();
    }else if(username == null) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('name을 입력해 주세요.');");
        script.println("history.back();");
        script.println("</script>");
        script.close();
    }else{
    	loginDAO loginDAO = new loginDAO();
    	ResultSet result = loginDAO.findpw(username,userid);
    	if(result !=null && result.next()){
    		String pw = result.getString("pw");
    	    PrintWriter script = response.getWriter();
    	    script.println("<script>");
    	    script.println("alert('"+username+"의 비밀번호는 "+pw+" 입니다.');");
    	    script.println("location.href = 'main.html';");
    	    script.println("</script>");
    	    script.close();
    	}else{
    		PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('없는 사용자입니다.');");
            script.println("history.back();");
            script.println("</script>");
            script.close();
    	}
    }
%>