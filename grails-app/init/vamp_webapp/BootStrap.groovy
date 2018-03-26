package vamp_webapp

class BootStrap {

    def init = { servletContext ->
        /*def adminRole = new Role(authority: 'ROLE_ADMIN').save(Flush: true, failOnError: true);
        def userRole = new Role(authority: 'ROLE_USER').save(Flush: true, failOnError: true);

        def image = new Image(path: 'avatar-7.png').save(Flush: true, failOnError: true);
        def userImage = new Image(path: 'user.jpg').save(Flush: true, failOnError: true);
        def car_image = new Image(path: 'car.png').save(Flush: true, failOnError: true);
        def adminCar_image = new Image(path: 'mercedesClassC.png').save(Flush: true, failOnError: true);
        def adminCar_image1 = new Image(path: 'mercedesClassE.png').save(Flush: true, failOnError: true);

        def media1 = new Media(url:"Charlie Puth - One Call Away.mp3");
        def media2 = new Media(url:"Charlie Puth - We Dont Talk Anymore.mp3");
        def media3 = new Media(url:"DJ Snake ft. Justin Bieber - Let Me Love You.mp3");

        def play = new PlayList(name: "Playlist1",sound: 12);
        play.addToMedias(media1).save(Flush: true, failOnError: true);
        play.addToMedias(media2).save(Flush: true, failOnError: true);
        def play1 = new PlayList(name: "Playlist2",sound: 10);
        play1.addToMedias(media3).save(Flush: true, failOnError: true);

        def adminUser = new User(username: 'admin', password: 'password', fullName: 'surname1' , datenais: new Date(), tel: 123 , mail:'mail@', image: image,adresse: 'route Nice').save(Flush: true, failOnError: true);
        def adminUser1 = new User(username: 'admin1', password: 'password', fullName: 'surname' , datenais: new Date(), tel: 123 , mail:'mail@').save(Flush: true, failOnError: true);
        def adminUser2 = new User(username: 'admin2', password: 'password', fullName: 'surname' , datenais: new Date(), tel: 123 , mail:'mail@').save(Flush: true, failOnError: true);
        def adminUser3 = new User(username: 'admin3', password: 'password', fullName: 'surname' , datenais: new Date(), tel: 123 , mail:'mail@').save(Flush: true, failOnError: true);
        def userUser = new User(username: 'user', password: 'password',fullName: 'surname' , datenais: new Date(), tel: 123 , mail:'mail@', image: userImage,adresse: 'Antibes').save(Flush: true, failOnError: true);

        def car2 = new Car( brand : 'Peugeot', model : 'Ion', matricule : 'fhn', nb_place : 4, charge : 50, temperature_ext : 30)
        def car1 = new Car( brand : 'mercedes', model : 'class E', matricule : 'fhn', nb_place : 4, charge : 50, temperature_ext : 30)
        def car = new Car( brand : 'mercedes', model : 'class C', matricule : 'fhn', nb_place : 4, charge : 50, temperature_ext : 30)
        car.addToImages(adminCar_image).save(Flush: true, failOnError: true);
        car1.addToImages(adminCar_image1).save(Flush: true, failOnError: true);
        car2.addToImages(car_image).save(Flush: true, failOnError: true);

        adminUser.addToCars(car).save(Flush: true, failOnError: true);
        adminUser.addToCars(car1).save(Flush: true, failOnError: true);
        userUser.addToCars(car2).save(Flush: true, failOnError: true);

        def profile = new Profile()
        def profile1 = new Profile()
        adminUser.addToProfiles(profile).save(Flush: true, failOnError: true);
        userUser.addToProfiles(profile1).save(Flush: true, failOnError: true);

        profile.addToPlaylists(play).save(Flush: true, failOnError: true);
        profile1.addToPlaylists(play1).save(Flush: true, failOnError: true);

        UserRole.create(adminUser, adminRole, true);
        UserRole.create(adminUser1, adminRole, true);
        UserRole.create(adminUser2, adminRole, true);
        UserRole.create(adminUser3, adminRole, true);

        UserRole.create(userUser, userRole, true);*/
    }
    def destroy = {
    }
}
