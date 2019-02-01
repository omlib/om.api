package om.api.giphy;

#if js

import js.html.URLSearchParams;
import js.Promise;

enum abstract GIFEndpoint(String) to String {
    var search;
    var trending;
    var translate;
    var random;
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

/**
    Helpers for using the https://api.giphy.com/ service.

    @see: https://github.com/Giphy/GiphyAPI
*/
class Service {

    public static inline var API_URI = 'http://api.giphy.com/v1/gifs';

    public var apiKey : String;

    public function new( apiKey : String ) {
        this.apiKey = apiKey;
    }

    /**
    **/
    public function get( id : String ) : Promise<RequestResult> {
        var params = new URLSearchParams();
        params.append( 'gif_id', id );
        return fetch( '', params );
    }

    /**
    **/
    public function getMany( ids : Array<String> ) : Promise<RequestResult> {
        var params = new URLSearchParams();
        params.append( 'ids', ids.join('+') );
        return fetch( '', params );
    }

    /**
        @see https://developers.giphy.com/docs/#search-endpoint
    **/
    public function search( q : Array<String>, ?limit : Int, ?offset : Int, ?rating : Rating, ?lang : String ) : Promise<RequestResultSet> {
        var params = new URLSearchParams();
        params.append( 'q', q.join('+') );
        if( limit != null ) params.append( 'limit', Std.string( limit ) );
        if( offset != null ) params.append( 'offset', Std.string( offset ) );
        if( rating != null ) params.append( 'rating', rating );
        if( lang != null ) params.append( 'lang', lang );
        return fetch( 'search', params );
    }

    /**
        @see https://developers.giphy.com/docs/#trending-endpoint
    **/
    public function trending( ?limit : Int, ?offset : Int, ?rating : Rating ) : Promise<RequestResultSet> {
        var params = new URLSearchParams();
        if( limit != null ) params.append( 'limit', Std.string( limit ) );
        if( offset != null ) params.append( 'offset', Std.string( offset ) );
        if( rating != null ) params.append( 'rating', rating );
        return fetch( 'trending', params );
    }

    /**
        The translate API draws on search, but uses the GIPHY special sauce to handle translating from one vocabulary to another. In this case, words and phrases to GIFs.

        @see https://developers.giphy.com/docs/#translate-endpoint
    **/
    public function translate( s : String, ?weirdness : Int ) : Promise<RequestResultSet> {
        var params = new URLSearchParams();
        params.append( 's', s );
        if( weirdness != null ) params.append( 'weirdness', Std.string( weirdness ) );
        return fetch( 'translate', params );
    }

    /**
        https://developers.giphy.com/docs/#random-endpoint
    **/
    public function random( ?tag : String, ?rating : Rating ) : Promise<RequestResult> {
       var params = new URLSearchParams();
        if( tag != null ) params.append( 'tag', tag );
        if( rating != null ) params.append( 'rating', rating );
        return fetch( 'random', params );
    }

    // TODO: stickers

    function fetch<T>( path : String, params : URLSearchParams ) : Promise<T> {
        return FetchTools.fetchJson( '$API_URI/$path?'+untyped params.toString()+'&api_key=$apiKey' );
    }
}

#end
