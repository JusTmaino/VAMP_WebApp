package vamp_webapp

class Setting {

    Integer temp_clim;
    Integer retro_pos;

    static constraints = {
        temp_clim nullable:false
        retro_pos nullable:false
        sound nullable:false
    }
}
