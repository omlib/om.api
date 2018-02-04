package om.api.firebase.storage;

#if nodejs
#elseif js

import om.api.firebase.app.App;

@:native("firebase.storage.Reference")
extern class Reference {
    var parent : Reference;
    var root : Reference;
    function toString() : String;
}

@:jsRequire("firebase.app.Storage")
extern class Storage {
    var app : App;
    var maxOperationRetryTime(default,never) : Float;
    var maxUploadRetryTime(default,never) : Float;
    function ref( path : String ) : Reference;
    function refFromURL( url : String ) : Reference;
    function setMaxOperationRetryTime( time : Float ) : Reference;
    function setMaxUploadRetryTime( time : Float ) : Reference;
}

#end
