package om.api.firebase.auth;

import haxe.Constraints.Function;
import haxe.extern.EitherType;
import om.api.firebase.app.App;

@:jsRequire("firebase.auth.ActionCodeInfo")
extern class ActionCodeInfo {
    var operation : String;
    var data : Dynamic;
}

typedef UserCredential = {
    user : om.api.firebase.User,
    credential : AuthCredential,
    operationType : String,
    additionalUserInfo : AdditionalUserInfo
}

typedef AuthCredential = {
    providerId : String
}

typedef AdditionalUserInfo = {
    providerId : String,
    ?profile : Dynamic,
    ?username : String,
    isNewUser : Bool,
}

typedef ActionCodeSettings = {
    url : String,
    ?iOS : { bundleId: String },
    android : { packageName: String, ?installApp : Bool },
    ?minimumVersion : String,
    ?handleCodeInApp : Bool
}

@:native("firebase.auth.ConfirmationResult")
extern class ConfirmationResult {
    var verificationId(default,null) : String;
    function confirm( verificationCode : String ) : Promise<UserCredential>;
}

@:native("firebase.auth.ApplicationVerifier")
extern class ApplicationVerifier {
    var type(default,null) : String;
    function verify() : Promise<String>;
}

typedef AuthProvider = {
    providerId : String
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
    function createUserAndRetrieveDataWithEmailAndPassword( email : String, password : String ) : Promise<UserCredential>;
    function createUserWithEmailAndPassword( email : String, password : String ) : Promise<User>;
    function fetchProvidersForEmail( email : String ) : Promise<Array<String>>;
    function getRedirectResult() : Promise<Array<UserCredential>>;
    function onAuthStateChanged( nextOrObserver : Dynamic, ?error : Function, ?completed : Function ) : Function;
    function onIdTokenChanged( nextOrObserver : Dynamic, ?error : Function, ?completed : Function ) : Function;
    function sendPasswordResetEmail( email : String, ?actionCodeSettings : ActionCodeSettings ) : Promise<Void>;
    function setPersistence( persistence : String ) : Promise<Void>;
    function signInAndRetrieveDataWithCredential( credential : AuthCredential ) : Promise<UserCredential>;
    function signInAndRetrieveDataWithCustomToken( token : String ) : Promise<UserCredential>;
    function signInAndRetrieveDataWithEmailAndPassword( email : String, password : String ) : Promise<UserCredential>;
    function signInAnonymously( email : String, password : String ) : Promise<User>;
    function signInAnonymouslyAndRetrieveData( email : String, password : String ) : Promise<UserCredential>;
    function signInWithCredential( credential : AuthCredential ) : Promise<User>;
    function signInWithCustomToken( token : String ) : Promise<User>;
    function signInWithEmailAndPassword( email : String, password : String ) : Promise<User>;
    function signInWithPhoneNumber( phoneNumber : String, applicationVerifier : ApplicationVerifier ) : Promise<ConfirmationResult>;
    function signInWithPopup( provider : AuthProvider ) : Promise<UserCredential>;
    function signInWithRedirect( provider : AuthProvider ) : Promise<UserCredential>;
    function useDeviceLanguage() : Void;
    function verifyPasswordResetCode( code : String ) : Promise<String>;
}
