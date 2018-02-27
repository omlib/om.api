package om.api;

@:enum abstract ImageSize(String) from String to String {
    var large = 'large';
    var medium = 'medium';
    var icon = 'icon';
}

typedef GoogleImagesSearchOption = {
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
@:jsRequire("google-images")
extern class GoogleImages {
    function new( id : String, apiKey : String ) : Void;
    function search( query : String, options : GoogleImagesSearchOption ) : Promise<Array<Dynamic>>;
    function buildQuery( query : String, options : GoogleImagesSearchOption ) : String;
}
