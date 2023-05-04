<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.loginDAO"%>
<%@ page import="user.loginDTO"%>
<%@ page import="java.io.PrintWriter"%>

<%
    request.setCharacterEncoding("UTF-8");

    String username = null;
    String userid = null;
    String userpw = null;

    if(request.getParameter("username") != null){
        username = (String) request.getParameter("username");
    }

    if(request.getParameter("userid") != null){
        userid = (String) request.getParameter("userid");
    }

    if(request.getParameter("userpw") != null){
        userpw = (String) request.getParameter("userpw");
    }

    if(username == null || userid == null || userpw == null) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('입력이 안 된 사항이 있습니다.');");
        script.println("history.back();");
        script.println("</script>");
        script.close();
    } else {
        loginDAO loginDAO = new loginDAO();
        int result = loginDAO.signup(new loginDTO(username, userid, userpw));

        if (result == -1) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('이미 존재하는 아이디입니다.');");
            script.println("history.back();");
            script.println("</script>");
            script.close();
        } else {
            session.setAttribute("userid", userid);
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("location.href = 'main.html';");
            script.println("</script>");
            script.close();
            return;
        }
    }
%>