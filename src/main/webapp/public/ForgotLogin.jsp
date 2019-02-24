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
String email = request.getParameter("email");

User user = ASCApp.getDatabaseServiceSingleton().findUserByEmail(email);

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
<% if(email != null && user != null) { %>
Login details have been sent to <%=WebUtil.esc(email)%>.
<% } %>
<% if(email != null && user == null) { %>
The email address <%=WebUtil.esc(email)%> was not found.
<% } %>

<% if(email == null || user == null) { %>
<form action="ForgotLogin.jsp">
<table class="formPanel">
<tr class="formHeading"><td colspan=2>&gt;&nbsp;Request New Password</td></tr>
<tr class="formPanel"><th class="formPanel">Email:</th>
<td class="formPanel"><input type='text' name='email' id='email' size=100 value="<%=email!=null?WebUtil.esc(email):""%>"></td>
<td class="formPanel"><input type="submit" value="Reset Password"></td></tr>
</table>
</form>
<% } %>
</center>
<%@ include file="../common/bodyGraphicsEnd.jsp" %>
