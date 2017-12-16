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
                <div class="col s12 m1 right-align">
                    <a class="btn-floating activator waves-effect waves-light rec accent-2 right">
                        <i class="material-icons">perm_identity</i>
                    </a>
                </div>
                <div class="col s12 m1 right-align">
                    <a href="/user/edit/${user.id}"  class="btn-floating activator waves-effect waves-light rec accent-2 right">
                        <i class="material-icons">edit</i>
                    </a>
                </div>
                <div class="col s12 m12 right-align">
                    <a class="btn-floating activator waves-effect waves-light rec accent-2 right">
                        <i class="material-icons">delete</i>
                    </a>
                </div>
            </div>
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
        <li class="collection-header gradient-45deg-light-blue-cyan">
            <h4 class="task-card-title">Aboute Me</h4>
            <p class="task-card-date">March 26, 2015</p>
        </li>
        <li class="collection-item avatar">
            <i class="material-icons circle teal accent-4">directions_car</i>
            <span class="title">Cars</span>
            <p>Car 1
                <br>
                Car2
            </p>
            <a href="#!" class="secondary-content">
                <i class="material-icons">car</i>
            </a>
        </li>
        <li class="collection-item avatar">
            <i class="material-icons circle cyan">assessment</i>
            <span class="title">Profiles</span>
            <p>Profile 1
                <br>
                Profile 2
            </p>
            <a href="#!" class="secondary-content">
                <i class="material-icons">attach_money</i>
            </a>
        </li>
        <li class="collection-item avatar">
            <i class="material-icons circle red accent-2">play_arrow</i>
            <span class="title">PlayListe</span>
            <p>company management news
                <br>
                <span class="ultra-small">Second Line</span>
            </p>
            <a href="#!" class="secondary-content">
                <i class="material-icons">track_changes</i>
            </a>
        </li>
    </ul>

    <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_MODERATOR">

            <g:form resource="${user}" method="DELETE">


                    <g:link class="edit" action="edit"
                            resource="${user}"><div
                            class="btn btn-success btn-fill">Modifier</div></g:link>
                    <input class="delete btn btn-danger btn-fill" type="submit"
                           value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                           onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>

            </g:form>

    </sec:ifAnyGranted>

    </body>
</html>
