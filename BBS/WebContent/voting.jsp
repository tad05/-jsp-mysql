<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="voting.VotingDAO" %>
<%@ page import="voting.VotingDTO" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/nav-color.css">
<link rel="stylesheet" href="css/main.css">
<title>JBU 투표웹사이트</title>
</head>	
<body>

	<%
	request.setCharacterEncoding("UTF-8");
	String userID = null;
	String managerID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if (session.getAttribute("managerID") != null) {
		managerID = (String) session.getAttribute("managerID");
	}
		
	%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">JBU 투표웹사이트</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<li><a href="A+.jsp">조원 소개</a></li>
				<li class="active"><a href="voting.jsp">투표</a></li>
				<li><a href="endVoting.jsp">투표결과</a></li>
			</ul>
			<%
			if (userID == null && managerID == null){
			%>
			<ul class="nav navbar-nav navbar-right">
        		<li class="dropdown">
         			<a href="#" class="dropdown-toggle" 
       				     data-toggle="dropdown" role="button" aria-haspopup="true" 
  				          aria-expanded="false">접속하기 <span class="caret"></span></a>
  					<ul class="dropdown-menu">
  				      	<li><a href="login.jsp">로그인</a></li>
  				      	<li><a href="mlogin.jsp">관리자 로그인</a></li>
  					</ul>
				</li>
			</ul>
			<%
				} else {
					if (managerID == null){
			%>
			<ul class="nav navbar-nav navbar-right">
        		<li class="dropdown">
         			<a href="#" class="dropdown-toggle" 
       				     data-toggle="dropdown" role="button" aria-haspopup="true" 
  				          aria-expanded="false">회원관리 <span class="caret"></span></a>
  					<ul class="dropdown-menu">
  				      	<li><a href="logoutAction.jsp">로그아웃</a></li>
  					</ul>
				</li>
			</ul>
			<%
				}else{
			%>
			<ul class="nav navbar-nav navbar-right">
        		<li class="dropdown">
         			<a href="#" class="dropdown-toggle" 
       				     data-toggle="dropdown" role="button" aria-haspopup="true" 
  				          aria-expanded="false">관리자관리 <span class="caret"></span></a>
  					<ul class="dropdown-menu">
  				      	<li><a href="logoutAction.jsp">로그아웃</a></li>
  					</ul>
				</li>
			</ul>
			<%
				}
				}
			%>
		</div>
	</nav>
	<section class="container-fluid">
		<form method="get" action="./voting.jsp" class="form-inline mt-3" style = "padding-top: 20px">
			<%
			if (managerID != null){
			%>
			<a class="btn btn-primary mx-1 mt-2" data-toggle="modal" href="#registerModal" style = "background-color: #1abc9c; color: white;">
			후보 등록하기</a>
			<%
			}
			%>
		</form>
	</section>
	<%
		VotingDAO votingDAO = new VotingDAO();
		ArrayList<VotingDTO> list = votingDAO.getList();
		for (int i=0; i<list.size(); i++){
			VotingDTO voting = list.get(i);
	%>
	<section class="container-fluid">
	<div class="media">
		<div class="media-left media-top">
			<img src="jspimg/<%=voting.getPostsID()%>.jpg" class="media-object" style="width:150px;height:190px;">
		</div>
		<div class="media-body">
     		<h4 class="media-heading style="font-weight:bold"><%=voting.getCandidateName()%></h4>
      			<p><%=voting.getCandidateContent()%></p>
      			<a onclick = "return confirm('투표하시겠습니까?')" href="./CountAction.jsp?postsID=<%=voting.getPostsID()%>" class="btn btn-primary" style = "background-color: #1abc9c; color: white;">VOTE</a>
	<%
	if (managerID != null) {
	%>
	<a class="btn btn-primary mx-1 mt-2" onclick = "return confirm('삭제하시겠습니까?')" href="./deleteAction.jsp?postsID=<%=voting.getPostsID()%>" style = "background-color: #1abc9c; color: white;">후보 삭제하기</a>
	<%
	}
	%>
    	</div>	
	</div>
	</section>
	<%
		}
  	%>
	<div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modal" style="font-weight:bold;">후보 등록</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
		            </button>
		        </div>	
		        <div class="modal-body">
		      		<form action="./votingAction.jsp" method="post">
		      			<div class="form-row">
		      				<div class="form-group">
		      				<label>연도</label>
		      				<input type="number" name="votingYear" class="form-control">
		      				</div>
		      				<div class="form-group">
								<label>후보 이름</label>
								<input type="text" name="candidateName" class="form-control" maxlength="50">
							</div>
							<div class="form-row">
							<label>후보 공약</label>
							<textarea name="candidateContent" class="form-control" maxlength="2048" style="height:180px;"></textarea>
							</div>		      			
		      			</div>
		      			<div class="modal-footer">
		      			<button type="submit" class="btn btn-primary">등록하기</button>
		      			</div>
		      		</form>          
				</div>
			</div>
		</div>
	</div> 
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
</body>
</html>