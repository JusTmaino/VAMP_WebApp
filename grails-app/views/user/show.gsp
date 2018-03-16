<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>


    <div id="profile-page-header" class="card">
        <div class="card-image waves-effect waves-block waves-light">
            <asset:image src="abc.jpg" class="activator" alt="user background"/>
        </div>
        <figure class="card-profile-image">
            <g:if test="${user.image != null}">
                <img src="${grailsApplication.config.server.pathServer}/images/users/${user.image.path}" alt="profile image" class="circle z-depth-2 responsive-img activator gradient-45deg-light-blue-cyan gradient-shadow">
            </g:if>
            <g:else>
                <asset:image src="placeholder.jpg"/>
            </g:else>
        </figure>
        <div class="card-content">
            <div class="row pt-2">
                <div class="col s12 m3 offset-m2">
                    <h4 class="card-title grey-text text-darken-4">${user.fullName}</h4>
                    <p class="medium-small grey-text">Full Name</p>
                </div>
                <div class="col s12 m2 center-align">
                    <h4 class="card-title grey-text text-darken-4">${vamp_webapp.UserRole.findByUser(user).role.authority}</h4>
                    <p class="medium-small grey-text">Role</p>
                </div>
                <div class="col s12 m2 center-align">
                    <h4 class="card-title grey-text text-darken-4">${user.tel}</h4>
                    <p class="medium-small grey-text">Telephone</p>
                </div>
                <div class="col s12 m2 center-align">
                    <h4 class="card-title grey-text text-darken-4">${user.mail}</h4>
                    <p class="medium-small grey-text">Mail</p>
                </div>
            </div>
            <br>
            <div >
                <a class="btn-floating activator waves-effect waves-light materialize-red accent-2 right" style="margin-left: 10px">
                    <i class="material-icons">perm_identity</i>
                </a>
            </div>
            <div >
                <a href="/user/edit/${user.id}"  class="btn-floating activator waves-effect waves-light materialize-red accent-2 right" style="margin-left: 10px">
                    <i class="material-icons">edit</i>
                </a>
            </div>
            <div >
                <a class="btn-floating activator waves-effect waves-light materialize-red accent-2 right">
                    <i class="material-icons">delete</i>
                </a>
            </div>
            <br>
        </div>
        <div class="card-reveal">
            <p>
                <span class="card-title grey-text text-darken-4">${user.fullName}
                    <i class="material-icons right">close</i>
                </span>
                <span>
                    <i class="material-icons cyan-text text-darken-2">account_box</i> ${vamp_webapp.UserRole.findByUser(user).role.authority}</span>
            </p>

            <p>
                <i class="material-icons cyan-text text-darken-2">perm_identity</i>${user.username}</p>
            <p>
                <i class="material-icons cyan-text text-darken-2">lock_outline</i>${user.password}</p>
            <p>
                <i class="material-icons cyan-text text-darken-2">perm_phone_msg</i>${user.tel}</p>
            <p>
                <i class="material-icons cyan-text text-darken-2">email</i>${user.mail}</p>
            <p>
                <i class="material-icons cyan-text text-darken-2">cake</i>${user.datenais}</p>



        </div>
    </div>

    <ul id="task-card" class="collection with-header">
        <li class="collection-header" style="background: #37474f">
            <h4 class="task-card-title">About Me</h4>
            <p class="task-card-date">March 26, 2015</p>
        </li>
        <li class="collection-item avatar">
            <i class="material-icons circle teal accent-4">directions_car</i>
            <span class="title">Cars</span>
            <p>
                <g:each var="car" in="${vamp_webapp.User.findById(sec.loggedInUserInfo(field: 'id')).getCars()}">
                    <a href="/car/show/${car.id}">
                    ${car.brand} ${car.model}
                    </a>
                    <br>
                </g:each>
            </p>

            <a href="/car/create" class="secondary-content">
                <i class="material-icons" style="
                color: #e51c23;
                ">add_box</i>
            </a>

        </li>
        <!--li class="collection-item avatar">
            <i class="material-icons circle cyan">assessment</i>
            <span class="title"> Profiles</span>
            <p>
                <--g:each var="p" in="${vamp_webapp.User.findById(sec.loggedInUserInfo(field: 'id')).getProfile()}">
                    profile
                    <br>
                </--g:each>
            </p>
        </li-->
        <li class="collection-item avatar">
            <i class="material-icons circle red accent-2">play_arrow</i>
            <span class="title">PlayLists</span>
            <p>
                <g:each var="p" in="${vamp_webapp.User.findById(sec.loggedInUserInfo(field: 'id')).getProfile()}">
                    <g:each var="play" in="${p.getPlaylists().findAll()}">
                        <a href="/playList/show/${play.id}">
                        ${play.name}
                        </a>
                        <br>
                    </g:each>
                </g:each>
            </p>
        <a href="/playList/create" class="secondary-content">
            <i class="material-icons" style="
            color: #e51c23;
            ">add_box</i>
        </a>
        </li>
    </ul>

    <sec:ifAnyGranted roles="ROLE_ADMIN">

            <g:form resource="${user}" method="DELETE">


                    <g:link class="edit" action="edit"
                            resource="${user}"><div
                            class="btn btn-success btn-fill black-overlay">Modifier</div></g:link>
                    <input class="delete btn materialize-red btn-fill" type="submit"
                           value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                           onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>

            </g:form>
<br>
    </sec:ifAnyGranted>

    </body>
</html>
