<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.loginDAO"%>
<%@ page import="user.loginDTO"%>
<%@ page import="upload.uploadDTO"%>
<%@ page import="upload.uploadDAO"%>
<%@ page import="java.io.PrintWriter"%>
<% 
    String userid =null;
    if(session.getAttribute("userid") !=null){
         userid = (String) session.getAttribute("userid");
    }
%>
<%
request.setCharacterEncoding("UTF-8");

String title = (String) request.getParameter("title");
String bulletin = (String) request.getParameter("bulletin");
String id = (String) request.getParameter("id");
String number = (String) request.getParameter("number");


    if((request.getParameter("bulletin")=="")||(request.getParameter("bulletin")==null)||(request.getParameter("title")=="")||(request.getParameter("title") == null)){
    	PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('게시글을 입력하세요.');");
        script.println("history.back();");
        script.println("</script>");
        script.close();
    }else{
    	if (id != null && !id.equals(userid)){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('본인의 게시글만 수정 가능합니다.');");
            script.println("history.back();");
            script.println("</script>");
        }else{
        	uploadDAO uploadDAO = new uploadDAO();
            int result = uploadDAO.update(title , bulletin, number);
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
    
    }
%>