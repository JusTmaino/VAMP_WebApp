package vamp_webapp

class UrlMappings {

    static mappings = {
        "/car"(resources:"car")
        "/location"(resources:"location")
        "/media"(resources:"media")
        "/playList"(resources:"playlist")
        "/profile"(resources:"profile")
        "/role"(resources:"role")
        "/setting"(resources:"setting")
        "/user"(resources:"user")
        "/userRole"(resources:"userrole")

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
