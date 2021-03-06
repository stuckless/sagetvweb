<%--
  -- Unofficial SageTV Generated File - Never Edit
  -- Generated Date/Time: 7/17/10 8:25 AM
  -- See Official Sage Documentation at <a href='http://download.sage.tv/api/sage/api/Configuration.html#SetDVDDXVADeinterlaceMode(java.lang.String)'>Configuration.SetDVDDXVADeinterlaceMode</a>
  -- This Generated API is not Affiliated with SageTV.  It is user contributed.
  --%>
<%@ tag body-content="empty"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ attribute name="context" required="false" type="java.lang.String" %>
<%@ attribute name="deinterlaceMode" required="true" type="java.lang.String" %>

<%
String contextAttr = (String) jspContext.getAttribute("context");
Object deinterlaceModeAttr = jspContext.getAttribute("deinterlaceMode");

if ((context != null) && (context.trim().length() > 0))
{
    sage.SageTV.apiUI(context, "SetDVDDXVADeinterlaceMode", new Object[] {deinterlaceModeAttr});
}
else
{
    sage.SageTV.api("SetDVDDXVADeinterlaceMode", new Object[] {deinterlaceModeAttr});
}
%>
