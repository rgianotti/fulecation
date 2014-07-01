<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" /> 
        <title>User Login</title>
        <asset:javascript src="create.js"/>
    </head>
    <body>
        <div class="body">
            <g:if test="${params['user'] != null}">
                <div class="text-center text-primary">
                    Usuário ${params['user']} criado com sucesso!
                    <a class = "btn center-block" href="${createLink(uri: '/user/login')}"><g:message code="Entrar"/></a>
                </div>
            </g:if>
        </div>
    </body>
</html>
