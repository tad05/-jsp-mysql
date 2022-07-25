	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ page import="user.UserDAO"%>
	<%@ page import="voting.VotingDAO"%>
	<%@ page import="block.Transaction"%>
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
		String userID = null;
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if(userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 해주세요.');");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
			script.close();
		}
		String postsID = null;
		if(request.getParameter("postsID") != null ){
			postsID = request.getParameter("postsID");
		}
		UserDAO userDAO = new UserDAO();
		VotingDAO votingDAO = new VotingDAO();
			int result = userDAO.voteox(userID);
			if(result == 1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미투표했습니다.');");
				script.println("location.href = 'voting.jsp'");
				script.println("</script>");
				script.close();
			}
			else{
						Transaction transaction = new Transaction(userID, postsID);
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('투표를 완료했습니다.');");
						script.println("history.back();");
						script.println("</script>");
						script.close();
				
			}
	%>
	</body>
</html>
		
	
