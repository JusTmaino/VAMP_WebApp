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
                <div class="row" style="padding: 15px">
                    <h4>${car.brand} ${car.model}</h4>
                    <a href="/car/create" class="btn-floating activator waves-effect waves-light rec accent-2 right materialize-red" style="margin-top: -55px;">
                        <i class="material-icons">add</i>
                    </a>
                </div>
                <div class="col s12">
                    <div class="card horizontal">
                        <div class="carousel carousel-slider center" data-indicators="true" style="width: 700px;height: 400px;">

                            <g:each var="img" in="${car.getImages().findAll()}">
                                <div class="carousel-item red white-text" href="#one!">
                                    <img src="${grailsApplication.config.server.pathServer}/images/cars/${img.path}"
                                         alt="item-img">
                                    <h2>First Panel</h2>
                                    <p class="white-text">This is your first panel</p>
                                </div>
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

                                <a href="/car/edit/${car.id}" class="btn-floating activator waves-effect waves-light rec accent-2 right materialize-red">
                                    <i class="material-icons">edit</i>
                                </a>
                            </div>

                        </div>
                    </div>
                </div>
            <g:form resource="${this.car}" method="DELETE">

                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" style="margin-left: 45%;
                    background-color: #b9151b;
                    border: none;
                    color: white;
                    padding: 15px 32px;
                    border-radius: 8px;
                    margin-bottom: 10px;"/>

            </g:form>
            <script type='text/javascript'>
                $(document).ready(function(){
                    $('.carousel.carousel-slider').carousel({fullHeight: true});
                });
            </script>

        </div>
    </body>
</html>
