package om.api.youtube;

import js.html.Element;
import haxe.extern.EitherType;

/*
abstract Boolean(Bool) from Bool to Bool {
    public inline function new(b:Bool) this = b;
    @:to public inline function toInt() return this ? 0 : 1;
    @:from public static inline function fromInt( i : Int ) return new Boolean(i==0);
}
*/

@:enum abstract ProgressbarColor(String) from String to String {
    var red = 'red';
    var white = 'white';
}

@:enum abstract ShowControls(Int) from Int to Int {
    var no = 0;
    var def = 1;
    var yes = 2;
}

@:enum abstract ListType(String) from String to String {
    var playlist = 'playlist';
    var search = 'search';
    var user_uploads = 'user_uploads';
}

typedef Options = {
    @:optional var videoId : String;
    @:optional var width : String;
    @:optional var height : String;
    @:optional var playerVars : Parameters;
    @:optional var events : Dynamic;
}

typedef Parameters = {

    /**
        This parameter specifies whether the initial video will automatically start to play when the player loads.
        Supported values are 0 or 1.
        The default value is 0.
    */
    @:optional var autoplay : Int;

    /**
        Setting the parameter's value to 1 causes closed captions to be shown by default, even if the user has turned captions off.
        The default behavior is based on user preference.
    */
    @:optional var cc_load_policy : Int;

    /**
        This parameter specifies the color that will be used in the player's video progress bar to highlight the amount of the video that the viewer has already seen.
        Valid parameter values are red and white, and, by default, the player uses the color red in the video progress bar.
        See the YouTube API blog for more information about color options.
        Note: Setting the color parameter to white will disable the modestbranding option.
    */
    @:optional var color : ProgressbarColor;

    /**
        This parameter indicates whether the video player controls are displayed:
            controls=0 – Player controls do not display in the player.
            controls=1 (default) – Player controls display in the player.
    */
    @:optional var controls : ShowControls;

    /**
        Setting the parameter's value to 1 causes the player to not respond to keyboard controls.
        The default value is 0, which means that keyboard controls are enabled.
        Currently supported keyboard controls are:
            Spacebar or [k]: Play / Pause
            Arrow Left: Jump back 5 seconds in the current video
            Arrow Right: Jump ahead 5 seconds in the current video
            Arrow Up: Volume up
            Arrow Down: Volume Down
            [f]: Toggle full-screen display
            [j]: Jump back 10 seconds in the current video
            [l]: Jump ahead 10 seconds in the current video
            [m]: Mute or unmute the video
            [0-9]: Jump to a point in the video. 0 jumps to the beginning of the video, 1 jumps to the point 10% into the video, 2 jumps to the point 20% into the video, and so forth.
    */
    @:optional var disablekb : Int;

    /**
        Setting the parameter's value to 1 enables the player to be controlled via IFrame or JavaScript Player API calls.
        The default value is 0, which means that the player cannot be controlled using those APIs.
    */
    @:optional var enablejsapi : Int;

    /**
        This parameter specifies the time, measured in seconds from the start of the video, when the player should stop playing the video.
        The parameter value is a positive integer.

        Note that the time is measured from the beginning of the video and not from either the value of the start player parameter or the startSeconds parameter, which is used in YouTube Player API functions for loading or queueing a video.
    */
    @:optional var end : Int;

    /**
        Setting this parameter to 0 prevents the fullscreen button from displaying in the player.
        The default value is 1, which causes the fullscreen button to display.
    */
    @:optional var fs : Int;

    /**
        Sets the player's interface language.
        The parameter value is an ISO 639-1 two-letter language code or a fully specified locale.
        For example, fr and fr-ca are both valid values. Other language input codes, such as IETF language tags (BCP 47) might also be handled properly.

        The interface language is used for tooltips in the player and also affects the default caption track.
        Note that YouTube might select a different caption track language for a particular user based on the user's individual language preferences and the availability of caption tracks.
    */
    @:optional var hl : String;

    /**
        Setting the parameter's value to 1 causes video annotations to be shown by default, whereas setting to 3 causes video annotations to not be shown by default.
        The default value is 1.
    */
    @:optional var iv_load_policy : Int;

    /**
        The list parameter, in conjunction with the listType parameter, identifies the content that will load in the player.
        If the listType parameter value is search, then the list parameter value specifies the search query.
        If the listType parameter value is user_uploads, then the list parameter value identifies the YouTube channel whose uploaded videos will be loaded.
        If the listType parameter value is playlist, then the list parameter value specifies a YouTube playlist ID.

        In the parameter value, you need to prepend the playlist ID with the letters PL as shown in the example below.
        https://www.youtube.com/embed?listType=playlist&list=PLC77007E23FF423C6

        Note: If you specify values for the list and listType parameters, the IFrame embed URL does not need to specify a video ID.
    */
    @:optional var list : String;

    /**
        The listType parameter, in conjunction with the list parameter, identifies the content that will load in the player.
        Valid parameter values are playlist, search, and user_uploads.

        If you specify values for the list and listType parameters, the IFrame embed URL does not need to specify a video ID.
    */
    @:optional var listType : ListType;

    /**
        In the case of a single video player, a setting of 1 causes the player to play the initial video again and again.
        In the case of a playlist player (or custom player), the player plays the entire playlist and then starts again at the first video.
        Supported values are 0 and 1, and the default value is 0.
    */
    @:optional var loop : Int;

    /**
        This parameter lets you use a YouTube player that does not show a YouTube logo.
        Set the parameter value to 1 to prevent the YouTube logo from displaying in the control bar.
        Note that a small YouTube text label will still display in the upper-right corner of a paused video when the user's mouse pointer hovers over the player.
    */
    @:optional var modestbranding : Int;

    /**
        This parameter provides an extra security measure for the IFrame API and is only supported for IFrame embeds.
        If you are using the IFrame API, which means you are setting the enablejsapi parameter value to 1, you should always specify your domain as the origin parameter value.
    */
    @:optional var origin : String;

    /**
    */
    //@:optional var playerapiid : String;

    /**
        This parameter specifies a comma-separated list of video IDs to play.
        If you specify a value, the first video that plays will be the VIDEO_ID specified in the URL path, and the videos specified in the playlist parameter will play thereafter.
    */
    @:optional var playlist : String;

    /**
        This parameter controls whether videos play inline or fullscreen in an HTML5 player on iOS.
        Valid values are:
            0: This value causes fullscreen playback. This is currently the default value, though the default is subject to change.
            1: This value causes inline playback for UIWebViews created with the allowsInlineMediaPlayback property set to TRUE.
    */
    @:optional var playsinline : Int;

    /**
        This parameter indicates whether the player should show related videos when playback of the initial video ends.
        Supported values are 0 and 1.
        The default value is 1.
    */
    @:optional var rel : Int;

    /**
        Supported values are 0 and 1.
        Setting the parameter's value to 0 causes the player to not display information like the video title and uploader before the video starts playing.
        If the player is loading a playlist, and you explicitly set the parameter value to 1, then, upon loading, the player will also display thumbnail images for the videos in the playlist.
        Note that this functionality is only supported for the AS3 player.
    */
    @:optional var showinfo : Int;

    /**
        This parameter causes the player to begin playing the video at the given number of seconds from the start of the video.
        The parameter value is a positive integer. Note that similar to the seekTo function, the player will look for the closest keyframe to the time you specify.
        This means that sometimes the play head may seek to just before the requested time, usually no more than around two seconds.
    */
    @:optional var start : Int;

    /**
        This parameter identifies the URL where the player is embedded.
        This value is used in YouTube Analytics reporting when the YouTube player is embedded in a widget, and that widget is then embedded in a web page or application.
        In that scenario, the origin parameter identifies the widget provider's domain, but YouTube Analytics should not identify the widget provider as the actual traffic source.
        Instead, YouTube Analytics uses the widget_referrer parameter value to identify the domain associated with the traffic source.
    */
    @:optional var widget_referrer : Int;
}

