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
		List accountList = ASCApp.getDatabaseServiceSingleton().findAccountsByUserId( user.getUserId());

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head>
<%@ include file="../common/htmlHeader.jsp" %>
</head>
<body>
<%@ include file="../common/bodyGraphics.jsp" %>
<br>
<table class="formPanel" border=1>
<tr class="formHeading"><td colspan=8>&gt;&nbsp;Account Information for <%=WebUtil.esc(user.getName())%></td></tr>
<tr class="formPanel"><th class="formPanel">Account #</th>
<th class="formPanel">Invoiced</th><th class="formPanel">Instructions / Notes</th>
<% for(Iterator it=accountList.iterator(); it.hasNext(); ) {
	Account acc = (Account) it.next();%>
<tr class="formPanel">
<td class="formPanel"><%=acc.getAccountId()%>&nbsp;<a href=accountDetail.jsp?accountId=<%=acc.getAccountId()%>>view</a></td>
<td class="formPanel">$<%=acc.getAmountOwed() - acc.getAmountPaid()%></td>
<td class="formPanel"><%=acc.getComments()%>&nbsp;</td>
</tr>
<% } %>
</table>
<br>
<form method="post" action="submit.jsp">
<table class="formPanel" border=1>
<tr class="formHeading"><td colspan=2>&gt;&nbsp;New Payment Wizard</td></tr>
<tr><th align="right">Credit Card #</th><td><input name="creditcard"></td></tr>
<tr><th align="right">Expiration MM/YY</th><td><input name="expire"></td></tr>
<tr><th align="right">Amount</th><td><input name="amount"><input type=submit value='Submit'></td></tr>
</table>
</form>
<%@ include file="../common/bodyGraphicsEnd.jsp" %>

<% } %>