package sagex.streaming.servlet;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mortbay.log.Log;

import sagex.api.MediaFileAPI;
import sagex.streaming.httpls.playlist.SegmentPlaylist;
import sagex.streaming.httpls.playlist.VariantPlaylist;

@SuppressWarnings("serial")
public class HTTPLiveStreamingPlaylistServlet extends SageServlet
{
	public static int deviceHeight = -1;
	public static int deviceWidth = -1;
	public static String deviceNetwork = "unknown";

	public HTTPLiveStreamingPlaylistServlet()
    {
    }

    @Override
    protected void doServletGet(HttpServletRequest req, HttpServletResponse resp)
            throws Exception
    {
//        System.out.println("PathInfo " + req.getPathInfo());
//        System.out.println("PathTranslated " + req.getPathTranslated());
//        System.out.println("Protocol " + req.getProtocol());
//        System.out.println("RequestURI " + req.getRequestURI());
//        System.out.println("Scheme " + req.getScheme());
//        System.out.println("ServerName " + req.getServerName());
//        System.out.println("ServerPort " + req.getServerPort());
//        System.out.println("ContextPath " + req.getContextPath());
//        System.out.println("ServletPath " + req.getServletPath());
//        System.out.println("RequestURL " + req.getRequestURL());
//        System.out.println("ServerURL " + req.getRequestURL().toString().replace(req.getRequestURI(), ""));
        
        // remove servlet URL from thread name so the SageTV log is easier to read
        String threadName = Thread.currentThread().getName();
        int i = threadName.indexOf("/stream");
        if (i >= 1) // the request URL is not part of the thread name when the log level is INFO
        {
            Thread.currentThread().setName(threadName.substring(0, i));
        }
        
        Object mediaFile = super.getMediaFile(req);
        if (mediaFile == null)
        {
            throw new IllegalArgumentException("No MediaFileID passed");
        }
        int mediaFileId = MediaFileAPI.GetMediaFileID(mediaFile);

        Log.debug("----------- HTTPLiveStreamingPlaylistServlet begin request Headers ---------------");

        Enumeration<?> headers = req.getHeaderNames();
        while (headers.hasMoreElements())
        {
            String headerName = (String) headers.nextElement();
            if ((headerName != null) && (!headerName.equals("Host")) && (!headerName.equals("Authorization")))
            {
                Log.debug(headerName + ": " + req.getHeader(headerName));
            }
        }
        Log.debug("----------- HTTPLiveStreamingPlaylistServlet end request Headers ---------------");

        // Servers that are constrained for compatibility can serve files ending in .m3u with MIME type audio/mpegURL
//        resp.setContentType("audio/x-mpegurl");
        resp.setContentType("application/x-mpegURL");
//        resp.setContentType("application/vnd.apple.mpegurl");

        resp.setHeader("Accept-Ranges", "none");
        
        String conversionId = req.getParameter("ConversionId");
        String quality = req.getParameter("Quality"); // cell <= 440, otherwise wifi
        String height = req.getParameter("Height");
        String width = req.getParameter("Width");

        try{
        	Log.info("HTTPLiveStreamingPlaylistServlet - working...");
        	if (deviceNetwork.equalsIgnoreCase("unknown")){ // Initial request
	            if (quality != null && !quality.isEmpty())
	            	deviceNetwork = (Integer.parseInt(quality) <= 440 ? "cell" : "wifi");
	            else deviceNetwork = "Other";
	        	Log.debug("HTTPLiveStreamingPlaylistServlet - network: " + deviceNetwork);
	        	Log.debug("HTTPLiveStreamingPlaylistServlet - dimension: " + height + "x" + width);
	
	            if (height != null && width != null && !height.isEmpty() && !width.isEmpty()){
	            	deviceHeight = Math.min(Integer.parseInt(height), Integer.parseInt(width));
	            	deviceWidth = Math.max(Integer.parseInt(height), Integer.parseInt(width));
	            }
	        	Log.debug("HTTPLiveStreamingPlaylistServlet - dimension2: " + deviceWidth + "x" + deviceHeight);
        	}
        } catch (Exception e){
        	Log.info("HTTPLiveStreamingPlaylistServlet - error: " + e.getMessage());
        }
                
        // Get some global variable from those or pass them along through many layers?
        String playlist = "";
        if (conversionId == null)
        {
            playlist = new VariantPlaylist(req, mediaFileId, quality).toString();
        }
        else
        {
            playlist = new SegmentPlaylist(req, mediaFile, conversionId, quality).toString();
        }
        
        byte[] playlistBytes = playlist.getBytes("UTF-8");

        resp.setHeader("Content-Length", String.valueOf(playlistBytes.length));
        resp.setHeader("Cache-Control", "none");
        resp.setHeader("Pragma", "no-cache");
        
        // TODO how should integer overflow be handled
        try
        {
            // TODO ByteBuffer
            // TODO EofException
//            resp.getWriter().print(sb.toString());
//            resp.getWriter().flush();
//            for (long i = startByte; i < byteCount; i += 1)
//            {
//                Log.debug("i: " + i);
//                resp.getOutputStream().write(sbBytes, (int) i/*startByte*/, (int) Math.min(1, byteCount - i + 1)/*byteCount*/);
//            }
            resp.getOutputStream().write(playlistBytes);
            resp.getOutputStream().flush();
        }
        catch (Exception e)
        {
            Log.warn(e.getMessage(), e);
            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
        finally
        {
            Log.debug("Playlist Chars: " + playlist.length() + ", Bytes: " + playlistBytes.length);
            Thread.currentThread().setName(threadName);
        }
    }
}
