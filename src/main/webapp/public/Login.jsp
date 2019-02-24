<%@ page language="java" import="asc.*" %>
<%-- 
These JSP pages have been simplified for demonstration purposes 
and do not represent a real production implementation - 
For example, production systems typically use tag libraries and a third-party MVC architecture (see Spring Framework,Tapestry,WebWork,Struts,JSF,JSTL). 
Original author L.Angrave. 
Copyright 2005 Isthmus Group LLC, Madison Wisconsin.
Licensed under the Apache License 2.0, 
http://www.apache.org/licenses/LICENSE-2.0
--%>

<% 
String login = request.getParameter("login");
String password = request.getParameter("pass");
if(login!= null) { 
	WebUserService wus = ASCApp.getWebUserService(request);
	Cookie cookies[] = request.getCookies();
	
	for(int i =0; i<cookies.length; i ++)  {
		session.setAttribute("userPrefs-"+cookies[i].getName(),cookies[i].getValue()!=null?java.net.URLDecoder.decode(cookies[i].getValue()):"");
	}
	boolean loggedIn = wus.login(login,password);
	if(loggedIn) response.sendRedirect("../secure/index.jsp");
}
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ include file="../common/htmlHeader.jsp" %>
</head>
<body>
<%@ include file="../common/bodyGraphics.jsp" %>
<br>

<center>
<form action="Login.jsp">
<table class="formPanel">
<tr class="formHeading"><td colspan=2>&gt;&nbsp;Customer Login</td></tr>

<tr class="formPanel"><th class="formPanel">Name :</th>
<td class="formPanel"><input type='text' name='login' size=30></td></tr>
<tr class="formPanel"><th class="formPanel">Password :</th>
<td class="formPanel"><input type="password" name='pass' size=20><input type="submit" value="Login"></td></tr>
<tr><td></td><td class="formPanel"><a href="ForgotLogin.jsp">I need a new password</a>
</table>
</form>
</center>
<%@ include file="../common/bodyGraphicsEnd.jsp" %>


