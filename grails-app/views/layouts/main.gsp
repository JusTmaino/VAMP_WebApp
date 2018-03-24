<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="msapplication-tap-highlight" content="no">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <title>
        <g:layoutTitle default="VAMP Dashboard"/>
    </title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!-- CORE CSS-->
    <asset:stylesheet src="materialize.css"/>
    <asset:stylesheet src="style.css" />
    <!-- Custome CSS-->
    <asset:stylesheet src="custom.css"/>
    <!-- INCLUDED PLUGIN CSS ON THIS PAGE -->
    <asset:stylesheet src="prism.css" />
    <asset:stylesheet src="perfect-scrollbar.css"/>
    <asset:stylesheet src="flag-icon.min.css"/>
    <asset:stylesheet href="imageuploadify.min.css"/>
    <asset:stylesheet src="font-awesome.min.css"/>
    <asset:stylesheet href="application.css"/>

    <!-- jQuery Library -->
    <asset:javascript src="imageuploadify.min.js"/>
    <asset:javascript src="jquery-3.2.1.min.js"/>
</head>

<body class="layout-dark loaded">
<!-- Start Page Loading -->
<div id="loader-wrapper">
    <div id="loader"></div>

    <div class="loader-section section-left"></div>

    <div class="loader-section section-right"></div>
</div>
<!-- End Page Loading -->
<!-- //////////////////////////////////////////////////////////////////////////// -->
<!-- START HEADER -->
<header id="header" class="page-topbar">
    <!-- start header nav-->
    <div class="navbar-fixed ">
        <nav class="navbar-color  darken-2">
            <div class="nav-wrapper">
                <ul class="left">
                    <li>
                        <h1 class="logo-wrapper">
                            <a href="/"
                               class="brand-logo darken-1">
                                <asset:image src="v3.png"
                                     alt="materialize logo" style="width: 175px;
    height: 97px;
    margin-top: -23px;
    margin-left: 3px;"/>
                                <!--span class="logo-text hide-on-med-and-down">VAMP</span-->
                            </a>
                        </h1>
                    </li>
                </ul>

                <div class="header-search-wrapper hide-on-med-and-down">
                    <i class="material-icons">search</i>
                    <input type="text" name="Search" class="header-search-input z-depth-2"
                           placeholder="Explore VAMP">
                </div>
                <ul class="right hide-on-med-and-down">
                    <li>
                        <a href="javascript:void(0);" class="waves-effect waves-block waves-light toggle-fullscreen">
                            <i class="material-icons">settings_overscan</i>
                        </a>
                    </li>

                    <li>
                        <a href="javascript:void(0);" class="waves-effect waves-block waves-light profile-button"
                           data-activates="profile-dropdown">
                            <span class="avatar-status avatar-online">
                                <g:if test="${vamp_webapp.User.findById(sec.loggedInUserInfo(field: 'id')).image != null }">
                                    <img src="${grailsApplication.config.server.pathServer}/images/users/${vamp_webapp.User.findById(sec.loggedInUserInfo(field: 'id')).image.path}"
                                </g:if>
                                     alt="avatar"/>
                                <i></i>
                            </span>
                        </a><ul id="profile-dropdown" class="dropdown-content">
                        <li>
                            <a href="/user/show/${sec.loggedInUserInfo(field: 'id')}"
                               class="grey-text text-darken-1">
                                <i class="material-icons">face</i> Profile</a>
                        </li>
                        <li>
                            <a href="#"
                               class="grey-text text-darken-1">
                                <i class="material-icons">settings</i> Settings</a>
                        </li>

                        <li class="divider"></li>

                        <li>
                            <a href="/logout/index"
                               class="grey-text text-darken-1">
                                <i class="material-icons">keyboard_tab</i> Logout</a>
                        </li>
                    </ul>
                    </li>

                </ul>
                <!-- translation-button -->

                <!-- notifications-dropdown -->

                <!-- profile-dropdown -->

            </div>
        </nav>
    </div>
    <!-- end header nav-->
