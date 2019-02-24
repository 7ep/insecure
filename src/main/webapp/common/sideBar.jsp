<%@ page import="asc.*" %>
<%-- 
These JSP pages have been simplified for demonstration purposes 
and do not represent a real production implementation - 
For example, production systems typically use tag libraries and a third-party MVC architecture (see Spring Framework,Tapestry,WebWork,Struts,JSF,JSTL). 
Original author L.Angrave. 
Copyright 2005 Isthmus Group LLC, Madison Wisconsin.
Licensed under the Apache License 2.0, 
http://www.apache.org/licenses/LICENSE-2.0
--%>

<% WebUserService webUserService = ASCApp.getWebUserService(request);
String userName= webUserService.getUserName(); // returns null if there is no session user
String greeting = webUserService.getGreeting(session); // Returns default greeting if none set (or no session user)
boolean admin = webUserService.isAdmin();
 %>

<br>

<table height="100%" width="90%" border="0">
<tr><td><img src="../common/art/dot.gif">&nbsp;<a href="../public/" style="sideBarlink">Products</a></td></tr>

<%if(userName== null) { %>
<tr><td><img src="../common/art/dot.gif">&nbsp;<a href="../public/Login.jsp" style="sideBarlink">Customer Login</a></td></tr>
<% } else { %>
<tr><td><%=greeting +" "+ userName%>.</td></tr>
<tr><td><img src="../common/art/dot.gif">&nbsp;<a href="../public/Logout.jsp" style="sideBarlink">Logout</a></td></tr>
<tr><td><img src="../common/art/dot.gif">&nbsp;<a href="../secure/" style="sideBarlink">Home</a></td></tr>
<br>
<tr><td><img src="../common/art/dot.gif">&nbsp;<a href="../secure/Preferences.html" style="sideBarlink" target="_blank">Preferences</a></td></tr>

<%if(admin) { %>
<tr><td><img src="../common/art/dot.gif">&nbsp;<a href="../admin/admin.jsp" style="sideBarlink">Admin</a></td></tr>
<% } %>
<% } %>
<tr height="50%"><td>&nbsp;</td></tr>
<tr><td><img src="../common/art/dot.gif">&nbsp;<a href="../Read-Me/ReadMe.html" style="sideBarlink">Instructions</a></td></tr>
<tr><td align="center"><i><b>InsecureWebApp</b></i></td></tr>
<tr height="100" ><td align="center"><a href="mailto:insecure@isthmusgroup.com?subject=InsecureWebApp"><img style="border:0px" src="../common/art/isthmusgroup.gif" width="78" height="72" vspace="6"></a></td></tr>
<tr ><td align="center"><A href="http://www.owasp.org" target="_blank"><IMG src="../common/art/owasp_vlogo.gif" border="0" width="111" height="35" vspace="6"></A><br>&nbsp;</td></tr>



</table>