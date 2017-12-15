<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
    <title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
<div id="edit-user" class="content scaffold-edit" role="main">

    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${this.user}">
        <ul class="errors" role="alert">
            <g:eachError bean="${this.user}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form resource="${this.user}" method="PUT">
        <g:hiddenField name="version" value="${this.user?.version}" />

        <!--f:all bean="user"/-->

        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="col s12 z-depth-4 card-panel">
                        <button class="btn btn-primary btn-round" style="float: right; margin: 5px">
                            <a href="${createLink(uri: '/')}" style="color: white;float: right">
                                <i class="material-icons">home</i> Home
                            </a>
                        </button>
                        <button class="btn btn-primary btn-round" style="float: right; margin: 5px">
                            <g:link class="create" action="create"><g:message args="[entityName]"/><i class="material-icons"
                                                                                                      style="color: white">add</i></g:link>
                        </a>
                        </button>

                        <button class="btn btn-primary btn-round" style="float: right; margin: 5px">
                            <g:link class="list" action="index"><g:message args="[entityName]"/><i class="material-icons"
                                                                                                   style="color: white">list</i></g:link>
                        </a>
                        </button>

                        <div class="row">
                            <div class="input-field col s12 center">
                                <h4 style="margin-top: -50px">Update User</h4>
                            </div>
                        </div>


                        <div class="row margin">
                            <div class="input-field col s12">
                                <div class="form-group label-floating is-empty fieldcontain required">
                                    <label class="control-label">Name</label>
                                    <input class="form-control" type="text" name="fullName" id="fullName"
                                           value="${user.fullName}"
                                           required="true"
                                           aria-required="true">
                                    <span class="material-input"></span>
                                </div>
                            </div>
                        </div>

                        <div class="row margin">
                            <div class="input-field col s12">
                                <div class="form-group label-floating is-empty fieldcontain required">
                                    <label class="control-label">UserName</label>
                                    <input class="form-control" type="text" name="username" id="username"
                                           value="${user.username}"
                                           required="true"
                                           aria-required="true">
                                    <span class="material-input"></span>
                                </div>
                            </div>
                        </div>

                        <div class="row margin">
                            <div class="input-field col s12">
                                <div class="form-group label-floating is-empty fieldcontain required">
                                    <label class="control-label">Telephone</label>
                                    <input class="form-control" type="text" name="tel" id="tel"
                                           value="${user.tel}"
                                           required="true"
                                           aria-required="true">
                                    <span class="material-input"></span>
                                </div>
                            </div>
                        </div>

                        <div class="row margin">
                            <div class="input-field col s12">
                                <label class="control-label">Role</label>
                                <div class="form-group label-floating is-empty fieldcontain required">

                                    <select name="roleId" required
                                            id="roleId" class="selectpicker"
                                            data-style="btn btn-info btn-round" title="Choisir un rôle">
                                        <g:each var="role" in="${vamp_webapp.Role.all}">
                                            <g:if test="${vamp_webapp.UserRole.findByUser(user).getRole().id == role.id}">
                                                <option selected
                                                        value="${role.id}">${role.authority.substring(5).toLowerCase()}</option>
                                            </g:if>
                                            <g:else>
                                                <option value="${role.id}">${role.authority.substring(5).toLowerCase()}</option>
                                            </g:else>
                                        </g:each>
                                    </select>
                                <span class="material-input"></span>
                                </div>
                            </div>
                        </div>

                        <div class="row margin">
                            <div class="input-field col s12">
                                <div class="form-group label-floating is-empty fieldcontain required">
                                    <label class="control-label">Mail</label>
                                    <input class="form-control" type="text" name="mail" id="mail"
                                           value="${user.mail}"
                                           required="true"
                                           aria-required="true">
                                    <span class="material-input"></span>
                                </div>
                            </div>
                        </div>

                        <div class="row margin">
                            <div class="input-field col s12">
                                <div class="form-group label-floating is-empty fieldcontain required">
                                    <label class="control-label">Telephone</label>
                                    <input class="form-control" type="text" name="datenais" id="datenais"
                                           value="${user.datenais}"
                                           required="true"
                                           aria-required="true">
                                    <span class="material-input"></span>
                                </div>
                            </div>
                        </div>

                        <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" style="background-color: #4caf9c;
                        border: none;
                        color: white;
                        padding: 15px 32px;
                        border-radius: 8px;
                        margin-bottom: 10px;" />
                    </div>
                </div>
            </div>
        </div>




    </g:form>
</div>
</body>
</html>
