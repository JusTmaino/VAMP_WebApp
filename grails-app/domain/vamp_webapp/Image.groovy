package vamp_webapp

class Image {

    String path;

    static belongsTo = [Car, User]
    static constraints = {
        path blank: false
    }
}