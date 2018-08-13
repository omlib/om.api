package om.api.youtube;

import js.Browser.document;

/**
    Utility to initialize the youtube api.

    https://developers.google.com/youtube/iframe_api_reference
*/
class YouTube {

    @:keep
    @:expose
    static function __onReady() callback();

    static var callback : Void->Void;

    public static function init( callback : Void->Void ) {

        om.api.youtube.YouTube.callback = callback;

        var firstScriptElement = document.getElementsByTagName( 'script' )[0];

        var scriptElement = document.createScriptElement();
        scriptElement.src = "https://www.youtube.com/iframe_api";
        firstScriptElement.parentNode.insertBefore( scriptElement, firstScriptElement );

        var cbElement = document.createScriptElement();
        cbElement.textContent = 'function onYouTubeIframeAPIReady(){om.api.youtube.YouTube.__onReady();}';
        firstScriptElement.parentNode.insertBefore( cbElement, firstScriptElement );
    }

}
