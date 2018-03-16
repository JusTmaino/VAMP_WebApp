<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'playList.label', default: 'PlayList')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div id="edit-playList" class="content scaffold-edit" role="main">
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.playList}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.playList}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:uploadForm action="update" resource="${this.playList}" method="POST" class="form-horizontal" enctype="multipart/form-data">
                <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="col s12 z-depth-4 card-panel">

                            <div class="row">
                                <div class="input-field col s12 center">
                                    <h4 >Update PlayList</h4>
                                </div>
                            </div>
                <g:hiddenField name="version" value="${this.playList?.version}" />
                <fieldset class="form">
                    <f:all bean="playList" except="medias"/>
                <ul>
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
                </ul><br><br>
                    <div class="col-lg-offset-1" style="margin-top:5px;">
                        <div class="container" style=" width: 100%">
                            <input type="file" name="files"  multiple>
                        </div>
                    </div>
                    <br>
                </fieldset>
                            <br>
                    <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" style="margin-left: 45%;
                    background-color: #b9151b;
                    border: none;
                    color: white;
                    padding: 15px 32px;
                    border-radius: 8px;
                    margin-bottom: 10px;" />
                </div>
                </div>
                </div>
                </div>
            </g:uploadForm>
        </div>
    </body>
</html>
