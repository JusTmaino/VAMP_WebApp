<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'car.label', default: 'Car')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div id="show-car" class="content scaffold-show" role="main">
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
                <div class="col s12">
                    <div class="card horizontal">
                        <div class="card-image width-65">
                            <g:each var="img" in="${car.getImages().findAll()}">
                                <img src="${grailsApplication.config.server.pathServer}/images/cars/${img.path}"
                                     alt="item-img">
                            </g:each>
                        </div>
                        <div class="card-stacked">
                            <div class="card-content">
                                <p><h5>Brand : ${car.brand}</h5></p>
                                <p><h5>Model : ${car.model}</h5></p>
                                <p><h5>Matricule : ${car.matricule}</h5></p>
                                <p><h5>Nombre de place : ${car.nb_place}</h5></p>
                                <p><h5>Charge : ${car.charge}</h5></p>
                                <p><h5>Temperature Externe : ${car.temperature_ext}</h5></p>
                                <p><h5>Locked : ${car.locked}</h5></p>

                                <a href="/car/edit/${car.id}" class="btn-floating activator waves-effect waves-light rec accent-2 right red">
                                    <i class="material-icons">edit</i>
                                </a>
                            </div>

                        </div>
                    </div>
                </div>
            <g:form resource="${this.car}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.car}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
