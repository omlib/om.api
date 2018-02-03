package om.api.firebase;

//@:jsRequire("firebase")
@:native("firebase")
extern class Firebase {
    static function initializeApp( config : Dynamic ) : om.api.firebase.app.App;
    //static function database() : Dynamic;
    static function storage( ?app : om.api.firebase.app.App ) : om.api.firebase.storage.Storage;
}
