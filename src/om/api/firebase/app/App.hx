package om.api.firebase.app;

@:jsRequire("firebase.app.App")
extern class App {
    function delete() : Promise<Void>;
    function auth( ?url : String ) : Dynamic; //TODO
    function database( ?url : String ) : om.api.firebase.database.Database;
    function messaging() : Dynamic; //TODO
    function storage() : om.api.firebase.storage.Storage;
}
