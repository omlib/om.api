package om.api.youtube;

#if js

import js.Browser.document;

/**
    Utility to initialize the youtube api.

    @see: https://developers.google.com/youtube/iframe_api_reference
*/
class YouTube {

    @:keep
    @:expose
    static function __onYoutubeReady__() callback();

    static var callback : Void->Void;

    public static function init( callback : Void->Void ) {

        om.api.youtube.YouTube.callback = callback;

        //TODO html head only
        var scriptElements = document.getElementsByTagName( 'script' );
        //TODO if( scriptElements.length == 0 )

        var firstScriptElement = scriptElements[0];

        var scriptElement = document.createScriptElement();
        scriptElement.src = "https://www.youtube.com/iframe_api";
        firstScriptElement.parentNode.insertBefore( scriptElement, firstScriptElement );

        var cbe = document.createScriptElement();
        cbe.textContent = 'function onYouTubeIframeAPIReady(){om.api.youtube.YouTube.__onYoutubeReady__();}';
        firstScriptElement.parentNode.insertBefore( cbe, firstScriptElement );
    }

}

#end
