package vamp_webapp

class UrlMappings {

    static mappings = {
        "/api/car"(resources:"car")
        "/api/location"(resources:"location")
        "/api/media"(resources:"media")
        "/api/playList"(resources:"playlist")
        "/api/profile"(resources:"profile")
        "/api/role"(resources:"role")
        "/api/setting"(resources:"setting")
        "/api/user"(resources:"user")
        "/api/userRole"(resources:"userrole")

        "/apii/user/$username"(controller: 'user', action: 'getUserByUsername')

        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/index")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
