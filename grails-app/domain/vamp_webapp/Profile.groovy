package vamp_webapp

class Profile {


    static hasMany = [playlists:PlayList]
    static belongsTo = [user:User]

    static constraints = {
    }
}
