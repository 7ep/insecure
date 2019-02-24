<%@page %>
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
	String u = session != null ? (String) session.getAttribute("userPrefs-style"):null;
	if(u == null) u = "plain";
%>
<meta HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
<meta HTTP-EQUIV="Cache-Control" CONTENT="No-cache">
<meta HTTP-EQUIV="Expires" CONTENT="0">
<META name="Author" content="Lawrence Angrave, IsthmusGroup">
<META HTTP-EQUIV="Content-Language" content="EN">
<link rel="stylesheet" type="text/css" href="../common/theme/style.css">
<link rel="stylesheet" type="text/css" href="../common/theme/form.css">
<link rel="stylesheet" type="text/css" href="../common/theme/<%=u%>.css">
<script type="text/javascript" src="../common/script/custom.js"></script>
<title>InsecureWebApp - A vulnerable Web application</title>
