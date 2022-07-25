	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ page import="voting.VotingDTO"%>
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
		int postsID = 0;
		String candidateName= null;
		int votingYear= 0;
		String candidateContent= null;
		int voteCount= 0;
		int voteox = 0;
		
			if(request.getParameter("postsID") != null) {
				try {
					postsID = Integer.parseInt(request.getParameter("postsID"));
	
				} catch (Exception e) {
					System.out.println("번호 오류");
				}
			}
	
			if(request.getParameter("candidateName") != null) {
				candidateName = (String) request.getParameter("candidateName");
			}
			
			if(request.getParameter("votingYear") != null) {
				try {
					votingYear = Integer.parseInt(request.getParameter("votingYear"));
				} catch (Exception e) {
					System.out.println("연도 데이터 오류");
				}
			}
	
			if(request.getParameter("candidateContent") != null) {
				candidateContent = (String) request.getParameter("candidateContent");
			}
			if(request.getParameter("voteCount") != null) {
				try {
					votingYear = Integer.parseInt(request.getParameter("voteCount"));
				} catch (Exception e) {
					System.out.println("");
				}
			}
			if(request.getParameter("voteox") != null) {
				try {
					votingYear = Integer.parseInt(request.getParameter("voteox"));
				} catch (Exception e) {
					System.out.println("");
				}
			}
		if (candidateName == null || candidateContent == null || votingYear == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
			}
		else{
			VotingDAO votingDAO = new VotingDAO();
			int result = votingDAO.write(new VotingDTO(0,candidateName, votingYear, candidateContent,0));
			if (result == 1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = './index.jsp';");
				script.println("</script>");
				script.close();
				
			} else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('평가 등록에 실패했습니다.');");
				script.println("history.back();");
				script.println("</script>");
				script.close();
			}
		}
	%>
	</body>
</html>
		
	
