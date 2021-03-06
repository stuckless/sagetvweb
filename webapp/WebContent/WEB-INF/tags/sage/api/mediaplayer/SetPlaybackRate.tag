<%--
  -- Unofficial SageTV Generated File - Never Edit
  -- Generated Date/Time: 6/8/11 2:47 PM
  -- See Official Sage Documentation at <a href='http://download.sage.tv/api/sage/api/MediaPlayerAPI.html#SetPlaybackRate(float)'>MediaPlayerAPI.SetPlaybackRate</a>
  -- This Generated API is not Affiliated with SageTV.  It is user contributed.
  --%>
<%@ tag body-content="empty"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ attribute name="context" required="false" type="java.lang.String" %>
<%@ attribute name="playbackRate" required="true" type="java.lang.Float" %>

<%
String contextAttr = (String) jspContext.getAttribute("context");
Object playbackRateAttr = jspContext.getAttribute("playbackRate");

if ((context != null) && (context.trim().length() > 0))
{
    sage.SageTV.apiUI(context, "SetPlaybackRate", new Object[] {playbackRateAttr});
}
else
{
    sage.SageTV.api("SetPlaybackRate", new Object[] {playbackRateAttr});
}
%>
