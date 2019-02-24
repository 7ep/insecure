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
	String accountId = request.getParameter("accountId");
	String activateCd = request.getParameter("activateCd");
	boolean updateActivation = "1".equals(request.getParameter("updateActivation"));
	
	Account acc = null;
	String mesg ="";
	
	if(accountId != null) {
		int accId = Integer.parseInt(  accountId );
		if(updateActivation) {
			ASCApp.getDatabaseServiceSingleton().setAccountActivation(accId,activateCd);
			mesg = "Account " + accId + " changed to " + (updateActivation?"active" : "closed");	
		}
	 	acc = ASCApp.getDatabaseServiceSingleton().findAccountByAccountId(accId);	
	 }
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head>
<%@ include file="../common/htmlHeader.jsp" %>
</head>
<body>
<%@ include file="../common/bodyGraphics.jsp" %>
<br>
<center>
<b><%=mesg%></b>

<form action="activateAccount.jsp">
<input type=hidden value=0 name="updateActivation" id="updateActivation">
<table class="formPanel" border=1>

<tr class="formHeading"><td colspan=7>&gt;&nbsp;Account Administration</td></tr>



<tr class="formPanel"><th class="formPanel">Account #</th><th class="formPanel">Total</th><th class="formPanel">Paid</th>
<th class="formPanel">Invoiced</th><th class="formPanel">Active</th><th class="formPanel">Account Opened</th><th class="formPanel">Instructions / Notes</th>

<tr class="formPanel">

<td class="formPanel"><input type="text" name="accountId" value="<%=accountId!=null?accountId:""%>" onchange="this.form.submit();"></td>
<% if(acc !=null) { %>
<td class="formPanel">$<%=acc.getAmountOwed()%></td>
<td class="formPanel">$<%=acc.getAmountPaid()%></td>
<td class="formPanel">$<%=acc.getAmountOwed() - acc.getAmountPaid()%></td>
<td class="formPanel"><select name="activateCd" id="activateCd" onchange="document.getElementById('updateActivation').value=1;this.form.submit();"><option value=1 <%=acc.isActive()? "selected='selected'" : ""%>>Activate</option><option value=0 <%=!acc.isActive()? "selected='selected'" : ""%>>Closed</option></select> </td>
<td class="formPanel" nowrap><%=acc.getOpened()%></td>
<td class="formPanel"><%=acc.getComments()%> &nbsp;</td>
<% } %>
</tr>
</table>
</form>
</center>
<%@ include file="../common/bodyGraphicsEnd.jsp" %>

