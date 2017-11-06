package vamp_webapp

class PlayList {
    String name;

    static hasMany = [medias:Media]

    static constraints = {
        name blank: false;
    }
}
