package om.web;

import js.Error;
import js.html.XMLHttpRequest;
import haxe.Json;

@:enum abstract Rating(String) from String to String {
    var y = "y";
    var g = "g";
    var pg = "pg";
    var pg_13 = "pg-13";
    var r = "r";
}

typedef Image = {
    var width : String;
    var height : String;
    var url : String;
    @:optional var size : String;
    @:optional var mp4 : String;
    @:optional var mp4_size : String;
    @:optional var webp : String;
    @:optional var webp_size : String;
    @:optional var frames : String;
}

typedef Images = {
    var downsized : Image;
    var downsized_large : Image;
    var downsized_medium : Image;
    var downsized_still : Image;
    var fixed_height : Image;
    var fixed_height_downsampled : Image;
    var fixed_height_small : Image;
    var fixed_height_small_still : Image;
    var fixed_height_still : Image;
    var fixed_width : Image;
    var fixed_width_downsampled : Image;
    var fixed_width_small : Image;
    var fixed_width_small_still : Image;
    var fixed_width_still : Image;
    var looping : Image;
    var original : Image;
    var original_still : Image;
}

typedef User = {
    var avatar_url : String;
    var banner_url : String;
    var profile_url : String;
    var username : String;
}

typedef Item = {
    var bitly_gif_url : String;
    var bitly_url : String;
    var content_url : String;
    var embed_url : String;
    var id : String;
    var images : Images;
    var import_datetime : String;
    var rating : String;
    var source : String;
    var source_post_url : String;
    var source_tld : String;
    var trending_datetime : String;
    var type : String;
    var url : String;
    var user : User;
    var username : String;
};

typedef SingleImage = Dynamic; //TODO service.random returns this type

typedef Meta = {
    var msg : String;
    var status : Int;
};

typedef Pagination = {
    var count : Int;
    var offset : Int;
    var total_count : Int;
}

typedef RequestResult = {
    var data : SingleImage;
    var meta : Meta;
}

typedef RequestResultSet = {
    var data : Array<Item>;
    var meta : Meta;
    var pagination : Pagination;
}

class Giphy {

    public static inline var API_URL = 'http://api.giphy.com/v1/gifs/';

    public var apiKey : String;

    public function new( apiKey : String ) {
        this.apiKey = apiKey;
    }

    public function search( q : Array<String>, ?limit : Int, ?offset : Int, ?rating : Rating, callback : Error->RequestResultSet->Void ) {

        var params = 'search?q='+q.join('+');
        if( limit != null ) params += '&limit=$limit';
        if( offset != null ) params += '&offset=$offset';
        if( rating != null ) params += '&rating=$rating';

        request( params, callback );
    }

    public function trending( ?limit : Int, ?rating : Rating, callback : Error->RequestResultSet->Void ) {

        var params = 'trending?';
        if( limit != null ) params += '&limit=$limit';
        if( rating != null ) params += '&rating=$rating';

        request( params, callback );
    }

    /*
    public function random( ?tag : String, ?rating : Rating, callback : Error->RequestResult->Void ) {

        var params = 'random?';
        if( tag != null ) params += '&tag=$tag';
        if( rating != null ) params += '&rating=$rating';

        request( params, callback );
    }
    */

    function request<T>( params : String, callback : Error->T->Void ) {
        var req = new XMLHttpRequest();
        req.open( 'GET', '$API_URL$params&api_key=$apiKey', true );
        req.onerror = function(e) callback( e, null );
        req.onload = function(e) callback( null, Json.parse( req.responseText ) );
        req.send();
    }
}
