
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<link rel="stylesheet" href="../css/style.css">
    
</head>

  <body>
<div align="right">   </div>
<div class="wrapper">

	<div class="container">
	<%-- <%RegisterBean bean=null;
	bean=(RegisterBean)session.getAttribute("newuser");
	if(bean!=null){%>
		<h1>Welcome <%=bean.getName() %></h1>
	<%}else{
		bean=(RegisterBean)session.getAttribute("registeruser"); %>
		<h1>Welcome <%=bean.getName() %></h1>
	<%} %> --%>
		<h1>Logout Successfully..!!</h1>
		<!-- <form action="Login" method="post">
			<input type="text" placeholder="Username" name="uname" id="uname">
			<input type="password" placeholder="Password" name="pass" id="pass">
			<input type="submit" id="login-button" value="Login">
		</form> -->
	</div>
	
	<ul class="bg-bubbles">
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
	</ul>
	
</div>

  
    
  </body>
</html>
<%
session.invalidate();
session=null;
%>
  

<script type="text/javascript">
setTimeout("window.location='login.jsp'",10000);
</script>
<script src="../js/jquery-1.8.3.js"></script>
        <script src="../js/index.js"></script>