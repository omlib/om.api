package om.api.giphy;

import js.Error;
import js.html.XMLHttpRequest;
import haxe.Json;

typedef RequestResult = {
    var data : SingleImage;
    var meta : Meta;
}

typedef RequestResultSet = {
    var data : Array<Item>;
    var meta : Meta;
    var pagination : Pagination;
}

/**
    Helpers for using the https://api.giphy.com/ service.

    See: https://github.com/Giphy/GiphyAPI
*/
class Service {

    public static inline var API_URL = 'http://api.giphy.com/v1/gifs';

    public var apiKey : String;

    public function new( apiKey : String ) {
        this.apiKey = apiKey;
    }

    public function search( q : Array<String>, ?limit : Int, ?offset : Int, ?rating : Rating, callback : Error->RequestResultSet->Void ) {
        var params = '/search?q='+q.join('+');
        if( limit != null ) params += '&limit=$limit';
        if( offset != null ) params += '&offset=$offset';
        if( rating != null ) params += '&rating=$rating';
        request( params, callback );
    }

    public function trending( ?limit : Int, ?rating : Rating, callback : Error->RequestResultSet->Void ) {
        var params = '/trending?';
        if( limit != null ) params += '&limit=$limit';
        if( rating != null ) params += '&rating=$rating';
        request( params, callback );
    }

    public function get( ids : Array<String>, callback : Error->RequestResult->Void ) {
        var params = '?ids=';
        for( id in ids ) params += id;
        request( params, callback );
    }

    public function random( ?tag : String, ?rating : Rating, callback : Error->RequestResult->Void ) {
        var params = '/random?';
        if( tag != null ) params += '&tag=$tag';
        if( rating != null ) params += '&rating=$rating';
        request( params, callback );
    }

    public function request<T>( params : String, callback : Error->T->Void ) {
        var req = new XMLHttpRequest();
        req.open( 'GET', '$API_URL$params&api_key=$apiKey', true );
        req.onerror = function(e) callback( e, null );
        req.onload = function(e) callback( null, Json.parse( req.responseText ) );
        req.send();
    }
}
