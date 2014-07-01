<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" /> 

    <title>Fulecando</title>
    <script type="text/javascript">
    $(document).ready(function()
    {
        document.getElementById("main").className += " active";
    })
    </script>
  </head>

  <body>

      <div class="jumbotron">
        <h1>Bem vindo ao Fulecando</h1>
            <p>Seu ponto virtual de troca de figurinhas</p>
            <div style='margin-top:30px'>
                <g:link class= "btn btn-primary btn-lg btn-primary" action="login" controller="user">Entrar</g:link>
            </div>
            <div style='margin-top:30px'>
                <g:link class="btn btn-primary btn-lg btn-primary" action="create" controller="user">Criar Conta</g:link>
            </div>
                    <%--<g:link class="btn btn-primary btn-lg" action="login" controller="user"">Entrar</g:link>
                    <g:link class="btn btn-primary btn-lg" action="create" controller="user"">Criar Conta</g:link>--%>
                    <%--<a class = "btn center-block" href="${createLink(uri: '/user/login')}"><g:message code="Entrar"/></a>
                    <a class = "btn btn-lg center-block" href="${createLink(uri: '/user/create')}"><g:message code="Criar Conta"/></a>--%>
 
      </div>

      <div class="footer">
        <p>&copy; UFSCar 2014</p>
      </div>

    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
  </body>
</html>
