<!DOCTYPE html>
<html lang="en">
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="msapplication-tap-highlight" content="no">
	<meta name="description" content="">
	<meta name="keywords" content="">
	<title>Connexion | VAMP</title>
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<!-- CORE CSS-->
	<asset:stylesheet src="materialize.css"/>
	<asset:stylesheet src="style.css"/>
	<!-- Custome CSS-->
	<asset:stylesheet src="custom.css"/>
	<!-- INCLUDED PLUGIN CSS ON THIS PAGE -->
	<asset:stylesheet src="page-center.css"/>
	<asset:stylesheet src="perfect-scrollbar.css"/>
</head>
<body class="cyan loaded">
<!-- Start Page Loading -->
<div id="loader-wrapper">
	<div id="loader"></div>
	<div class="loader-section section-left"></div>
	<div class="loader-section section-right"></div>
</div>
<!-- End Page Loading -->
<div id="login-page" class="row">
	<div class="col s12 z-depth-4 card-panel">
		<form action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm" class="cssform login-form" autocomplete="off">
			<div class="row">
				<div class="input-field col s12 center">
					<img src="logo here" alt="" class="circle responsive-img valign profile-image-login">
					<p class="center login-form-text">VAMP</p>
				</div>
				<g:if test='${flash.message}'>
					<div class="login_message">${flash.message}</div>
				</g:if>
			</div>
			<div class="row margin">
				<div class="input-field col s12">
					<i class="material-icons prefix pt-5">person_outline</i>
					<input name="${usernameParameter ?: 'username'}" id="username" type="text">
					<label for="username" class="center-align">Nom d'utilisateur</label>
				</div>
			</div>
			<div class="row margin">
				<div class="input-field col s12">
					<i class="material-icons prefix pt-5">lock_outline</i>
					<input name="${passwordParameter ?: 'password'}" id="password" type="password">
					<label for="password">Mot de passe</label>
				</div>
			</div>
			<div class="row">
				<div class="col s12 m12 l12 ml-2 mt-3">
					<input type="checkbox" id="remember_me"  <g:if test='${hasCookie}'>checked="checked"</g:if>/>
					<label for="remember_me">Mémoriser mon compte</label>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s12">
					<button type="submit" id="submit" class="btn waves-effect waves-light col s12">Se connecter</button>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s6 m6 l6">
					<p class="margin medium-small"><a href="#">Nouveau utilisateur!</a></p>
				</div>
				<div class="input-field col s6 m6 l6">
					<p class="margin right-align medium-small"><a href="#">Mot de passe oublié?</a></p>
				</div>
			</div>
		</form>
	</div>
</div>
<!-- ================================================
    Scripts
    ================================================ -->
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

<div class="hiddendiv common"></div></body></html>
