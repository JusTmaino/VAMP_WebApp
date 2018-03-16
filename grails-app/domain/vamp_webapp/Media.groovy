package vamp_webapp

class Media {
    String url;

    //static belongsTo = [Playlist]

    static constraints = {
        url blank: false;
    }
}