</header>
<!-- END HEADER -->
<!-- //////////////////////////////////////////////////////////////////////////// -->
<!-- START MAIN -->
<div id="main">
    <!-- START WRAPPER -->
    <div class="wrapper">
        <!-- START LEFT SIDEBAR NAV-->
        <aside id="left-sidebar-nav">
            <ul id="slide-out" class="side-nav fixed leftside-navigation ps-container ps-active-y materialize-red darken-2"
                style="transform: translateX(0%);">
                <li class="user-details black-overlay darken-2">
                    <div class="row">
                        <div class="col col s4 m4 l4">
                        <g:if test="${vamp_webapp.User.findById(sec.loggedInUserInfo(field: 'id')).image != null }">
                            <img src="${grailsApplication.config.server.pathServer}/images/users/${vamp_webapp.User.findById(sec.loggedInUserInfo(field: 'id')).image.path}" alt=""
                                         class="circle responsive-img valign profile-image cyan"/>
                        </g:if>
                        </div>

                        <div class="col col s8 m8 l8">

                            <a class="btn-flat dropdown-button waves-effect waves-light white-text profile-btn"
                               href="#"
                               data-activates="profile-dropdown-nav">${vamp_webapp.User.findById(sec.loggedInUserInfo(field: 'id')).fullName}
                                <i class="mdi-navigation-arrow-drop-down right"></i></a><ul id="profile-dropdown-nav"
                                                                                             class="dropdown-content">
                            <li>
                                <a href="/user/show/${sec.loggedInUserInfo(field: 'id')}"
                                   class="grey-text text-darken-1">
                                    <i class="material-icons grey-text text-darken-1">face</i> Profile</a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="#"
                                   class="grey-text text-darken-1">
                                    <i class="material-icons grey-text text-darken-1">keyboard_tab</i> Logout</a>
                            </li>
                        </ul>

                            <p class="user-roal">
                                <sec:ifAnyGranted roles="ROLE_ADMIN"><span class="label label-rose">Administrator</span></sec:ifAnyGranted>
                                <sec:ifAnyGranted roles="ROLE_USER"><span class="label label-info">User</span></sec:ifAnyGranted>
                            </p>                        </div>
                    </div>
                </li>




                <li class="no-padding ">
                    <ul class="collapsible" data-collapsible="accordion">
                        <li class="bold">
                            <a href="/"
                               class="waves-effect waves-cyan">
                                <i class="material-icons">dashboard</i>

                                <span class="nav-text">Home</span>
                            </a>
                        </li>
                        <ul class="collapsible" data-collapsible="accordion">
                            <li class="bold">
                                <a class="collapsible-header waves-effect waves-cyan" href="#">
                                <i class="material-icons">directions_car</i>

                                <span class="nav-text">My Cars</span>
                                </a>
                                <div class="collapsible-body">

                                    <ul class="nav" id="cars">
                                        <g:each var="cat" in="${vamp_webapp.User.findById(sec.loggedInUserInfo(field: 'id')).getCars()}">
                                            <li style="text-align: center">
                                                <a href="/car/show/${cat.id}"><span
                                                        class="sidebar-normal">${cat.getBrand()}</span>
                                                </a>
                                            </li>
                                        </g:each>
                                    </ul>
                                </div>
                            </li>
                        </ul>
                        <ul class="collapsible" data-collapsible="accordion">
                            <li class="bold">
                                <a class="collapsible-header waves-effect waves-cyan" href="#">
                                    <i class="material-icons">mood</i>

                                    <span class="nav-text">My Preferences</span>
                                </a>
                                <div class="collapsible-body">

                                    <ul class="nav" id="profiles">
                                        <g:each var="cat" in="${vamp_webapp.User.findById(sec.loggedInUserInfo(field: 'id')).getProfiles()}">
                                            <li style="text-align: center">
                                                <a href="/profile/show/${cat.id}"><span
                                                        class="sidebar-normal">Preference ${cat.getId()}</span>
                                                </a>
                                            </li>
                                        </g:each>
                                    </ul>
                                </div>
                            </li>
                        </ul>

                        <li class="bold">
                            <a href="#"
                               class="waves-effect waves-cyan">
                                <i class="material-icons">today</i>
                                <span class="nav-text">Point Of Interests</span>
                            </a>
                        </li>


                        <sec:ifAnyGranted roles="ROLE_ADMIN">
                        <li class="no-padding">
                            <ul class="collapsible" data-collapsible="accordion">
                                <li class="bold">
                                    <a class="collapsible-header waves-effect waves-cyan">
                                        <i class="material-icons">settings</i>

                                        <span class="nav-text">Gestion </span>
                                    </a>

                                    <div class="collapsible-body">
                                        <ul class="nav">
                                            <li style="text-align: center">
                                                <a href="/user/">
                                                    <span class="sidebar-normal">Users</span>
                                                </a>
                                            </li>
                                            <li style="text-align: center">
                                                <a href="/car/">
                                                    <span class="sidebar-normal">Cars</span>
                                                </a>
                                            </li>
                                            <li style="text-align: center">
                                                <a href="/profile/">
                                                    <span class="sidebar-normal">Profiles</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                            </ul>
                        </li>
                        </sec:ifAnyGranted>
                    </ul>
                </li>

                <li>
                    <a href="#">
                        <i class="material-icons">info</i>

                        <span class="nav-text">A propos</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="material-icons">textsms</i>
                        <span class="nav-text">Contact us</span>
                    </a>
                </li>
                <div class="ps-scrollbar-x-rail" style="left: 0px; bottom: 3px;"><div class="ps-scrollbar-x"
                                                                                      style="left: 0px; width: 0px;"></div>
                </div>

                <div class="ps-scrollbar-y-rail" style="top: 0px; height: 592px; right: 3px;"><div
                        class="ps-scrollbar-y" style="top: 0px; height: 267px;"></div></div>
            </ul>
            <a href="#"
               data-activates="slide-out"
               class="sidebar-collapse btn-floating btn-medium waves-effect waves-light hide-on-large-only">
                <i class="material-icons">menu</i>
            </a>
        </aside>
        <!-- END LEFT SIDEBAR NAV-->
        <!-- //////////////////////////////////////////////////////////////////////////// -->
        <!-- START CONTENT -->
        <section id="content">
            <!--breadcrumbs start-->
            <div id="breadcrumbs-wrapper">
                <!-- Search for small screen -->
                <div class="header-search-wrapper grey lighten-2 hide-on-large-only">
                    <input type="text" name="Search" class="header-search-input z-depth-2"
                           placeholder="Explore Materialize">
                </div>

                <div class="container">

                </div>
            </div>
            <!--breadcrumbs end-->
            <!--start container-->
            <div class="container">

                <g:layoutBody/>
                <!-- Floating Action Button -->
                <!--<div class="fixed-action-btn " style="bottom: 50px; right: 19px;">
                    <a class="btn-floating btn-large">
                        <i class="material-icons">add</i>
                    </a>
                    <ul>
                        <li>
                            <a href="https://pixinvent.com/materialize-material-design-admin-template/html/fixed-menu/css-helpers.html" class="btn-floating blue">
                                <i class="material-icons">help_outline</i>
                            </a>
                        </li>
                        <li>
                            <a href="https://pixinvent.com/materialize-material-design-admin-template/html/fixed-menu/cards-extended.html" class="btn-floating green">
                                <i class="material-icons">widgets</i>
                            </a>
                        </li>
                        <li>
                            <a href="https://pixinvent.com/materialize-material-design-admin-template/html/fixed-menu/app-calendar.html" class="btn-floating amber">
                                <i class="material-icons">today</i>
                            </a>
                        </li>
                        <li>
                            <a href="https://pixinvent.com/materialize-material-design-admin-template/html/fixed-menu/app-email.html" class="btn-floating red">
                                <i class="material-icons">mail_outline</i>
                            </a>
                        </li>
                    </ul>
                </div>-->
                <!-- Floating Action Button -->
            </div>
            <!--end container-->
        </section>
        <!-- END CONTENT -->
        <!-- //////////////////////////////////////////////////////////////////////////// -->
        <!-- START RIGHT SIDEBAR NAV-->
        <aside id="right-sidebar-nav">
            <ul id="chat-out" class="side-nav rightside-navigation right-aligned ps-container ps-active-y"
                style="transform: translateX(100%);">
                <li class="li-hover">
                    <div class="row">
                        <div class="col s12 border-bottom-1 mt-5">
                            <ul class="tabs">
                                <li class="tab col s4">
                                    <a href="#activity"
                                       class="active">
                                        <span class="material-icons">graphic_eq</span>
                                    </a>
                                </li>
                                <li class="tab col s4">
                                    <a href="#chatapp">
                                        <span class="material-icons">face</span>
                                    </a>
                                </li>
                                <li class="tab col s4">
                                    <a href="#settings">
                                        <span class="material-icons">settings</span>
                                    </a>
                                </li>
                                <li class="indicator" style="right: 185px; left: 0px;"></li></ul>
                        </div>

                        <div id="settings" class="col s12" style="display: none;">
                            <h6 class="mt-5 mb-3 ml-3">GENERAL SETTINGS</h6>
                            <ul class="collection border-none">
                                <li class="collection-item border-none">
                                    <div class="m-0">
                                        <span class="font-weight-600">Notifications</span>

                                        <div class="switch right">
                                            <label>
                                                <input checked="" type="checkbox">
                                                <span class="lever"></span>
                                            </label>
                                        </div>
                                    </div>

                                    <p>Use checkboxes when looking for yes or no answers.</p>
                                </li>
                            </ul>
                        </div>

                        <div id="chatapp" class="col s12" style="display: none;">
                            <div class="collection border-none">
                                <a href="#!"
                                   class="collection-item avatar border-none">
                                    <img src="aa"
                                         alt="" class="circle cyan">
                                    <span class="line-height-0">Elizabeth Elliott</span>
                                    <span class="medium-small right blue-grey-text text-lighten-3">5.00 AM</span>

                                    <p class="medium-small blue-grey-text text-lighten-3">Thank you</p>
                                </a>
                            </div>
                        </div>

                        <div id="activity" class="col s12 active">
                            <h6 class="mt-5 mb-3 ml-3">RECENT ACTIVITY</h6>

                            <div class="activity">
                                <div class="col s3 mt-2 center-align recent-activity-list-icon">
                                    <i class="material-icons white-text icon-bg-color deep-purple lighten-2">add_shopping_cart</i>
                                </div>

                                <div class="col s9 recent-activity-list-text">
                                    <a href="#"
                                       class="deep-purple-text medium-small">just now</a>
                                    <p class="mt-0 mb-2 fixed-line-height font-weight-300 medium-small">Jim Doe Purchased new equipments for zonal office.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>

                <div class="ps-scrollbar-x-rail" style="left: 0px; bottom: 3px;"><div class="ps-scrollbar-x"
                                                                                      style="left: 0px; width: 0px;"></div>
                </div>

                <div class="ps-scrollbar-y-rail" style="top: 0px; height: 588px; right: 3px;"><div
                        class="ps-scrollbar-y" style="top: 0px; height: 379px;"></div></div></ul>
        </aside>
        <!-- END RIGHT SIDEBAR NAV-->
    </div>
    <!-- END WRAPPER -->
</div>
<!-- END MAIN -->
<!-- //////////////////////////////////////////////////////////////////////////// -->
<!-- START FOOTER -->
<footer class="page-footer">
    <div class="footer-copyright">
        <div class="container">
            <span>Copyright ©
                <script type="text/javascript">
                    document.write(new Date().getFullYear());
                </script>2017 <a class="grey-text text-lighten-2"
                                 href="#"
                                 target="_blank">VAMP</a> All rights reserved.</span>
            <span class="right hide-on-small-only">Design and Developed by <a class="grey-text text-lighten-2"
                                                                              href="">VAMP</a>
            </span>
        </div>
    </div>
</footer>
<!-- END FOOTER -->
<!-- ================================================
    Scripts
    ================================================ -->

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

<div class="hiddendiv common"></div>

<div class="drag-target" data-sidenav="slide-out"
     style="left: 0px; touch-action: pan-y; -webkit-user-drag: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></div>

<div class="drag-target" data-sidenav="chat-out"
     style="right: 0px; touch-action: pan-y; -webkit-user-drag: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></div>
</body>
</html>