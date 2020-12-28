<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserVO"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.UserDAO" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userNick" />
<jsp:setProperty name="user" property="userEmail" />
<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if (userID != null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인 상태입니다.')");
		script.println("location.href='index.jsp';");
		script.println("</script>");
		script.close();
		return;
	}
	String userPassword = null;
	String userEmail = null;
	String userNick = null;
	if (request.getParameter("userID") != null) {
		userID = request.getParameter("userID");
	}
	if (request.getParameter("userPassword") != null) {
		userPassword = request.getParameter("userPassword");
	}
	if (request.getParameter("userNick") != null) {
		userEmail = request.getParameter("userNick");
	}
	if (request.getParameter("userEmail") != null) {
		userEmail = request.getParameter("userEmail");
	}
	if (userID == null || userPassword == null || userNick == null || userEmail == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('미입력 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	UserDAO userDAO = new UserDAO();
	int result = userDAO.create(new UserVO(userID, userPassword, userNick, userEmail));
	if (result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 존재하는 아이디입니다.')");
		script.println("history.back()");
		script.println("</script>");
		script.close();
	}
	else {
		session.setAttribute("userID", userID());
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'main.jsp'");
		script.println("</script>");
		script.close();
	}
%>