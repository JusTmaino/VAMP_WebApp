package vamp_webapp

class BootStrap {

    def init = { servletContext ->
        def adminRole = new Role(authority: 'ROLE_ADMIN').save(Flush: true, failOnError: true);
        //def userRole = new Role(authority: 'ROLE_USER').save(Flush: true, failOnError: true);


        def adminUser = new User(username: 'admin', password: 'password', surname: 'surname' , datenais: new Date(), tel: 123 , mail:'mail@').save(Flush: true, failOnError: true);
               //def userUser = new User(username: 'user', password: 'password').save(Flush: true, failOnError: true);
        def profile = new Profile(temp_clim : 1 ,retro_pos : 1, sound:0)
        adminUser.addToProfile(profile)

        UserRole.create(adminUser, adminRole, true);
        //UserRole.create(userUser, userRole, true);
    }
    def destroy = {
    }
}