@:enum abstract PlaybackQuality(String) from String to String {
    var small = 'small';
    var medium = 'medium';
    var large = 'large';
    var hd720 = 'hd720';
    var hd1080 = 'hd1080';
    var highres = 'highres';
    var _default = 'default';
}

@:enum abstract PlayerState(Int) from Int to Int {
    var unstarted = -1;
    var ended = 0;
    var playing = 1;
    var paused = 2;
    var buffering = 3;
    var video_cued = 5;
}

/*
@:enum abstract PlayerError(Int) from Int to Int {
    var invalid_parameter_value = 2;
}
*/

/**
    @see: https://developers.google.com/youtube/iframe_api_reference
*/
@:native("YT.Player")
extern class YouTubePlayer {

    //var c(default,never) : Element;

    /**
        The first parameter specifies either the DOM element or the id of the HTML element where the API will insert the <iframe> tag containing the player.
        The second parameter is an object that specifies player options.
    */
    function new( id : String, ?params : Options ) : Void;

    function loadVideoById( id : String, ?startSeconds : Float, ?suggestedQuality : PlaybackQuality ) : Void;
    function loadVideoByUrl( mediaContentUrl : String, ?startSeconds : Float, ?suggestedQuality : PlaybackQuality ) : Void;
    function cueVideoById( id : String, ?startSeconds : Float, ?suggestedQuality : PlaybackQuality ) : Void;
    function cueVideoByUrl( mediaContentUrl : String, ?startSeconds : Float, ?suggestedQuality : PlaybackQuality ) : Void;
    function cuePlaylist( playlist : EitherType<String,Array<String>>, ?index : Int, ?startSeconds : Float, ?suggestedQuality : PlaybackQuality ) : Void;
    function loadPlaylist( playlist : EitherType<String,Array<String>>, ?index : Int, ?startSeconds : Float, ?suggestedQuality : PlaybackQuality ) : Void;

    function playVideo() : Void;
    function pauseVideo() : Void;
    function stopVideo() : Void;
    function seekTo( seconds : Float, ?allowSeekAhead : Bool ) : Void;
    //function clearVideo() : Void;

    function nextVideo() : Void;
    function previousVideo() : Void;
    function playVideoAt( index : Int ) : Void;

    function mute() : Void;
    function unMute() : Void;
    function isMuted() : Bool;
    function setVolume( volume : Float ) : Void;
    function getVolume() : Int;

    function setSize( width : Int, height : Int ) : Dynamic;

    function getPlaybackRate() : Float;
    function setPlaybackRate( suggestedRate : Float ) : Void;
    function getAvailablePlaybackRates() : Array<Float>;
    //function setLoop( loopPlaylists : Bool ) : Void;
    function setShuffle( shufflePlaylist : Bool ) : Void;

    function getVideoLoadedFraction() : Float;
    function getPlayerState() : Float;
    function getCurrentTime() : Float;

    function getPlaybackQuality() : PlaybackQuality;
    function setPlaybackQuality( suggestedQuality : PlaybackQuality ) : Void;
    function getAvailableQualityLevels() : Array<PlaybackQuality>;

    function getDuration() : Float;
    function getVideoUrl() : String;
    function getVideoEmbedCode() : String;
    function getPlaylist() : Array<String>;
    function getPlaylistIndex() : Int;

    function addEventListener<T>( event : String, listener : T->Void ) : Void;
    function removeEventListener<T>( event : String, listener : T->Void ) : Void;

    function getIframe() : Dynamic;

    function destroy() : Void;
}
