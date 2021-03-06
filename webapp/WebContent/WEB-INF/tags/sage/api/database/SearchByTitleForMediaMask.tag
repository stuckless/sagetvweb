<%--
  -- Unofficial SageTV Generated File - Never Edit
  -- Generated Date/Time: 7/17/10 8:25 AM
  -- See Official Sage Documentation at <a href='http://download.sage.tv/api/sage/api/Database.html#SearchByTitle(java.lang.String, java.lang.String)'>Database.SearchByTitle</a>
  -- This Generated API is not Affiliated with SageTV.  It is user contributed.
  --%>
<%@ tag body-content="empty"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ attribute name="var" required="true" rtexprvalue="false" %>
<%@ variable name-from-attribute="var" alias="varLocal" scope="AT_END" %>
<%@ attribute name="context" required="false" type="java.lang.String" %>
<%@ attribute name="searchString" required="true" type="java.lang.String" %>
<%@ attribute name="mediaMask" required="true" type="java.lang.String" %>

<%
String contextAttr = (String) jspContext.getAttribute("context");
Object searchStringAttr = jspContext.getAttribute("searchString");
Object mediaMaskAttr = jspContext.getAttribute("mediaMask");

Object returnVal = null;

if ((context != null) && (context.trim().length() > 0))
{
    returnVal = sage.SageTV.apiUI(context, "SearchByTitle", new Object[] {searchStringAttr, mediaMaskAttr});
}
else
{
    returnVal = sage.SageTV.api("SearchByTitle", new Object[] {searchStringAttr, mediaMaskAttr});
}
%>

<c:set var="varLocal" value="<%= returnVal %>"/>
