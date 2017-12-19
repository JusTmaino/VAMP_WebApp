package vamp_webapp

class BootStrap {

    def init = { servletContext ->
        def adminRole = new Role(authority: 'ROLE_ADMIN').save(Flush: true, failOnError: true);
        def userRole = new Role(authority: 'ROLE_USER').save(Flush: true, failOnError: true);

        def image = new Image(path: 'avatar-7.png')
        def userImage = new Image(path: 'user.jpg')
        def car_image = new Image(path: 'car.png').save(Flush: true, failOnError: true);

        def play = new PlayList(name: "Playlist1");
        def play1 = new PlayList(name: "Playlist2");

        def adminUser = new User(username: 'admin', password: 'password', fullName: 'surname1' , datenais: new Date(), tel: 123 , mail:'mail@', image: image).save(Flush: true, failOnError: true);
        def adminUser1 = new User(username: 'admin1', password: 'password', fullName: 'surname' , datenais: new Date(), tel: 123 , mail:'mail@').save(Flush: true, failOnError: true);
        def adminUser2 = new User(username: 'admin2', password: 'password', fullName: 'surname' , datenais: new Date(), tel: 123 , mail:'mail@').save(Flush: true, failOnError: true);
        def adminUser3 = new User(username: 'admin3', password: 'password', fullName: 'surname' , datenais: new Date(), tel: 123 , mail:'mail@').save(Flush: true, failOnError: true);
        def userUser = new User(username: 'user', password: 'password',fullName: 'surname' , datenais: new Date(), tel: 123 , mail:'mail@', image: userImage).save(Flush: true, failOnError: true);

        def profile = new Profile(temp_clim : 1 ,retro_pos : 1, sound:0)
        def car2 = new Car( brand : 'Peugeot', model : 'Ion', matricule : 'fhn', nb_place : 4, charge : 50, temperature_ext : 30).save(Flush: true, failOnError: true);
        def car1 = new Car( brand : 'renault', model : 'class e', matricule : 'fhn', nb_place : 4, charge : 50, temperature_ext : 30).save(Flush: true, failOnError: true);
        def car = new Car( brand : 'mercedes', model : 'class e', matricule : 'fhn', nb_place : 4, charge : 50, temperature_ext : 30).save(Flush: true, failOnError: true);
        car2.addToImages(car_image).save(Flush: true, failOnError: true);

        profile.addToPlaylists(play)
        profile.addToPlaylists(play1)

        adminUser.addToCars(car)
        adminUser.addToCars(car1)
        userUser.addToCars(car2)

        adminUser.addToProfile(profile)
        userUser.addToProfile(profile)

        UserRole.create(adminUser, adminRole, true);
        UserRole.create(adminUser1, adminRole, true);
        UserRole.create(adminUser2, adminRole, true);
        UserRole.create(adminUser3, adminRole, true);

        UserRole.create(userUser, userRole, true);
    }
    def destroy = {
    }
}
