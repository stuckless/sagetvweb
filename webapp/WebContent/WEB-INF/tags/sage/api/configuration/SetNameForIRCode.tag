<%--
  -- Unofficial SageTV Generated File - Never Edit
  -- Generated Date/Time: 7/17/10 8:25 AM
  -- See Official Sage Documentation at <a href='http://download.sage.tv/api/sage/api/Configuration.html#SetNameForIRCode(long, java.lang.String)'>Configuration.SetNameForIRCode</a>
  -- This Generated API is not Affiliated with SageTV.  It is user contributed.
  --%>
<%@ tag body-content="empty"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ attribute name="context" required="false" type="java.lang.String" %>
<%@ attribute name="iRCode" required="true" type="java.lang.Long" %>
<%@ attribute name="name" required="true" type="java.lang.String" %>

<%
String contextAttr = (String) jspContext.getAttribute("context");
Object iRCodeAttr = jspContext.getAttribute("iRCode");
Object nameAttr = jspContext.getAttribute("name");

if ((context != null) && (context.trim().length() > 0))
{
    sage.SageTV.apiUI(context, "SetNameForIRCode", new Object[] {iRCodeAttr, nameAttr});
}
else
{
    sage.SageTV.api("SetNameForIRCode", new Object[] {iRCodeAttr, nameAttr});
}
%>
