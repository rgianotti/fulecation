<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" /> 
        <title>User Login</title>
        <asset:javascript src="create.js"/>
    </head>
    <body>
        <div class="body">
            <g:if test="${params['error'] != null}">
                <div class="text-center text-danger">
                    ${params['error']}
                </div>
            </g:if>
            <g:form id="create_form" action="doCreate" method="post">
                <div class="dialog">
                    <!--<p>Enter your login details below:</p>-->
                    <table class="userForm">
                        <tr class='prop'>
                            <td valign='top' style='text-align:left;' width='20%'>
                                <label for='email'>Email:</label>
                            </td>
                            <td valign='top' style='text-align:left;' width='80%'>
                                <input id="email" type='text' name='email' value='${user?.email}' /> <p id='email-error' class="text-danger" hidden="true">Entre com um e-mail válido</p>
                            </td>
                        </tr>
                        <tr class='prop'>
                            <td valign='top' style='text-align:left;' width='20%'>
                                <label for='username'>User Name:</label>
                            </td>
                            <td valign='top' style='text-align:left;' width='80%'>
                                <input id="username" type='text' name='username' value='${user?.username}' />  <p id='username-error' class="text-danger" hidden="true">Apenas letras e números e entre 6 e 32 caracteres</p>
                            </td>
                        </tr>
                        <tr class='prop'>
                            <td valign='top' style='text-align:left;' width='20%'>
                                <label for='password'>Password:</label>
                            </td>
                            <td valign='top' style='text-align:left;' width='80%'>
                                <input id="password" type='password' name='password' value='${user?.password}' /> <p id='password-error' class="text-danger" hidden="true">A senha deve ter de 6 à 32 caracteres</p>
                            </td>
                        </tr>
                        <tr class='prop'>
                            <td valign='top' style='text-align:left;' width='20%'>
                                <label for='confirmpassword'>Confirm Password:</label>
                            </td>
                            <td valign='top' style='text-align:left;' width='80%'>
                                <input id="confirmpassword" type='password' name='confirmpassword' value='${user?.password}' /> <p id='confirmpassword-error' class="text-danger" hidden="true">Deve ser igual à senha entrada</p>
                            </td>
                        </tr>
                        <tr class='prop'>
                            <td valign='top' style='text-align:left;' width='20%'>
                                <label for='bairro'>Bairro:</label>
                            </td>
                            <td valign='top' style='text-align:left;' width='80%'>
                                <input id="bairro" type='text' name='bairro' value='${user?.bairro}' /><p id='bairro-error' class="text-danger" hidden="true">Não pode ser vazio</p>
                            </td> 
                        </tr>
                        <tr class='prop'>
                            <td valign='top' style='text-align:left;' width='20%'>
                                <label for='cidade'>Cidade:</label>
                            </td>
                            <td valign='top' style='text-align:left;' width='80%'>
                                <input id="cidade" type='text' name='cidade' value='${user?.cidade}' /> <p id='cidade-error' class="text-danger" hidden="true">Não pode ser vazio</p>
                                </td> 
                        </tr>
                        <tr class='prop'>
                            <td valign='top' style='text-align:left;' width='20%'>
                                <label for='estado'>Estado:</label>
                            </td>
                            <td valign='top' style='text-align:left;' width='80%'>
                                <input id="estado" type='text' name='estado' value='${user?.estado}' /> <p id='estado-error' class="text-danger" hidden="true">Não pode ser vazio</p>
                            </td> 
                        </tr>
                        <tr class='prop'>
                            <td valign='top' style='text-align:left;' width='20%'>
                                <label for='onlyShiny'>Apenas Brilhantes:</label>
                            </td>
                            <td valign='top' style='text-align:left;' width='80%'>
                                <g:checkBox id="onlyShiny" name="onlyShiny" value="${user?.onlyShiny}" />
                            </td>
                        </tr>

                    </table> 
                </div>
                <div>
                    <span>
                        <input class = "btn btn-primary center-block" type="submit" value="Criar" onclick="return validate();"></input>
                    </span>
                </div>
            </g:form>
        </div>
    </body>
</html>
