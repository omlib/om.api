package om.api.google;

#if js
import js.Browser.window;
import js.Promise;
import js.html.Response;
#end

private typedef Question = {
    var name : String;
    var type : Int;
}

private typedef Answer = { > Question,
    var TTL : Int;
    var data : String;
}

typedef Result = {
    var Status: Int;
    var TC: Bool;
    var RD: Bool;
    var RA: Bool;
    var AD: Bool;
    var CD: Bool;
    var Question: Array<Question>;
    var Answer: Array<Question>;
    var Comment: String;
}

/**
    DNS-over-HTTPS.

    https://developers.google.com/speed/public-dns/docs/dns-over-https
*/
class DNS {

    public static inline var URL = 'https://dns.google.com/resolve';

    #if js

    public static function resolve( name : String ) : Promise<Result> {
        return window.fetch( '$URL?name=$name' ).then( function(res:Response) {
            return res.json();
        });
    }

    #end

}
