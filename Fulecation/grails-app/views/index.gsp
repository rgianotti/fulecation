<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <title>Welcome to Grails</title>
        <asset:stylesheet src="main_index.css"/>
    </head>
    <body>
        <div id="page-body" role="main">
            <h1>Bem vindo ao Fulecando</h1>
            <p>Seu ponto virtual de troca de figurinhas</p>

            <div id="main_log_create" class="nav" role="navigation">
                <ul>
                    <li><a href="${createLink(uri: '/user/login')}"><g:message code="Login"/></a></li>
                    <li><a href="${createLink(uri: '/user/create')}"><g:message code="Create Account"/></a></li>
                </ul>
            </div>
        </div>
    </body>
</html>
