<%--
  -- Unofficial SageTV Generated File - Never Edit
  -- Generated Date/Time: 7/17/10 8:25 AM
  -- See Official Sage Documentation at <a href='http://download.sage.tv/api/sage/api/Utility.html#Animate(java.lang.String, java.lang.String, java.lang.String, long)'>Utility.Animate</a>
  -- This Generated API is not Affiliated with SageTV.  It is user contributed.
  --%>
<%@ tag body-content="empty"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ attribute name="var" required="true" rtexprvalue="false" %>
<%@ variable name-from-attribute="var" alias="varLocal" scope="AT_END" %>
<%@ attribute name="context" required="false" type="java.lang.String" %>
<%@ attribute name="widgetName" required="true" type="java.lang.String" %>
<%@ attribute name="layerName" required="true" type="java.lang.String" %>
<%@ attribute name="animationName" required="true" type="java.lang.String" %>
<%@ attribute name="duration" required="true" type="java.lang.Long" %>

<%
String contextAttr = (String) jspContext.getAttribute("context");
Object widgetNameAttr = jspContext.getAttribute("widgetName");
Object layerNameAttr = jspContext.getAttribute("layerName");
Object animationNameAttr = jspContext.getAttribute("animationName");
Object durationAttr = jspContext.getAttribute("duration");

Object returnVal = null;

if ((context != null) && (context.trim().length() > 0))
{
    returnVal = sage.SageTV.apiUI(context, "Animate", new Object[] {widgetNameAttr, layerNameAttr, animationNameAttr, durationAttr});
}
else
{
    returnVal = sage.SageTV.api("Animate", new Object[] {widgetNameAttr, layerNameAttr, animationNameAttr, durationAttr});
}
%>

<c:set var="varLocal" value="<%= returnVal %>"/>
