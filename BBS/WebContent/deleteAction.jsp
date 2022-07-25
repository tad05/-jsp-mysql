	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ page import="user.UserDAO"%>
	<%@ page import="voting.VotingDAO"%>
	<%@ page import="java.io.PrintWriter"%>
	<% request.setCharacterEncoding("UTF-8");%>
	<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<title>JSP 웹사이트</title>
	</head>
	<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String managerID = null;
		if(session.getAttribute("managerID") != null) {
			managerID = (String) session.getAttribute("managerID");
		}
		if(managerID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 해주세요.');");
			script.println("location.href = 'mlogin.jsp'");
			script.println("</script>");
			script.close();
		}
		request.setCharacterEncoding("UTF-8");
		String postsID = null;
		if(request.getParameter("postsID") != null ){
			postsID = request.getParameter("postsID");
		}
		VotingDAO votingDAO = new VotingDAO();
			int result = new VotingDAO().delete(postsID);
			if (result == 1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('삭제되었습니다.');");
					script.println("history.back();");
					script.println("</script>");
					script.close();
					} 
			else{
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('데이터베이스 오류입니다.');");
					script.println("history.back();");
					script.println("</script>");
					script.close();
			}
	%>
	</body>
</html>
		
	
