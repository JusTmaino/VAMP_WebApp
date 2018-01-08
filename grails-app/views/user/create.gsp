<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>

        <div id="create-user" class="content scaffold-create" role="main">
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
            <g:uploadForm action="save" resource="${this.user}" method="POST" class="form-horizontal" enctype="multipart/form-data">
                <g:hiddenField name="version" value="${this.user?.version}" />


                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="col s12 z-depth-4 card-panel">

                                <div class="row">
                                    <div class="input-field col s12 center">
                                        <h4 >Create User</h4>
                                    </div>
                                </div>

                                <div class="col s2">
                                        <asset:image src="avatar-7.png" name="image" id="image" alt="" class="circle responsive-img valign profile-image cyan"/>
                                </div>

                                <div class="col-lg-offset-1" style="margin-top:5px;">
                                    <input type="file" name="file" id="upload" size="10" onchange="readURL(this.value)" style="background-color: #4caf9c;
                                    border: none;
                                    color: white;
                                    padding: 15px 32px;
                                    border-radius: 8px;
                                    margin-bottom: 10px;" />

                                </div>


                                <div class="row margin">
                                    <div class="input-field col s12">
                                        <div class="form-group label-floating is-empty fieldcontain required">
                                            <label class="control-label">Name</label>
                                            <input class="form-control" type="text" name="fullName" id="fullName"
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
                                                   required="true"
                                                   aria-required="true">
                                            <span class="material-input"></span>
                                        </div>
                                    </div>
                                </div>

                                <div class="row margin">
                                    <div class="input-field col s12">
                                        <div class="form-group label-floating is-empty fieldcontain required">
                                            <label class="control-label">Password</label>
                                            <input class="form-control" type="text" name="password" id="password"
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
                                            <input class="form-control" type="number" name="tel" id="tel"
                                                   required="true"
                                                   aria-required="true">
                                            <span class="material-input"></span>
                                        </div>
                                    </div>
                                </div>

                                <div class="row margin">
                                    <div class="input-field col s12">
                                        <div class="form-group label-floating is-empty fieldcontain required">
                                            <label class="control-label">Role</label>
                                            <p></p>
                                            <g:select name="roleID" class="form-control" required="" id="role" optionKey="id" optionValue="authority" from="${vamp_webapp.Role.all}"  ></g:select>
                                            <span class="material-input"></span>
                                        </div>
                                    </div>
                                </div>

                                <div class="row margin">
                                    <div class="input-field col s12">
                                        <div class="form-group label-floating is-empty fieldcontain required">
                                            <label class="control-label">Mail</label>
                                            <input class="form-control" type="text" name="mail" id="mail"
                                                   required="true"
                                                   aria-required="true">
                                            <span class="material-input"></span>
                                        </div>
                                    </div>
                                </div>

                                <div class="row margin">
                                    <div class="input-field col s12">
                                        <div class="form-group label-floating is-empty fieldcontain required">
                                            <label class="control-label">Date de Naissance</label>
                                            <input class="form-control" type="text" name="datenais" id="datenais"
                                                   required="true"
                                                   aria-required="true">
                                            <span class="material-input"></span>
                                        </div>
                                    </div>
                                </div>

                                <input class="save" type="submit" value="Create" style="background-color: #4caf9c;
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
                    // Example of a document-ready block
                    $(function(){
                        $('#upload').change(function(){
                            var input = this;
                            var url = $(this).val();
                            var ext = url.substring(url.lastIndexOf('.') + 1).toLowerCase();
                            if (input.files && input.files[0]&& (ext == "gif" || ext == "png" || ext == "jpeg" || ext == "jpg"))
                            {
                                var reader = new FileReader();

                                reader.onload = function (e) {
                                    $('#img').attr('src', e.target.result);
                                }
                                reader.readAsDataURL(input.files[0]);
                            }
                            else
                            {
                                $('#img').attr('src', '/assets/no_preview.png');
                            }
                        });

                    });
                </script>

            </g:uploadForm>
        </div>
    </body>
</html>
