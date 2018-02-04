package om.api.firebase.messaging;

#if nodejs
#elseif js

import haxe.Constraints.Function;

import js.html.ServiceWorkerRegistration;

@:jsRequire("firebase.messaging.Messaging")
extern class Messaging {
    function deleteToken( token : String ) : Promise<Void>;
    function getToken() : Promise<String>;
    function onMessage( nextOrObserver : Dynamic ) : Function;
    function onTokenRefresh( nextOrObserver : Dynamic ) : Function;
    function requestPermission() : Promise<Void>;
    function setBackgroundMessageHandler( callback : Dynamic->Void ) : Promise<Void>;
    function useServiceWorker( registration : ServiceWorkerRegistration) : Void;
}

#end
