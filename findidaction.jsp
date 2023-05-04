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
    
    if(username == null) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('name을 입력해 주세요.');");
        script.println("history.back();");
        script.println("</script>");
        script.close();
    }else{
    	loginDAO loginDAO = new loginDAO();
    	ResultSet result = loginDAO.findid(username);
    	if(result !=null && result.next()){
    		String id = result.getString("id");
    	    PrintWriter script = response.getWriter();
    	    script.println("<script>");
    	    script.println("alert('"+username+"의 아이디는 "+id+" 입니다.');");
    	    script.println("location.href = 'main.html';");
    	    script.println("</script>");
    	    script.close();
    	}else{
    		PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('없는 이름입니다.');");
            script.println("history.back();");
            script.println("</script>");
            script.close();
    	}
    }
%>