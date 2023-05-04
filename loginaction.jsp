<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.loginDAO"%>
<%@ page import="user.loginDTO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="javax.servlet.http.HttpSession"%>

<%
    request.setCharacterEncoding("UTF-8");

    String userid = null;
    String userpw = null;

    if(request.getParameter("userid") != null){
        userid = (String) request.getParameter("userid");
    }

    if(request.getParameter("userpw") != null){
        userpw = (String) request.getParameter("userpw");
    }

    if(userid == null || userpw == null) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('입력이 안 된 사항이 있습니다.');");
        script.println("history.back();");
        script.println("</script>");
    } else {
        loginDAO loginDAO = new loginDAO();
        int result = loginDAO.sign(userid, userpw);

        if (result == 0) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('비밀번호가 틀립니다.');");
            script.println("history.back();");
            script.println("</script>");
        } else if (result == -1) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('존재하지 않는 아이디입니다.');");
            script.println("history.back();");
            script.println("</script>");
        } else {
            HttpSession userSession = request.getSession();
            userSession.setAttribute("userid", userid);
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("location.href = 'main.jsp';");
            script.println("</script>");
        }
     }
    
%>