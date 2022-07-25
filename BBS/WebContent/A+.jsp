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
				<li><a href="main.jsp">메인</a></li>
				<li class="active"><a href="A+.jsp">조원 소개</a></li>
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
	<section class="container-fluid"  id="StudentInfo">
	<div class="row" id="1row">
		<div class="col-xs-6">
		<div class="media">
		<div class="media-left media-top">
		<img src="jspimg/khs.jpg" class="media-object" >
		</div>
		<div class="media-body">
     	<h4 class="media-heading">김현서</h4>
     	<hr>
      			<p style="font-size:1em; background-color:#9ff2df">생년월일 : 991122<br>
   				맡은역할 : 투표프로그램<br>
   				좋아하는것 : 먹는것</p>
    	</div>
		</div>
		</div>
		<div class="col-xs-6">
			<div class="media">
			<div class="media-left media-top">
			<img src="jspimg/ssy.jpg" class="media-object">
			</div>
			<div class="media-body">
     		<h4 class="media-heading">신세영</h4>
     		<hr style="font-size:1em; background-color:#9ff2df">
      			<p style="font-size:1em; background-color:#9ff2df">생년월일 : 0002229<br>
   				맡은역할 : 로그인구현<br>
   				좋아하는것 : 음악듣기</p>
    		</div>
			</div>
		</div>
		</div>
		<div class="row" id="2row">
			<div class="col-xs-6">
			<div class="media">
			<div class="media-left media-top">
			<img src="jspimg/jsy.jpg" class="media-object">
			</div>
			<div class="media-body">
     		<h4 class="media-heading">조서연</h4>
     		<hr>
      			<p style="font-size:1em; background-color:#9ff2df">생년월일 : 981221<br>
   				맡은역할 : 프론트엔드<br>
   				좋아하는것 : 공원걷기</p>
    		</div>
			</div>
			</div>
			<div class="col-xs-6">
			<div class="media">
			<div class="media-left media-top">
			<img src="jspimg/ckl.jpg" class="media-object">
			</div>
			<div class="media-body">
     		<h4 class="media-heading">최경라</h4>
     		<hr>
      			<p style="font-size:1em; background-color:#9ff2df">생년월일 : 990114<br>
   				맡은역할 : 투표프로그램<br>
   				좋아하는것 : 운동</p>
    		</div>
			</div>
			</div>
	</div>
	<div class="row" id="3row">
		<div class="col-xs-6">
		<div class="media">
		<div class="media-left media-top">
			<img src="jspimg/chj.jpg" class="media-object">
		</div>
		<div class="media-body">
     		<h4 class="media-heading">최현주</h4>
     		<hr>
      			<p style="font-size:1em; background-color:#9ff2df">생년월일 : 000101<br>
   				맡은역할 : 로그인 구현<br>
   				좋아하는것 : 여행가기</p>
    	</div>
	</div>
	</div>
	</div>
	</section>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>