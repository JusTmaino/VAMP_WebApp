package vamp_webapp

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PlayListController {

    static responseFormats = ['html', 'json']

    static allowedMethods = [save: "POST", update: ["PUT","POST"], delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond PlayList.list(params), model:[playListCount: PlayList.count()]
    }

    def show(PlayList playList) {
        respond playList
    }

    def create() {
        respond new PlayList(params)
    }

    @Transactional
    def save(PlayList playList) {
        if (playList == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (playList.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond playList.errors, view:'create'
            return
        }

        /*if (!request.getFile('file').empty){
            def file = request.getFile('file')
            def type = file.contentType.toString()
            type = type.substring(type.indexOf("/")+1,type.length())

            def name = file.originalFilename
            playList.addToMedias(new Media(url: name))
            file.transferTo(new java.io.File(grailsApplication.config.server.uploadImage+'media/'+name))
        }*/

        request.getMultiFileMap().files.each {
            def name = it.originalFilename
            playList.addToMedias(new Media(url: name))
            it.transferTo(new java.io.File(grailsApplication.config.server.uploadImage +'media/'+ name))
        }

        playList.save flush:true

        User user = User.findById(sec.loggedInUserInfo(field: 'id'))
        System.out.println("username : "+user.username)
        Set<Profile> profiles = user.getProfiles()
        System.out.println("size : "+profiles.size())
        if (profiles.size() > 0){
            (0..profiles.size() - 1).each {
                int i ->
                    System.out.println("profile  : "+profiles[i])
                    profiles[i].addToPlaylists(playList).save(Flush: true, failOnError: true)
            }
        }
        else {
            Profile profile = new Profile()
            user.addToProfiles(profile).save(Flush: true, failOnError: true)
            profile.addToPlaylists(playList).save(Flush: true, failOnError: true)
            user.addToProfiles(profile)
        }
        System.out.println("size after : "+user.getProfiles().size())


        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'playList.label', default: 'PlayList'), playList.id])
                redirect playList
            }
            '*' { respond playList, [status: CREATED] }
        }
    }

    def edit(PlayList playList) {
        respond playList
    }

    @Transactional
    def update(PlayList playList) {
        if (playList == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (playList.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond playList.errors, view:'edit'
            return
        }

        request.getMultiFileMap().files.each {
            def name = it.originalFilename
            playList.addToMedias(new Media(url: name))
            it.transferTo(new java.io.File(grailsApplication.config.server.uploadImage +'media/'+ name))
        }

        playList.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'playList.label', default: 'PlayList'), playList.id])
                redirect playList
            }
            '*'{ respond playList, [status: OK] }
        }
    }

    @Transactional
    def delete(PlayList playList) {

        if (playList == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        User user = User.findById(sec.loggedInUserInfo(field: 'id'))
        Set<Profile> profiles = user.getProfiles()
        profiles.each {
            Profile p = Profile.findById(it.getId())
            it.playlists.each {
                if(it == playList){
                    Set<PlayList> PLs = p.getPlaylists()
                    PLs.remove(PlayList.findById(playList.getId()))

                }
            }
        }

        playList.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'playList.label', default: 'PlayList'), playList.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'playList.label', default: 'PlayList'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
