package vamp_webapp

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString
import grails.compiler.GrailsCompileStatic

@GrailsCompileStatic
@EqualsAndHashCode(includes='username')
@ToString(includes='username', includeNames=true, includePackage=false)
class User implements Serializable {

    private static final long serialVersionUID = 1

    String username
    String password
    boolean enabled = true
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired

    String surname
    Date datenais
    Integer tel
    String mail

    static hasMany = [cars:Car,locations:Location,profile:Profile]
    //static hasOne = [profile:Profile]

    User (String username, String password,String surname,Date datenais, Integer tel,String mail ){
        this.username = username;
        this.password = password;
        this.surname = surname;
        this.datenais = datenais;
        this.tel = tel;
        this.mail = mail;

    }

    Set<Role> getAuthorities() {
        (UserRole.findAllByUser(this) as List<UserRole>)*.role as Set<Role>
    }




    static constraints = {
        password nullable: false, blank: false, password: true
        username nullable: false, blank: false, unique: true
    }

    static mapping = {
	    password column: '`password`'
    }
}
