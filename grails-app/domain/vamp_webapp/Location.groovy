package vamp_webapp

class Location {
    Integer longitude;
    Integer latitude;

    static belongsTo = [car:Car]

    static constraints = {
        longitude nullable:false
        latitude nullable:false
    }
}
