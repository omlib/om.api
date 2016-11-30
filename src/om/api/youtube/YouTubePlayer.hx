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
    @:optional var autoplay : Int;
    @:optional var cc_load_policy : Int;
    @:optional var color : ProgressbarColor;
    @:optional var controls : ShowControls;
    @:optional var disablekb : Int;
    @:optional var enablejsapi : Int;
    @:optional var end : Int;
    @:optional var fs : Int;
    @:optional var hl : String;
    @:optional var iv_load_policy : Int;
    @:optional var list : String;
    @:optional var listType : ListType;
    @:optional var loop : Int;
    @:optional var modestbranding : Int;
    @:optional var origin : String;
    @:optional var playerapiid : String;
    @:optional var playlist : String;
    @:optional var playsinline : Int;
    @:optional var rel : Int;
    @:optional var showinfo : Int;
    @:optional var start : Int;
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
    https://developers.google.com/youtube/iframe_api_reference
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
    function setLoop( loopPlaylists : Bool ) : Void;
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
