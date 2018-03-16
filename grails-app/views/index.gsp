<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Welcome to Grails</title>

    <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
</head>
<body>
    <content tag="nav">
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Application Status <span class="caret"></span></a>
            <ul class="dropdown-menu">
                <li><a href="#">Environment: ${grails.util.Environment.current.name}</a></li>
                <li><a href="#">App profile: ${grailsApplication.config.grails?.profile}</a></li>
                <li><a href="#">App version:
                    <g:meta name="info.app.version"/></a>
                </li>
                <li role="separator" class="divider"></li>
                <li><a href="#">Grails version:
                    <g:meta name="info.app.grailsVersion"/></a>
                </li>
                <li><a href="#">Groovy version: ${GroovySystem.getVersion()}</a></li>
                <li><a href="#">JVM version: ${System.getProperty('java.version')}</a></li>
                <li role="separator" class="divider"></li>
                <li><a href="#">Reloading active: ${grails.util.Environment.reloadingAgentEnabled}</a></li>
            </ul>
        </li>
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Artefacts <span class="caret"></span></a>
            <ul class="dropdown-menu">
                <li><a href="#">Controllers: ${grailsApplication.controllerClasses.size()}</a></li>
                <li><a href="#">Domains: ${grailsApplication.domainClasses.size()}</a></li>
                <li><a href="#">Services: ${grailsApplication.serviceClasses.size()}</a></li>
                <li><a href="#">Tag Libraries: ${grailsApplication.tagLibClasses.size()}</a></li>
            </ul>
        </li>
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Installed Plugins <span class="caret"></span></a>
            <ul class="dropdown-menu">
                <g:each var="plugin" in="${applicationContext.getBean('pluginManager').allPlugins}">
                    <li><a href="#">${plugin.name} - ${plugin.version}</a></li>
                </g:each>
            </ul>
        </li>
    </content>
<br>
<div class="row">
    <g:if test="${vamp_webapp.User.findById(sec.loggedInUserInfo(field: 'id')).getCars() != null }">
        <g:each var="car" in="${vamp_webapp.User.findById(sec.loggedInUserInfo(field: 'id')).getCars()}">
            <div class="col s12 m12 l4 item">
                <div class="card">
                    <div class="card-image waves-effect waves-block waves-light">
                        <a href="/car/show/${car.id}">
                            <div class="carousel carousel-slider center" data-indicators="true" style="width: 340px;height: 345px;">

                                <g:each var="img" in="${car.getImages().findAll()}">
                                    <div class="carousel-item red white-text" href="#one!">
                                        <img src="${grailsApplication.config.server.pathServer}/images/cars/${img.path}"
                                             alt="item-img">
                                        <h2>First Panel</h2>
                                        <p class="white-text">This is your first panel</p>
                                    </div>
                                </g:each>
                            </div>
                        </a>
                        <h4 class="card-title text-shadow m-0">${car.brand}</h4>
                    </div>
                    <ul class="card-action-buttons">
                        <li>
                            <a class="btn-floating waves-effect waves-light red accent-2">
                                <i class="material-icons activator">info_outline</i>
                            </a>
                        </li>
                    </ul>
                    <div class="card-content">
                        <a href="#"></a>
                        <p class="row mb-1">
                            <small class="right">
                                <a href="#!">

                                    <span class="new badge cyan m-0" data-badge-caption="Register date"></span>
                                </a>
                            </small>
                            <small class="left">18th June, 2017</small>
                        </p>
                        <p class="item-post-content">${car.model}</p>
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
    </g:if>
</div>

<ul id="task-card" class="collection with-header">
    <li class="collection-header" style="background: #37474f;">
        <h4 class="task-card-title">PlayList</h4>
    </li>
    <a href="/playList/create" class="btn-floating activator waves-effect waves-light rec accent-2 right materialize-red" style="margin-top: -55px;">
        <i class="material-icons">add</i>
    </a>
    <a href="/playList/create" class="secondary-content">
        <i class="material-icons" style="
        color: #e51c23;
        ">add_box</i>
    </a>
<g:each var="profile" in="${vamp_webapp.User.findById(sec.loggedInUserInfo(field: 'id')).getProfile()}">
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
    <!--li class="collection-item avatar">
        <i class="material-icons circle cyan">assessment</i>
        <audio id="audio" preload="" tabindex="0" controls type="audio/mp3" autoplay>
            <source src="http://www.w3schools.com/html/horse.mp3" type="audio/mp3">
        </audio>
        <a href="#!" class="secondary-content">
            <i class="material-icons">track_changes</i>
        </a>
    </li>
</ul>

    <div id="content" role="main">
        <section class="row colset-2-its">

            <div id="controllers" role="navigation">
                <h2>Available Controllers:</h2>
                <ul>

                </ul>
            </div>
        </section>
    </div-->
    <script type='text/javascript'>
        $(document).ready(function(){
            $('.carousel.carousel-slider').carousel({fullHeight: true});
        });
    </script>
</body>
</html>
