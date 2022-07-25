<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
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
				<li class="active"><a href="main.jsp">메인</a></li>
				<li><a href="A+.jsp">조원 소개</a></li>
				<li><a href="voting.jsp">투표</a></li>
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
	<div class="container-fluid text-center" id= "bg-main">
		<p class="text-left" style="font-family:Black Han Sans; font-size:5em;">편하게</p>
		<dl class="dl-horizontal" id="img_full">
 			<dt>
 			<img src="jspimg/jbu.jpg" class="img-circle" id="img_profile">
			</dt>
 			 <dd>
 			 <p>투표 시스템을 구축하고 웹으로 손쉽게 투표를 할 수 있는 투표 방식을 ‘REV(Remote internet E-Voting) 방식’이라고 하는데
 			 여기에 블록체인을 결합하여 투표 내용을 저장하고 해시함수를 이용해 위조, 변조 불가능한 상태로 저장해 신뢰성 있는 웹을 만드는 것이 목표이다.</p>
 			 </dd>
		</dl>	 
		<p class="text-left" style="font-family:Black Han Sans; font-size:5em; padding-top:10px;">투표하자</p>
	 </div>
	 <div class="contaniner-fluid text-center bg-sub">
	 <p class="h3">Twice</p> 
	 </div>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>