<%@ page import="vamp_webapp.UserRole" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<div class="card-widgets">
    <div class="row">
        <g:each var="user" in="${vamp_webapp.User.getAll()}">
            <div class="col s12 m4 l4">
                <div id="profile-card" class="card">
                    <div class="card-image waves-effect waves-block waves-light">
                        <asset:image src="téléchargement.jpg" class="activator"  alt="user bg"/>
                    </div>

                    <div class="card-content">
                        <g:if test="${user.image != null}">
                            <img src="${grailsApplication.config.server.pathServer}/images/users/${user.image.path}" id="img"  class="circle responsive-img activator card-profile-image black-overlay lighten-1 padding-2" />
                        </g:if>
                        <g:else>
                            <asset:image src="avatar-7.png" name="image" id="image" alt="" class="circle responsive-img activator card-profile-image black-overlay lighten-1 padding-2"/>
                        </g:else>

                        <a href="show/${user.id}" class="btn-floating btn-move-up waves-effect waves-light deep-orange accent-2 z-depth-4 right">
                            <i class="material-icons">chevron_right</i>
                        </a>
                        <a href="#" class="btn-floating  btn-move-up waves-effect waves-light red accent-2 z-depth-4 right" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
                            <i class="material-icons">delete</i>
                        </a>
                        <a href="edit/${user.id}" class="btn-floating  btn-move-up waves-effect waves-light teal accent-4 z-depth-4 right">
                            <i class="material-icons">edit</i>
                        </a>
                        <span class="card-title activator grey-text text-darken-4"> ${user.fullName}</span>

                        <p>
                            <i class="material-icons">perm_identity</i> ${vamp_webapp.UserRole.findByUser(user).getRole().authority}</p>

                        <p>
                            <i class="material-icons">perm_phone_msg</i> +33 ${user.tel}</p>

                        <p>
                            <i class="material-icons">email</i>  ${user.mail}</p>
                    </div>

                    <div class="card-reveal">
                        <span class="card-title grey-text text-darken-4">${user.fullName}
                            <i class="material-icons right">close</i>
                        </span>

                        <p>
                            <i class="material-icons">perm_identity</i> ${vamp_webapp.UserRole.findByUser(user).getRole().authority}</p>

                        <p>
                            <i class="material-icons">perm_phone_msg</i> +33 ${user.tel}</p>

                        <p>
                            <i class="material-icons">email</i>  ${user.mail}</p>

                        <p>
                            <i class="material-icons">cake</i>   ${user.datenais}</p>

                        <p>
                            <i class="material-icons">person_add</i> ${user.datenais}</p>

                        <div class="row">
                            <a class="waves-effect waves-light modal-trigger btn cyan" href="#modal1"><i class="material-icons left">directions_car</i>voitures</a>
                            <a class="waves-effect waves-light modal-trigger btn deep-orange" href="#modal2"><i class="material-icons left">queue_music</i>playlist</a>
                        </div>

                    </div>
                </div>
            </div>



            <!--MODAL-->
            <div id="modal1" class="modal bottom-sheet">
                <div class="modal-content">
                    <h4><i class="material-icons md-36">directions_car</i> Voitures</h4>
                    <p>A bunch of text</p>
                    <ul class="collection">
                        <g:each var="car" in="${user.cars}">
                            <li class="collection-item avatar">
                                <img src="img here" alt="" class="circle">
                                <span class="title">${car.brand}</span>
                                <p>${car.model}
                                    <br> ${car.matricule}
                                </p>
                                <a href="#!" class="secondary-content">
                                    Put something here
                                </a>
                            </li>
                        </g:each>
                    </ul>
                </div>
                <div class="modal-footer">
                    <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Agree</a>
                </div>
            </div>

            <div id="modal2" class="modal bottom-sheet">
                <div class="modal-content">
                    <h4><i class="material-icons md-36">queue_music</i> Playlist</h4>
                    <p>A bunch of text</p>
                    <ul class="collection">
                        <g:each var="car" in="${user.cars}">
                            <li class="collection-item avatar">
                                <img src="img here" alt="" class="circle">
                                <span class="title">${car.brand}</span>
                                <p>${car.model}
                                    <br> ${car.matricule}
                                </p>
                                <a href="#!" class="secondary-content">
                                    Put something here
                                </a>
                            </li>
                        </g:each>
                    </ul>
                </div>
                <div class="modal-footer">
                    <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Agree</a>
                </div>
            </div>


        </g:each>
    </div>
</div>
<div class="fixed-action-btn " style="bottom: 50px; right: 19px;">
    <a href="create" class="waves-effect waves-light btn-floating btn-large materialize-red">
        <i class="material-icons">add</i>
    </a>
</div>

<g:javascript>
    $(document).ready(function(){
        // the "href" attribute of the modal trigger must specify the modal ID that wants to be triggered
        $('#modal1').modal();
        $('#modal2').modal();
    });
</g:javascript>
</body>
</html>