package vamp_webapp

class Profile {


    static hasMany = [playlists:PlayList,settings:Setting]
    static belongsTo = [user:User]

    static constraints = {
    }
}
