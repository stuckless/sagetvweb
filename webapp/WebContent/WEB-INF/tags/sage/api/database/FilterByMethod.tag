<%--
  -- Unofficial SageTV Generated File - Never Edit
  -- Generated Date/Time: 6/8/11 2:47 PM
  -- See Official Sage Documentation at <a href='http://download.sage.tv/api/sage/api/Database.html#FilterByMethod(java.lang.Object, java.lang.String, java.lang.Object, boolean)'>Database.FilterByMethod</a>
  -- This Generated API is not Affiliated with SageTV.  It is user contributed.
  --%>
<%@ tag body-content="empty"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ attribute name="var" required="true" rtexprvalue="false" %>
<%@ variable name-from-attribute="var" alias="varLocal" scope="AT_END" %>
<%@ attribute name="context" required="false" type="java.lang.String" %>
<%@ attribute name="data" required="true" type="java.lang.Object" %>
<%@ attribute name="method" required="true" type="java.lang.String" %>
<%@ attribute name="matchValue" required="true" type="java.lang.Object" %>
<%@ attribute name="matchedPasses" required="true" type="java.lang.Boolean" %>

<%
String contextAttr = (String) jspContext.getAttribute("context");
Object dataAttr = jspContext.getAttribute("data");
Object methodAttr = jspContext.getAttribute("method");
Object matchValueAttr = jspContext.getAttribute("matchValue");
Object matchedPassesAttr = jspContext.getAttribute("matchedPasses");

Object returnVal = null;

if ((context != null) && (context.trim().length() > 0))
{
    returnVal = sage.SageTV.apiUI(context, "FilterByMethod", new Object[] {dataAttr, methodAttr, matchValueAttr, matchedPassesAttr});
}
else
{
    returnVal = sage.SageTV.api("FilterByMethod", new Object[] {dataAttr, methodAttr, matchValueAttr, matchedPassesAttr});
}
%>

<c:set var="varLocal" value="<%= returnVal %>"/>
