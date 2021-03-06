<%--
  -- Unofficial SageTV Generated File - Never Edit
  -- Generated Date/Time: 6/8/11 2:47 PM
  -- See Official Sage Documentation at <a href='http://download.sage.tv/api/sage/api/Configuration.html#SetDisplayAspectRatio(float)'>Configuration.SetDisplayAspectRatio</a>
  -- This Generated API is not Affiliated with SageTV.  It is user contributed.
  --%>
<%@ tag body-content="empty"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ attribute name="context" required="false" type="java.lang.String" %>
<%@ attribute name="displayAspectRatio" required="true" type="java.lang.Float" %>

<%
String contextAttr = (String) jspContext.getAttribute("context");
Object displayAspectRatioAttr = jspContext.getAttribute("displayAspectRatio");

if ((context != null) && (context.trim().length() > 0))
{
    sage.SageTV.apiUI(context, "SetDisplayAspectRatio", new Object[] {displayAspectRatioAttr});
}
else
{
    sage.SageTV.api("SetDisplayAspectRatio", new Object[] {displayAspectRatioAttr});
}
%>
