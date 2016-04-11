package om.api.giphy;

typedef Image = {
    var width : String;
    var height : String;
    var url : String;
    @:optional var size : String;
    @:optional var mp4 : String;
    @:optional var mp4_size : String;
    @:optional var webp : String;
    @:optional var webp_size : String;
    @:optional var frames : String;
}