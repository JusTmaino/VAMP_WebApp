package vamp_webapp

class Media {
    String url;

    static belongsTo = [PlayList]

    static constraints = {
        url blank: false;
    }
}
