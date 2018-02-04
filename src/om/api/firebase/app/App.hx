package om.api.firebase.app;

@:jsRequire("firebase.app.App")
extern class App {
    function auth( ?url : String ) : om.api.firebase.auth.Auth;
    function database( ?url : String ) : om.api.firebase.database.Database;
    function delete() : Promise<Void>;
    #if !nodejs
    function messaging() : om.api.firebase.messaging.Messaging;
    function storage() : om.api.firebase.storage.Storage;
    #end
}
