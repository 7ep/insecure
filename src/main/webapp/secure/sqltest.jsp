<%@ page language="java" import="asc.*,asc.db.*,java.sql.*" %>
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
String sql = request.getParameter("sql");
if(sql == null) sql="SELECT * FROM USER";
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head>
<%@ include file="../common/htmlHeader.jsp" %>
</head>
<body>
<%@ include file="../common/bodyGraphics.jsp" %>
<br>

<center>
<form action="#">
<table class="formPanel" style="width:800px">
<tr class="formHeading"><td colspan=2 >&gt;&nbsp;SQL Test</td></tr>

<tr class="formPanel"><th class="formPanel" colspan=2>SQL :</th></tr>

<tr class="formPanel"><td colspan=2 width="800">
<textarea name="sql" rows=4 style="width:100%" cols=300><%= sql%></textarea></td>
</tr>
<tr class="formPanel"><td class="formPanel" colspan=2><input type='submit'></td></tr>
</table>

<table border="1" width=800><tr>

<% 
 Connection connection = null;
 ConnectionProvider connectionProvider =null;
 try {
 connectionProvider = ASCApp.getDatabaseConnectionProviderSingleton();

 connection  = connectionProvider.getConnection();
 ResultSet rs = connection.createStatement().executeQuery(sql);

 int colCount = rs.getMetaData().getColumnCount(); 
 for (int col = 1; col <= colCount; col ++) { 
 	String name = rs.getMetaData().getColumnName(col);%>
	<td><b><%= WebUtil.esc(name != null ? name : "" ) %></b></td>
<% } %>
</tr>

<% while(rs.next()) {%>
<tr>
<% for (int col = 1; col <= colCount; col ++) { %>
<td><%=WebUtil.esc( rs.getString(col)) %></td>
<% } %>
</tr>
<% } %>
<% } catch (Exception excep) { %>
<tr><td><%=WebUtil.esc(excep.getMessage()) %></td></tr>
<% } finally { 
connectionProvider.returnConnection(connection,false);

} %>

</table>
</form>
Connection Type: <%=connectionProvider != null ? connectionProvider.getClass().toString().substring(24) : "" %>
</center>
<%@ include file="../common/bodyGraphicsEnd.jsp" %>


