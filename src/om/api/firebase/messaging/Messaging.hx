package om.api.firebase.messaging;

import haxe.Constraints.Function;

typedef ServiceWorkerRegistration = Dynamic;

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
