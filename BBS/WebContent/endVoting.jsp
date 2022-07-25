<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.DbConnect"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="block.*"%>
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
				<li><a href="voting.jsp">투표</a></li>
				<li class="active"><a href="endVoting.jsp">투표결과</a></li>
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
	<%
	Connection conn = null;
	ResultSet rs = null;
	try {
	String SQL = "SELECT a.* from voting a where a.voteCount = (SELECT max(a.voteCount) from voting a)";
	PreparedStatement pstmt= null;
	conn = DbConnect.getConnection();
	pstmt = conn.prepareStatement(SQL);
	rs = pstmt.executeQuery();
	while(rs.next()){
			int postsID = rs.getInt(1);
		    String candidateName  = rs.getString(2);
		    String candidateContent  = rs.getString(3);
		    int voteCount = rs.getInt(4);
		    int votingYear= rs.getInt(5);

	%>
		<section class="container-fluid">
		<p style="font-family:Black Han Sans; font-size:5em; padding-top:20px">투표결과는?</p>
		<div class="media">
		<div class="media-left media-top">
			<img src="jspimg/<%=postsID%>.jpg" class="media-object" style="width:100px;height:150px;">
		</div>
		<div class="media-body">
     		<h4 class="media-heading" style="font-weight:bold;"><%=candidateName%></h4>
      		<p><%=candidateContent%></p>
    	</div>	
	</div>
	<p style="font-family:Black Han Sans; font-size:5em; padding-top:20px; padding-bottom:100px">입니다.</p>
	</section>
	 <%
	}
	}catch(Exception e){
		e.printStackTrace();
	}
	%>
	<%
	Transaction transaction = new Transaction();
	Block block1 = new Block(1, null, 0, new ArrayList());
	block1.mine();
	block1.getInformation();

	Block block2 = new Block(2, block1.getBlockHash(), 0, new ArrayList());
	block2.addTransaction(transaction.getUserID(), transaction.getPostsID());
	block2.mine();
	block2.getInformation();
	
	
	%>
	
	<section>
	<p>
	블록 번호 : <%=block2.getBlockID()%>
	</p>
	<p>
	이전 해시 : <%=block2.getPreviousBlockHash()%>
	</p>
	<p>
	채굴 변수 : <%=block2.getNonce()%>
	</p>
	<%
	ArrayList<Transaction> list = block2.getTransactionList();
	for (int i=0; i<list.size(); i++){
		Transaction tr = list.get(i);
	%>
	<p>
	<%= tr.getInfo() %>
	</p>
	<%
	} 
	%>
	<p>
	<%=list.size()%>개
	</p>
	<p>
	블록해시 : <%=block2.getBlockHash()%>
	</p>
	</section>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
</body>
</html>