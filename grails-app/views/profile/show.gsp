<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'profile.label', default: 'Profile')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>

        <div id="show-profile" class="content scaffold-show" role="main">

            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>

            <ul id="task-card" class="collection with-header">
                <li class="collection-header"  style="background: #37474f;">
                    <h4 class="task-card-title">PlayList</h4>
                </li>
                <g:each var="profile" in="${vamp_webapp.User.findById(sec.loggedInUserInfo(field: 'id')).getProfiles()}">
                    <g:each var="play" in="${profile.getPlaylists().findAll()}">
                        <a href="/playList/show/${play.id}">
                            <li class="collection-item avatar">
                                <i class="material-icons circle red" style="margin-top: 10px">assessment</i>
                                <br>
                                <span class="title" style="color: red;">${play.name}</span>
                            </li>
                            <li class="divider"></li>
                        </a>
                    </g:each>
                </g:each>
                <br>
            <g:form resource="${this.profile}" method="DELETE">

                    <g:link class="edit" action="edit" resource="${this.profile}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />

            </g:form>
        </div>
    </body>
</html>
