package vamp_webapp

class Car {
    String brand;
    String model;
    Integer matricule;
    Integer nb_place;
    Integer charge;
    Integer temperature_ext;
    boolean locked;



    static hasMany = [users:User]
    static  hasOne = [location:Location]

    static constraints = {
        brand blank: false
        model blank: false
        matricule nullable:false
        nb_place nullable:false
        charge nullable:false
        temperature_ext nullable:false
    }
}
