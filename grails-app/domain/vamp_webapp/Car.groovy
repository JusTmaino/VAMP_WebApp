package vamp_webapp

class Car {
    String brand;

    String model;
    String matricule;
    Integer nb_place;
    Integer charge;
    Integer temperature_ext;
    boolean locked;


    static hasMany = [images:Image]
    //static hasMany = [users:User]
    //static  hasOne = [location:Location]

    static constraints = {
        brand blank: false
        model blank: false
        matricule blank: false
        nb_place nullable:false
        charge nullable:false
        temperature_ext nullable:false
    }
}
