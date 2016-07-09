package om.api;

using StringTools;

class Twitter {

    public static inline var URL = 'https://twitter.com';
    public static inline var TWEET_PATH = 'intent/tweet';

    /**
        Usage:

        window.open( Twitter.createTweetURL( 'My text to tweet', 'http://disktree.net' ), '', 'width=618,height=382' );
    */
    public static function createTweetURL( ?text : String, ?url : String, ?via : String ) : String {
        var str = '$URL/$TWEET_PATH?';
        if( text != null ) str += '&text=' + text.urlEncode();
        if( url != null ) str += '&url=' + url.urlEncode();
        if( via != null ) str += '&via=' + via.urlEncode();
        return str;
    }

}
