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
	int accountId = Integer.parseInt( request.getParameter("accountId") );
	Account acc = ASCApp.getDatabaseServiceSingleton().findAccountByAccountId( accountId );
	
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head>
<%@ include file="../common/htmlHeader.jsp" %>
</head>
<body>
<%@ include file="../common/bodyGraphics.jsp" %>
<br>

<table class="formPanel" border=1>

<tr class="formHeading"><td colspan=8>&gt;&nbsp;Account #<%=accountId%></td></tr>

<% if(acc !=null) { %>

<tr class="formPanel"><th class="formPanel">Account #</th><th class="formPanel">Total</th><th class="formPanel">Paid</th>
<th class="formPanel">Invoiced</th><th class="formPanel">Active</th><th class="formPanel">Account Opened</th><th class="formPanel">Instructions / Notes</th>

<tr class="formPanel">
<td class="formPanel"><%=acc.getAccountId()%></td>
<td class="formPanel">$<%=acc.getAmountOwed()%></td>
<td class="formPanel">$<%=acc.getAmountPaid()%></td>
<td class="formPanel">$<%=acc.getAmountOwed() - acc.getAmountPaid()%></td>
<td class="formPanel"><%=acc.isActive()?"Yes":"No"%></td>
<td class="formPanel"><%=acc.getOpened()%></td>
<td class="formPanel"><%=acc.getComments()%> &nbsp;</td>
</tr>
<% } else { %>
<tr class="formPanel"><td class="formPanel" colspan=8 align="center"><b>Record not found</b></td></tr>
<% } %>
</table>

<%@ include file="../common/bodyGraphicsEnd.jsp" %>

