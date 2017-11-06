package vamp_webapp

class Profile {
    Integer temp_clim;
    Integer retro_pos;
    Integer sound;

    static hasMany = [playlist:PlayList]
    static belongsTo = [user:User]

    static constraints = {
    }
}
