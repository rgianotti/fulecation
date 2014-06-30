<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title><g:layoutTitle default="Grails"/></title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
        <link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
        <link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
    <asset:stylesheet src="application.css"/>
    <asset:javascript src="application.js"/>
    <asset:stylesheet src="main_index.css"/>
    <asset:stylesheet src="custom_styles.css"/>
    <g:layoutHead/>
</head>
<body>
    <div id="login_out_bar">
        <g:if test="${session.getAttribute("user") != null}">
            <p>Bem Vindo, <a href="${createLink(uri: '/user/info')}">${session.getAttribute("user").username}.</a> <a href="${createLink(uri: '/user/logout')}">Sair</a></p>
        </g:if>
        <g:else>
                <p>Bem Vindo, Visitante. <a href="${createLink(uri: '/user/login')}">Entrar</a></p>
        </g:else>
    </div>
    <div id="banner" role="banner"><a href="${createLink(uri: '/')}"><asset:image src="banner.jpg" alt="Grails"/></a></div>
    <div class="nav" role="navigation">
        <ul>
            <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
            <g:if test="${session.user != null}">
                <li><a class="" href="${createLink(uri: '/user/info')}">Profile</a></li>
                <li><a class="" href="${createLink(uri: '/hasSticker/manage')}">Figurinhas</a></li>
                <li><a class="" href="${createLink(uri: '/user/list')}">Procurar Figurinhas</a></li>
            </g:if>
        </ul>
    </div>
    <g:layoutBody/>
    <div class="footer" role="contentinfo"></div>
    <div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
</body>
</html>
