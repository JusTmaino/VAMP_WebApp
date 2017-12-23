<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'playList.label', default: 'PlayList')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <asset:javascript src="uploadr.manifest.js"/>
        <asset:javascript src="uploadr.demo.manifest.js"/>
        <asset:stylesheet href="uploadr.manifest.css"/>
        <asset:stylesheet href="uploadr.demo.manifest.css"/>
        <asset:stylesheet href="application.css"/>
    </head>
    <body>

        <div id="create-playList" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
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
            <g:uploadForm action="save" method="post" class="form-horizontal" enctype="multipart/form-data" resource="${this.playList}" >
                <fieldset class="form">

                    <f:all bean="playList" except="medias"/>
                    <br><br>
                    <div>
                        <label >Music to upload:</label>
                        <div class="container" style=" width: 100%">
                            <input type="file" name="files"  multiple>
                        </div>
                    </div>
                    <br><br>
                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:uploadForm>
        </div>
<g:javascript>
        $(document).ready(function () {
            $('input[type="file"]').imageuploadify();
        })
</g:javascript>
    </body>
</html>
