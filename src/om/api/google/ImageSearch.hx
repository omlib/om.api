package om.api.google;

@:enum abstract ImageSize(String) from String to String {
    var large = 'large';
    var medium = 'medium';
    var icon = 'icon';
}

typedef ImageSearchOption = {
    ?page : Int,
    ?size : ImageSize,
    ?type : String,
    ?colorType : String,
    ?dominantColor : String,
    ?safe : String
}

/**
    https://www.npmjs.com/package/google-images
    
    Create a Google Custom Search Engine: https://cse.google.com/cse
    
**/
@:require(js,nodejs)
@:jsRequire("google-images")
extern class ImageSearch {
    function new( id : String, apiKey : String ) : Void;
    function search( query : String, options : ImageSearchOption ) : Promise<Array<Dynamic>>;
    function buildQuery( query : String, options : ImageSearchOption ) : String;
}
