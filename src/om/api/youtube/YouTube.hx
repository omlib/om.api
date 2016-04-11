package om.api.youtube;

import js.Browser.document;

/**
    https://developers.google.com/youtube/iframe_api_reference
*/
class YouTube {

    static var callback : Void->Void;

    public static function init( callback : Void->Void ) {

        YouTube.callback = callback;

        var firstScriptElement = document.getElementsByTagName( 'script' )[0];

        var scriptElement = document.createScriptElement();
        scriptElement.src = "https://www.youtube.com/iframe_api";
        firstScriptElement.parentNode.insertBefore( scriptElement, firstScriptElement );

        var callbackElement= document.createScriptElement();
        callbackElement.textContent = 'function onYouTubeIframeAPIReady() { om.api.youtube.YouTube.__onReady(); }';
        firstScriptElement.parentNode.insertBefore( callbackElement, firstScriptElement );
    }

    //public static function search() {

    @:keep
    @:expose
    static function __onReady() callback();

}
