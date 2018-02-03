package om.api.firebase.auth;

import haxe.Constraints.Function;
import haxe.extern.EitherType;
import om.api.firebase.app.App;

@:jsRequire("firebase.auth.ActionCodeInfo")
extern class ActionCodeInfo {
    var operation : String;
    var data : Dynamic;
}

@:jsRequire("firebase.auth.Auth")
extern class Auth {

    static var LOCAL(default,never) : String;
    static var NONE(default,never) : String;
    static var SESSION(default,never) : String;

    static var Persistence(default,never) : String;

    var app(default,never) : App;
    var currentUser(default,never) : User;
    var languageCode(default,never) : String;

    function applyActionCode( code : String ) : Promise<Void>;
    function checkActionCode( code : String ) : Promise<ActionCodeInfo>;
    function confirmPasswordReset( code : String, newPassword : String ) : Promise<Void>;
    //.......

}
