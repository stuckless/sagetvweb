package sagex.streaming.httpls.playlist;

import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.mortbay.log.Log;

import sagex.streaming.servlet.HTTPLiveStreamingPlaylistServlet;

public class VariantPlaylist
{
    public static String[] VARIANT_PLAYLIST_BITRATES_CELL = {"440", "840", "240", "150"};
    public static String[] VARIANT_PLAYLIST_BITRATES_UNKNOWN = {"440", "840", "1240", "240", "150"};
    public static String[] VARIANT_PLAYLIST_BITRATES_WIFI = {"840", "1240", "1840", "440"};
    private static final String LINE_TERM = "\r\n";

    private HttpServletRequest req;
    private int mediaFileId;
    private String defaultBitrate;
    private String playlist;

    public VariantPlaylist(HttpServletRequest req, int mediaFileId, String defaultBitrate)
    {
        if ((defaultBitrate != null) &&
            (defaultBitrate.trim().length() > 0) &&
            !isValidBitrate(defaultBitrate))
        {
            throw new IllegalArgumentException("Bitrate");
        }
        
        this.req = req;
        this.mediaFileId = mediaFileId;
        this.defaultBitrate = defaultBitrate;
        this.playlist = createPlaylist();
    }

    public static String[] variantPlaylistBitrates(){
    	if (HTTPLiveStreamingPlaylistServlet.deviceNetwork.equalsIgnoreCase("cell"))
    		return VARIANT_PLAYLIST_BITRATES_CELL;
    	else if (HTTPLiveStreamingPlaylistServlet.deviceNetwork.equalsIgnoreCase("wifi"))
    		return VARIANT_PLAYLIST_BITRATES_WIFI;
    	else return VARIANT_PLAYLIST_BITRATES_UNKNOWN;
    }
    
    private boolean isValidBitrate(String defaultBitrate)
    {
        for (String bitrate : variantPlaylistBitrates())
        {
            if (bitrate.equals(defaultBitrate))
            {
                return true;
            }
        }
        return false;
    }

    private String createPlaylist()
    {
        StringBuilder sb = new StringBuilder();
    
        String conversionId = UUID.randomUUID().toString();

        // Header
        sb.append("#EXTM3U" + LINE_TERM);
        Log.debug("#EXTM3U");

        // Body
        if ((defaultBitrate != null) &&
            (defaultBitrate.trim().length() > 0))
        {
            sb.append(createPlaylistEntry(conversionId, defaultBitrate));
        }

        for (String bitrate : variantPlaylistBitrates())
        {
            if (!bitrate.equals(defaultBitrate))
            {
                sb.append(createPlaylistEntry(conversionId, bitrate));
            }
        }

        return sb.toString();
    }

    private String createPlaylistEntry(String conversionId, String bitrate)
    {
        String header = "#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=" + bitrate + "000";
        Log.debug(header);

        String url = req.getRequestURL().toString().replace(req.getRequestURI(), "") +
                     req.getContextPath() +
                     "/HTTPLiveStreamingPlaylist" +
//                     req.getPathInfo() +
                     "?MediaFileId=" + mediaFileId +
                     "&ConversionId=" + conversionId +
                     "&Quality=" + bitrate;
        Log.debug(url);

        return header + LINE_TERM + url + LINE_TERM;
    }
    
    public String toString()
    {
        return this.playlist;
    }
}
