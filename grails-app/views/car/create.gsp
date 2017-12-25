<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'car.label', default: 'Car')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>

        <div id="create-car" class="content scaffold-create" role="main">
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.car}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.car}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
                <g:uploadForm action="save" resource="${this.car}" class="form-horizontal" enctype="multipart/form-data">
                    <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="col s12 z-depth-4 card-panel">

                                <div class="row">
                                    <div class="input-field col s12 center">
                                        <h4 >Create Car</h4>
                                    </div>
                                </div>

                    <g:hiddenField name="version" value="${this.car?.version}" />
                    <fieldset class="form">

                        <div class="col-lg-offset-1" style="margin-top:5px;">
                            <label>Car image</label>
                            <div class="container" style=" width: 100%">
                                <input type="file" name="files"  multiple>
                            </div>
                        </div>
                    <f:all bean="car" except="images"/>
                </fieldset>

                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" style="background-color: #4caf9c;
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
