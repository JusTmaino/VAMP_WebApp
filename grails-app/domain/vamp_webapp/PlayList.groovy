package vamp_webapp

class PlayList {
    String name;
    Integer sound;

    static belongsTo = [Profile]
    static hasMany = [medias:Media]

    static constraints = {
        name blank: false;
    }
}
