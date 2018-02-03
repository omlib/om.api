package om.api.firebase.database;

import haxe.Constraints.Function;
import haxe.extern.EitherType;
import om.api.firebase.app.App;

typedef DataSnapshot = Dynamic; //TODO

@:native("firebase.database.ServerValue")
extern class ServerValue {
    static var TIMESTAMP(default,never) : Dynamic;
}

@:native("firebase.database.Query")
extern class Query {
    var ref : Reference;
    function endAt( value : String, key : String ) : Query;
    function equalTo( value : String, key : String ) : Query;
    function isEqual( other : Query ) : Bool;
    function limitToFirst( limit : Int ) : Query;
    function limitToLast( limit : Int ) : Query;
    function off( eventType : String, callback : Function, context : Dynamic ) : Query;
    function on( eventType : String, callback : Function, ?cancelCallbackOrContext : Function, ?context : Dynamic ) : Dynamic;
    function once( eventType : String, successCallback : Function, ?failureCallbackOrContext : EitherType<Function,Dynamic>, ?context : Dynamic ) : Promise<Void>;
    function orderByChild() : Query;
    function orderByKey() : Query;
    function orderByPriority() : Query;
    function orderByValue() : Query;
    function startAt( value : Dynamic, key : String ) : Query;
    function toJSON() : Dynamic;
    function toString() : String;
}

@:native("firebase.database.Reference")
extern class Reference {
    var key : String;
    var parent : Reference;
    var ref : Dynamic;
    var root : Reference;
    function child( path : String ) : Reference;
    function endAt( value : String, key : String ) : Query;
    function equalTo( value : String, key : String ) : Query;
    function isEqual( other : Query ) : Bool;
    function limitToFirst( limit : Int ) : Query;
    function limitToLast( limit : Int ) : Query;
    function off( eventType : String, callback : Function, context : Dynamic ) : Query;
    function on( eventType : String, callback : Function, ?cancelCallbackOrContext : Function, ?context : Dynamic ) : Query;
    function once( eventType : String, successCallback : Function, ?failureCallbackOrContext : EitherType<Function,Dynamic>, ?context : Dynamic ) : Query;
    function onDisconnect() : Dynamic;
    function orderByChild() : Query;
    function orderByKey() : Query;
    function orderByPriority() : Query;
    function orderByValue() : Query;
    function push( ?value : Dynamic, ?onComplete : Function) : Query;
    function remove( ?onComplete : Function) : Promise<Void>;
    function set( value : Dynamic, ?onComplete : Function ) : Promise<Void>;
    function setPriority( priority : EitherType<String,Float>, ?onComplete : Function ) : Promise<Void>;
    function startAt( value : Dynamic, key : String ) : Query;
    function toJSON() : Dynamic;
    function toString() : String;
    function transaction( transactionUpdate : Function, onComplete : Function, applyLocally : Bool ) : Promise<Dynamic>;
    function update( values : Dynamic, ?onComplete : Function ) : Promise<Void>;
}

//@:native("firebase.database.Database")
@:jsRequire("firebase.database.Database")
extern class Database {
    var app(default,never) : App;
    function goOffline() : Void;
    function goOnline() : Void;
    function ref( path : String ) : Reference;
    function refFromURL( url : String ) : Reference;
}
