<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'car.label', default: 'Car')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>

        <div id="edit-car" class="content scaffold-edit" role="main">
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
            <g:uploadForm action="save" resource="${this.car}" method="PUT" class="form-horizontal" enctype="multipart/form-data">
                <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="col s12 z-depth-4 card-panel">

                            <div class="row">
                                <div class="input-field col s12 center">
                                    <h4 >Update Your Car</h4>
                                </div>
                            </div>

                <g:hiddenField name="version" value="${this.car?.version}" />
                <fieldset class="form">
                            <div class="carousel" style="margin-top: -30px;margin-bottom: -10px">
                                <g:each var="img" in="${car.getImages().findAll()}">
                                    <a class="carousel-item" href="#five!"><img src="${grailsApplication.config.server.pathServer}/images/cars/${img.path}" alt="item-img"></a>
                                </g:each>
                            </div>
                            <div class="col-lg-offset-1" style="margin-top:5px;">
                                <div class="container" style=" width: 100%">
                                    <input type="file" name="files"  multiple>
                                </div>
                            </div>

                    <f:all bean="car" except="images" />
                </fieldset>
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
                <script type='text/javascript'>
                    $(document).ready(function(){
                        $('.carousel').carousel();
                    });
                </script>
            </g:uploadForm>
        </div>
    </body>
</html>
