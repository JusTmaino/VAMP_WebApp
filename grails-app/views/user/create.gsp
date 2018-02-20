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
                                            <input class="form-control" type="email" name="mail" id="mail"
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
                                            <!--input class="form-control" type="text" name="datenais" id="datenais"
                                                   required="true"
                                                   aria-required="true"-->
                                            <input  id="datenais" type="hidden" name="datenais" value="date.struct" />
                                            <select name="datenais_day" id="datenais_day" aria-labelledby="datenais">
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                                <option value="7">7</option>
                                                <option value="8">8</option>
                                                <option value="9">9</option>
                                                <option value="10">10</option>
                                                <option value="11">11</option>
                                                <option value="12">12</option>
                                                <option value="13">13</option>
                                                <option value="14">14</option>
                                                <option value="15">15</option>
                                                <option value="16">16</option>
                                                <option value="17">17</option>
                                                <option value="18">18</option>
                                                <option value="19">19</option>
                                                <option value="20">20</option>
                                                <option value="21">21</option>
                                                <option value="22">22</option>
                                                <option value="23">23</option>
                                                <option value="24">24</option>
                                                <option value="25">25</option>
                                                <option value="26">26</option>
                                                <option value="27">27</option>
                                                <option value="28">28</option>
                                                <option value="29">29</option>
                                                <option value="30" selected="selected">30</option>
                                                <option value="31">31</option>
                                            </select>
                                            <select name="datenais_month" id="datenais_month" aria-labelledby="datenais">
                                                <option value="1">janvier</option>
                                                <option value="2">février</option>
                                                <option value="3">mars</option>
                                                <option value="4">avril</option>
                                                <option value="5">mai</option>
                                                <option value="6">juin</option>
                                                <option value="7">juillet</option>
                                                <option value="8">août</option>
                                                <option value="9">septembre</option>
                                                <option value="10">octobre</option>
                                                <option value="11" selected="selected">novembre</option>
                                                <option value="12">décembre</option>
                                            </select>
                                            <select name="datenais_year" id="datenais_year" aria-labelledby="datenais">
                                                <option value="2017" selected="selected">2017</option>
                                                <option value="2016">2016</option>
                                                <option value="2015">2015</option>
                                                <option value="2014">2014</option>
                                                <option value="2013">2013</option>
                                                <option value="2012">2012</option>
                                                <option value="2011">2011</option>
                                                <option value="2010">2010</option>
                                                <option value="2009">2009</option>
                                                <option value="2008">2008</option>
                                                <option value="2007">2007</option>
                                                <option value="2006">2006</option>
                                                <option value="2005">2005</option>
                                                <option value="2004">2004</option>
                                                <option value="2003">2003</option>
                                                <option value="2002">2002</option>
                                                <option value="2001">2001</option>
                                                <option value="2000">2000</option>
                                                <option value="1999">1999</option>
                                                <option value="1998">1998</option>
                                                <option value="1997">1997</option>
                                                <option value="1996">1996</option>
                                                <option value="1995">1995</option>
                                                <option value="1994">1994</option>
                                                <option value="1993">1993</option>
                                                <option value="1992">1992</option>
                                                <option value="1991">1991</option>
                                                <option value="1990">1990</option>
                                                <option value="1989">1989</option>
                                                <option value="1988">1988</option>
                                                <option value="1987">1987</option>
                                                <option value="1986">1986</option>
                                                <option value="1985">1985</option>
                                                <option value="1984">1984</option>
                                                <option value="1983">1983</option>
                                                <option value="1982">1982</option>
                                                <option value="1981">1981</option>
                                                <option value="1980">1980</option>
                                                <option value="1979">1979</option>
                                                <option value="1978">1978</option>
                                                <option value="1977">1977</option>
                                                <option value="1976">1976</option>
                                                <option value="1975">1975</option>
                                                <option value="1974">1974</option>
                                                <option value="1973">1973</option>
                                                <option value="1972">1972</option>
                                                <option value="1971">1971</option>
                                                <option value="1970">1970</option>
                                                <option value="1969">1969</option>
                                                <option value="1968">1968</option>
                                                <option value="1967">1967</option>
                                                <option value="1966">1966</option>
                                                <option value="1965">1965</option>
                                                <option value="1964">1964</option>
                                                <option value="1963">1963</option>
                                                <option value="1962">1962</option>
                                                <option value="1961">1961</option>
                                                <option value="1960">1960</option>
                                                <option value="1959">1959</option>
                                                <option value="1958">1958</option>
                                                <option value="1957">1957</option>
                                                <option value="1956">1956</option>
                                                <option value="1955">1955</option>
                                                <option value="1954">1954</option>
                                                <option value="1953">1953</option>
                                                <option value="1952">1952</option>
                                                <option value="1951">1951</option>
                                                <option value="1950">1950</option>
                                            </select>
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
