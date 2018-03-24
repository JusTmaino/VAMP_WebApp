<%@ page import="vamp_webapp.User" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'car.label', default: 'Car')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>


            <div class="card-widgets">

                <div class="row">
                    <br>
                    <g:each var="car" in="${vamp_webapp.Car.getAll()}">
                        <div class="col s12 m12 l4 item">
                            <div class="card">
                                <div class="card-image waves-effect waves-block waves-light">
                                    <a href="/car/show/${car.id}">
                                        <div class="carousel carousel-slider center" data-indicators="true" style="width: 340px;height: 345px;">

                                            <g:each var="img" in="${car.getImages().findAll()}">
                                                <div class="carousel-item red white-text" href="#one!">
                                                    <img src="${grailsApplication.config.server.pathServer}/images/cars/${img.path}"
                                                         alt="item-img">


                                                </div>
                                            </g:each>
                                        </div>
                                    </a>
                                    <h4 class="card-title text-shadow m-0">${car.brand}</h4>
                                </div>
                                <small class="right">
                        <g:each var="usr" in="${vamp_webapp.User.findAll()}">
                            <g:if test="${usr.getCars() != null}">
                            <g:if test="${usr.getCars().contains(car)}">
                                <g:set var="x" value="${usr}"/>
                            </g:if>
                            </g:if>
                        </g:each>
                                    <img src="${grailsApplication.config.server.pathServer}/images/users/${x.image.path}" name="image" id="image" alt="" class="circle responsive-img activator card-profile-image black-overlay lighten-1 padding-2" style="
                                    height: 80px;
                                    margin-top: 0px;
                                    margin-bottom: -20px;
                                    margin-right: 5px;
                                    width: 80px;
                                    ">
                                </small>
                                <div class="card-content">
                                    <a href="#"></a>
                                    <p class="row mb-1">

                                        <small class="left">18th June, 2017</small>
                                        <br>
                                        <small class="left">${car.model}</small>
                                    </p>

                                </div>
                                <div class="card-reveal">
                                    <span class="card-title grey-text text-darken-4">
                                        <i class="material-icons right">close</i> ${car.brand} ${car.model}</span>
                                    <p>Registerd Number : ${car.matricule}.</p>
                                    <p>Seat Number : ${car.nb_place}.</p>
                                    <p>Charge : ${car.charge}.</p>
                                    <p>Outside Temperature : ${car.temperature_ext}.</p>
                                </div>
                            </div>
                        </div>





                    </g:each>
                </div>
            </div>
    <script type='text/javascript'>
        $(document).ready(function(){
            $('.carousel.carousel-slider').carousel({fullHeight: true});
        });
    </script>
    </body>
</html>