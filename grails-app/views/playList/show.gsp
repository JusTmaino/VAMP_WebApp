<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'playList.label', default: 'PlayList')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>

        <div id="show-playList" class="content scaffold-show" role="main">

            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <div class="col s12 m12 l6">
                <ul id="issues-collection" class="collection z-depth-1">
                    <li class="collection-item avatar">
                        <div class="col s12 m1 right-align">
                            <a href="/playList/edit/${playList.id}" class="btn-floating activator waves-effect waves-light rec accent-2 right">
                                <i class="material-icons">edit</i>
                            </a>
                        </div>
                        <i class="material-icons red accent-2 circle">bug_report</i>
                        <h4 class="collection-header m-0">${playList.name}</h4>
                    </li>
<g:each var="media" in="${playList.getMedias().findAll()}">
                    <li class="collection-item">
                        <div class="row">
                            <div class="col s7">
                                <p class="collections-title">
                                    <strong>${media.url}</strong></p>
                            </div>

                            <div class="col s2">
                                <audio id="audio" preload="" tabindex="0" controls type="audio/mp3">
                                    <source src="${grailsApplication.config.server.pathServer}/images/media/${media.url}" type="audio/mp3">
                                </audio>
                            </div>
                        </div>
                    </li>
</g:each>
                </ul>
            </div>
            <g:form resource="${this.playList}" method="DELETE">

                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"  style="margin-left: 45%;
                background-color: #b9151b;
                border: none;
                color: white;
                padding: 15px 32px;
                border-radius: 8px;
                margin-bottom: 10px;"/>

            </g:form>
        </div>
    </body>
</html>
