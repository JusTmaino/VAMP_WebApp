package vamp_webapp

class Profile {


    static hasMany = [playlists:PlayList]
    static belongsTo = [User]

    static constraints = {
    }
}
