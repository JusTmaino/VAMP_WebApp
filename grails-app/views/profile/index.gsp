<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'profile.label', default: 'Profile')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>



            <ul id="task-card" class="collection with-header">
                <li class="collection-header"  style="background: #37474f;">
                    <h4 class="task-card-title">Profile List</h4>
                </li>
                <g:each var="profile" in="${vamp_webapp.Profile.findAll()}">

                        <a href="/profile/show/${profile.id}">
                            <li class="collection-item avatar">
                                <i class="material-icons circle red" style="margin-top: 10px">favorite_border</i>
                                <br>
                                <span class="title" style="color: red;">profile ${profile.id}</span>
                            </li>

                        </a>

                </g:each>

            </ul>
    </body>
</html>