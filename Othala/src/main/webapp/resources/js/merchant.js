
/*
body {
 background-color: #fcfcfc;
 font-family: Lato, "Helvetica Neue", Helvetica, Arial, sans-serif;
}*/

/*
.content {
 margin: 0 0 30px; 
 background: #f8f8f8; 
 border: 0;
 border-top: 3px solid #357ebd; 
 position: relative; 
 -webkit-border-radius: 0; 
 -moz-border-radius: 0; 
 -o-border-radius: 0; 
 border-radius: 0; 
}
*/
/* Stili per sovrascrivere e modificare la Navbar di Bootstrap */
/*
.navbar {
  border: none;
  min-height: 90px;
}

.navbar-nav {
  margin-top: 0;
}

.navbar-brand {
 display: inline-block;
 text-indent: -9999px;
 width: 190px;
 height: 50px;
 background: url(/resources/images/logo2-xsmall.png) center center no-repeat;
}

.navbar-default {
 background-color: #fcfcfc;
}

.navbar-default .navbar-nav > li > a {
  font-size: 14px;
  font-weight: bold;
  text-transform: uppercase;
  color: #333333;
  border-bottom: 1px solid #357ebd;
}

.navbar-default .navbar-nav > li > a:hover,
.navbar-default .navbar-nav > li > a:focus {
  color: #357ebd;
}

.navbar-default .navbar-nav > .active > a,
.navbar-default .navbar-nav > .active > a:hover,
.navbar-default .navbar-nav > .active > a:focus {
  color: #fff;
  background-color: #357ebd;
}

.navbar-toggle {
  border-radius: 0;
}

.navbar-default .navbar-toggle {
 border: 1px solid #357ebd;
}

.navbar-default .navbar-toggle .icon-bar {
  background-color: #357ebd;
}

.navbar-default .navbar-collapse {
  border-color: transparent;
}

.navbar-default .navbar-nav > .dropdown > a:hover .caret,
.navbar-default .navbar-nav > .dropdown > a:focus .caret {
  border-top-color: #357ebd;
  border-bottom-color: #357ebd;
}

.navbar-default .navbar-nav > .open > a,
.navbar-default .navbar-nav > .open > a:hover,
.navbar-default .navbar-nav > .open > a:focus {
  color: #fff;
  background-color: #357ebd;
}

.navbar-default .navbar-nav > .open > a .caret,
.navbar-default .navbar-nav > .open > a:hover .caret,
.navbar-default .navbar-nav > .open > a:focus .caret {
  border-top-color: #333;
  border-bottom-color: #333;
}

.navbar-default .navbar-nav > .dropdown > a .caret {
  border-top-color: #333;
  border-bottom-color: #333;
}

@media screen and (min-width: 768px) {
 .navbar-default .navbar-nav > li > a {
  border-bottom: none;
}

.navbar-default .navbar-nav > li > a:hover,
.navbar-default .navbar-nav > li > a:focus {
  border-top: 2px solid #357ebd;
  padding-top: 13px;
}
}
*/
/* Stili per sovrascrivere e modificare i menu dropdown di Bootstrap */

/*
.dropdown-menu {
 padding: 0 0;
 border-radius: 0;
 -webkit-box-shadow: 0 2px 5px rgba(0, 0, 0, 0.175);
 box-shadow: 0 2px 5px rgba(0, 0, 0, 0.175);
}
.dropdown-menu > li > a {
 padding: 7px 10px;
 border-bottom: 1px solid #ccc;
}*/

/* Testata pagina */

/*
.header-merchant-admin {
 background-color: #5cb85c;
 padding: 8px 12px;
 border-bottom: 2px solid #357ebd;
}

.header-merchant-admin > h2 {
 margin-bottom: 0;
 margin-top: 0;
 color: #fff;
}*/


/* Stile per modificare e sovrascrivere l'aspetto il componente Breadcrumb di Bootstrap */


#merchant-breadcrumb.breadcrumb {
  margin: 0;
  background-color: transparent;
  border-radius: 0;
  font-size: 16px;
}

#merchant-breadcrumb.breadcrumb > li + li:before {
  color: black;
}

#merchant-breadcrumb.breadcrumb > .active {
  color: black !important;
  cursor: default !important;
  
}

#merchant-breadcrumb>li>a:hover {
text-decoration: none;
cursor: pointer !important;
}
#merchant-breadcrumb>li>a {
color: black !important;
text-decoration: none;

}
#merchant-breadcrumb>li>a:hover, a:focus {
text-decoration: underline;
}

