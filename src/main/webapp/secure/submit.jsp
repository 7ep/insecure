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
	WebUserService wus = ASCApp.getWebUserService(request);
	User user = wus.getSessionUser();
	if(user == null) {
		response.sendRedirect("../public/Login.jsp");
	}
	String creditCard = request.getParameter("creditcard");
	String expirationDate = request.getParameter("expire");
	String amount = request.getParameter("amount");
	String email = wus.getUserEmail(); 
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head>
<%@ include file="../common/htmlHeader.jsp" %>
</head>
<body>
<%@ include file="../common/bodyGraphics.jsp" %>
<br>
<table class="formPanel" border=1>
<tr class="formHeading"><td colspan=8>&gt;&nbsp;Purchase Confirmation</td></tr>
<tr class="formPanel"><td>Thank you for your payment of $<%=WebUtil.esc(amount)%>.
 A confirmation email will be sent to <%=email%>.
</tr>

</table>

<%@ include file="../common/bodyGraphicsEnd.jsp" %>


