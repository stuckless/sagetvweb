<%--
  -- Unofficial SageTV Generated File - Never Edit
  -- Generated Date/Time: 6/8/11 2:47 PM
  -- See Official Sage Documentation at <a href='http://download.sage.tv/api/sage/api/PlaylistAPI.html#AddToPlaylist(sage.Playlist, java.lang.Object)'>PlaylistAPI.AddToPlaylist</a>
  -- This Generated API is not Affiliated with SageTV.  It is user contributed.
  --%>
<%@ tag body-content="empty"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ attribute name="context" required="false" type="java.lang.String" %>
<%@ attribute name="playlist" required="true" type="java.lang.Object" %>
<%@ attribute name="newItem" required="true" type="java.lang.Object" %>

<%
String contextAttr = (String) jspContext.getAttribute("context");
Object playlistAttr = jspContext.getAttribute("playlist");
Object newItemAttr = jspContext.getAttribute("newItem");

if ((context != null) && (context.trim().length() > 0))
{
    sage.SageTV.apiUI(context, "AddToPlaylist", new Object[] {playlistAttr, newItemAttr});
}
else
{
    sage.SageTV.api("AddToPlaylist", new Object[] {playlistAttr, newItemAttr});
}
%>
