<%@ page language="java" import="java.util.*,asc.*" %>
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
	WebUserService wus = ASCApp.getWebUserService(request);
	User user = wus.getSessionUser();
	if(user == null) {
		response.sendRedirect("../public/Login.jsp");
	}
	else {

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head>
<%@ include file="../common/htmlHeader.jsp" %>
</head>
<body>
<%@ include file="../common/bodyGraphics.jsp" %>
<br>
<center>
<table class="formPanel" border=1>
<tr class="formHeading"><td colspan=8>&gt;&nbsp;Administrative Options</td></tr>
<tr class="formPanel"><td class="formPanel"><a href="activateAccount.jsp">Manage Account Activation</a></td>
<tr class="formPanel"><td class="formPanel"><a href="../report/report1.pdf" target="_blank">Quarterly Report</a></td>


</table>
</center>
<%@ include file="../common/bodyGraphicsEnd.jsp" %>

<% } %>