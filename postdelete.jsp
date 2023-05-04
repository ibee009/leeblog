<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.loginDAO"%>
<%@ page import="user.loginDTO"%>
<%@ page import="upload.uploadDAO"%>
<%@ page import="upload.uploadDTO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<% 
    String userid =null;
    if(session.getAttribute("userid") !=null){
         userid = (String) session.getAttribute("userid");
    }
%>

<%
    request.setCharacterEncoding("UTF-8");

    String id = null;
    String number = null;

    if(request.getParameter("id") != null){
        id = (String) request.getParameter("id");
    }

    if(request.getParameter("number") != null){
        number = (String) request.getParameter("number");
    }
    
    if(request.getParameter("userid") != null){
        userid = (String) request.getParameter("userid");
    }
    
    
    if (!id.equals(userid)) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('본인의 게시글만 삭제가 가능합니다.');");
        script.println("history.back();");
        script.println("</script>");
    }else{
    	uploadDAO uploadDAO = new uploadDAO();
        int result = uploadDAO.delete(id, number);
    	if(result == 1){
        HttpSession userSession = request.getSession();
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('successe');");
        script.println("location.href = 'main.jsp';");
        script.println("</script>");
        }else{
    	HttpSession userSession = request.getSession();
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('fail');");
        script.println("history.back();");
        script.println("</script>");
        }
    }
    
    
%>