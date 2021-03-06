<%--
  -- Unofficial SageTV Generated File - Never Edit
  -- Generated Date/Time: 6/8/11 2:47 PM
  -- See Official Sage Documentation at <a href='http://download.sage.tv/api/sage/api/ChannelAPI.html#GetChannelLogoCount(sage.Channel)'>ChannelAPI.GetChannelLogoCount</a>
  -- This Generated API is not Affiliated with SageTV.  It is user contributed.
  --%>
<%@ tag body-content="empty"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ attribute name="var" required="true" rtexprvalue="false" %>
<%@ variable name-from-attribute="var" alias="varLocal" scope="AT_END" %>
<%@ attribute name="context" required="false" type="java.lang.String" %>
<%@ attribute name="channel" required="true" type="java.lang.Object" %>

<%
String contextAttr = (String) jspContext.getAttribute("context");
Object channelAttr = jspContext.getAttribute("channel");

Object returnVal = null;

if ((context != null) && (context.trim().length() > 0))
{
    returnVal = sage.SageTV.apiUI(context, "GetChannelLogoCount", new Object[] {channelAttr});
}
else
{
    returnVal = sage.SageTV.api("GetChannelLogoCount", new Object[] {channelAttr});
}
%>

<c:set var="varLocal" value="<%= returnVal %>"/>
