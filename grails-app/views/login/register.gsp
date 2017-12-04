<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="msapplication-tap-highlight" content="no">
    <title>Register | VAMP </title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!-- Favicons-->
    <link rel="icon" href="../../images/favicon/favicon-32x32.png" sizes="32x32">
    <!-- Favicons-->
    <link rel="apple-touch-icon-precomposed" href="../../images/favicon/apple-touch-icon-152x152.png">
    <!-- For iPhone -->
    <meta name="msapplication-TileColor" content="#00bcd4">
    <meta name="msapplication-TileImage" content="images/favicon/mstile-144x144.png">
    <!-- For Windows Phone -->
    <!-- CORE CSS-->
    <asset:stylesheet src="materialize.css"/>
    <asset:stylesheet src="style.css"/>
    <!-- Custome CSS-->
    <asset:stylesheet src="custom.css"/>
    <!-- INCLUDED PLUGIN CSS ON THIS PAGE -->
    <asset:stylesheet src="page-center.css"/>
    <!-- INCLUDED PLUGIN CSS ON THIS PAGE -->
    <asset:stylesheet src="perfect-scrollbar.css"/>
</head>
<body class="cyan">
<!-- Start Page Loading -->
<div id="loader-wrapper">
    <div id="loader"></div>
    <div class="loader-section section-left"></div>
    <div class="loader-section section-right"></div>
</div>
<!-- End Page Loading -->
<div id="login-page" class="row">
    <div class="col s12 z-depth-4 card-panel">

        <div class="row">
            <div class="input-field col s12 center">
                <h4>Register</h4>
                <p class="center">Join the VAMP community now !</p>
            </div>
        </div>

        <g:if test='${params.error}'>
            <div class="login_message" style="color: red;">${params.error}</div>
        </g:if>


        <form id="registerForm" action="/user/register" method="post" >

            <fieldset>

                <div class="row margin">
                    <div class="input-field col s12">
                        <i class="material-icons prefix pt-5">person_outline</i>
                        <input type="text" name="username" required="" id="username" />
                        <label for="username" class="center-align">Username</label>
                    </div>
                </div>

                <div class="row margin">
                    <div class="input-field col s12">
                        <i class="material-icons prefix pt-5">email</i>
                        <input type="email" name="mail" required="" id="mail" />
                        <label for="mail" class="center-align">Email</label>
                    </div>
                </div>

                <div class="row margin">
                    <div class="input-field col s12">
                        <i class="material-icons prefix pt-5">lock_outline</i>
                        <input type="password" name="password" required="" id="password" />
                        <label for="password">Password</label>
                    </div>
                </div>

                <div class="row margin">
                    <div class="input-field col s12">
                        <i class="material-icons prefix pt-5">lock_outline</i>
                        <input type="password" class="form-control" name="confirmpassword" required="" id="confirmpassword" />
                        <label for="confirmpassword">Password again</label>
                    </div>
                </div>

                <div class="row margin">
                    <div class="input-field col s12">
                        <i class="material-icons prefix pt-5">person_outline</i>
                        <input type="text" name="fullName" required="" id="fullName" />
                        <label for="fullName" class="center-align">Full Name</label>
                    </div>
                </div>

                <div class="row margin">
                    <div class="input-field col s12">
                        <i class="material-icons prefix pt-5">child_friendly</i>
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
                        <label for="datenais" class="center-align">Date Of Birth</label>
                    </div>
                </div>

                <div class="row margin">
                    <div class="input-field col s12">
                        <i class="material-icons prefix pt-5">phone</i>
                        <input type="number"  name="tel" value="" required="" id="tel" />
                        <label for="tel" class="center-align">Phone</label>
                    </div>
                </div>

                <div class="row margin">
                    <div class="input-field col s12">
                        <i class="material-icons prefix pt-5">directions_car</i>
                        <select name="cars" id="cars" multiple="" ></select>
                        <label for="cars" class="center-align">Car</label>
                    </div>
                    <g:link action="create" controller="car">Add a Car</g:link>
                </div>

                <div class='row margin'>
                    <input type="hidden" class="form-control" name="_passwordExpired" /><input type="hidden" value="false" name="passwordExpired" id="passwordExpired"  />
                </div>

                <div class='row margin'>
                    <input type="hidden" class="form-control" name="_accountLocked" /><input type="hidden" value="false" name="accountLocked" id="accountLocked"  />
                </div>

                <div class='row margin'>
                    <input type="hidden" class="form-control" name="_accountExpired" /><input type="hidden" value="false" name="accountExpired" id="accountExpired"  />
                </div>

                <div class='row margin'>
                    <input type="hidden" class="form-control" name="_enabled" /><input type="hidden" value="true" name="enabled" checked="checked" id="enabled"  />
                </div>

            </fieldset>

            <div class="row">
                <div class="input-field col s12">
                    <input type="submit" id="create" name="create" class="btn waves-effect waves-light col s12" value="Register Now" onclick="return Validate()" />
                </div>

                <div class="input-field col s12">
                    <p class="margin center medium-small sign-up">Already have an account?
                    <g:link action="index" controller="login">Login</g:link></p>
                </div>
            </div>

        </form>

    </div>
</div>
<!-- ================================================
    Scripts
    ================================================ -->
<script>
    function Validate() {
        var password = document.getElementById("password").value;
        var confirmPassword = document.getElementById("confirmpassword").value;
        if (password != confirmPassword) {
            alert("Passwords do not match.");
            return false;
        }
        return true;
    }
</script>
<!-- jQuery Library -->
<asset:javascript src="jquery-3.2.1.min.js"/>
<!--materialize js-->
<asset:javascript src="materialize.min.js"/>
<!--prism-->
<asset:javascript src="prism.js"/>
<!--scrollbar-->
<asset:javascript src="perfect-scrollbar.min.js"/>
<!--plugins.js - Some Specific JS codes for Plugin Settings-->
<asset:javascript src="plugins.js"/>
<!--custom-script.js - Add your own theme custom JS-->
<asset:javascript src="custom-script.js"/>
</body>
</html>