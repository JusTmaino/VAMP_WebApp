<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'profile.label', default: 'Profile')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-profile" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="show-profile" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:display bean="profile" />
            <ul id="task-card" class="collection with-header">
                <li class="collection-header gradient-45deg-light-blue-cyan">
                    <h4 class="task-card-title">PlayList</h4>
                </li>
                <g:each var="profile" in="${vamp_webapp.User.findById(sec.loggedInUserInfo(field: 'id')).getProfile()}">
                    <g:each var="play" in="${profile.getPlaylists().findAll()}">
                        <a href="/playList/show/${play.id}">
                            <li class="collection-item avatar">
                                <i class="material-icons circle cyan" style="margin-top: 10px">assessment</i>
                                <br>
                                <span class="title">${play.name}</span>
                            </li>
                            <li class="divider"></li>
                        </a>
                    </g:each>
                </g:each>
            <g:form resource="${this.profile}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.profile}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
