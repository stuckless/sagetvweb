<%--
  -- Unofficial SageTV Generated File - Never Edit
  -- Generated Date/Time: 7/17/10 8:25 AM
  -- See Official Sage Documentation at <a href='http://download.sage.tv/api/sage/api/PluginAPI.html#GetPluginConfigOptions(sage.Plugin, java.lang.String)'>PluginAPI.GetPluginConfigOptions</a>
  -- This Generated API is not Affiliated with SageTV.  It is user contributed.
  --%>
<%@ tag body-content="empty"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ attribute name="var" required="true" rtexprvalue="false" %>
<%@ variable name-from-attribute="var" alias="varLocal" scope="AT_END" %>
<%@ attribute name="context" required="false" type="java.lang.String" %>
<%@ attribute name="plugin" required="true" type="java.lang.Object" %>
<%@ attribute name="settingName" required="true" type="java.lang.String" %>

<%
String contextAttr = (String) jspContext.getAttribute("context");
Object pluginAttr = jspContext.getAttribute("plugin");
Object settingNameAttr = jspContext.getAttribute("settingName");

Object returnVal = null;

if ((context != null) && (context.trim().length() > 0))
{
    returnVal = sage.SageTV.apiUI(context, "GetPluginConfigOptions", new Object[] {pluginAttr, settingNameAttr});
}
else
{
    returnVal = sage.SageTV.api("GetPluginConfigOptions", new Object[] {pluginAttr, settingNameAttr});
}
%>

<c:set var="varLocal" value="<%= returnVal %>"/>
