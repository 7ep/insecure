<%@ page language="java" import="asc.*,java.util.*" %>
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
	String productSearch = request.getParameter("productSearch");
	if( productSearch == null ) productSearch = "";
	List productList= ASCApp.getDatabaseServiceSingleton().findProductsByName( productSearch );
	
%>
<form action="index.jsp" method="get" name="productSearchForm">

<table class="formPanel" border=1>
<tr class="formHeading"><td colspan=5>&gt;&nbsp;Latest Products
<%=productSearch.length() > 0 ? " that names match &quot;" + WebUtil.esc(productSearch)+"&quot;" : "" %>
</td></tr>
<tr class="formPanel"><th class="formPanel">Product Name</th>
<th class="formPanel">Description</th>
<th class="formPanel">Details</th>
<th class="formPanel">Qty Available</th>
<th class="formPanel">Image</th>

</tr>
<% for(Iterator it=productList.iterator(); it.hasNext(); ) {
	Product product = (Product) it.next();%>
<tr class="formPanel">
<td class="formPanel"><b><%=WebUtil.esc(product.getName()) %></b></td>
<td class="formPanel"><%=WebUtil.esc(product.getShortDescription()) %></td>
<td class="formPanel"><%=WebUtil.esc(product.getLongDescription()) %></td>
<td class="formPanel"><%=product.getAvailable() %></td>
<td class="formPanel" align="center"><img vspace="5" src=../common/art/<%=product.getImageFile() %>></td>

</tr>

<% } %>
<tr class="formPanel"></tr>

<tr class="formPanel">
<td class="formPanel" colspan=4><input id="productSearch" name="productSearch" type="text" style="width:100%" value='<%=WebUtil.esc(productSearch)%>' ></td>
<td class="formPanel"><input type="button" onclick="window.location.href='?productSearch='+document.getElementById('productSearch').value" value='Search'></td>
</tr>
</table>
</form>