<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" /> 
        <title>User Login</title>
    </head>
    <body>
        <div class="body">
            <g:form action="doCreate" method="post">
                <div class="dialog">
                    <!--<p>Enter your login details below:</p>-->
                    <table class="userForm">
                        <tr class='prop'>
                            <td valign='top' style='text-align:left;' width='20%'>
                                <label for='email'>Email:</label>
                            </td>
                            <td valign='top' style='text-align:left;' width='80%'>
                                <input id="email" type='text' name='email' value='${user?.email}' /> </td>
                        </tr>
                        <tr class='prop'>
                            <td valign='top' style='text-align:left;' width='20%'>
                                <label for='username'>User Name:</label>
                            </td>
                            <td valign='top' style='text-align:left;' width='80%'>
                                <input id="username" type='text' name='username' value='${user?.username}' /> </td>
                        </tr>
                        <tr class='prop'>
                            <td valign='top' style='text-align:left;' width='20%'>
                                <label for='password'>Password:</label>
                            </td>
                            <td valign='top' style='text-align:left;' width='80%'>
                                <input id="password" type='password' name='password' value='${user?.password}' />
                            </td>
                        </tr>
                        <tr class='prop'>
                            <td valign='top' style='text-align:left;' width='20%'>
                                <label for='confirmpassword'>Confirm Password:</label>
                            </td>
                            <td valign='top' style='text-align:left;' width='80%'>
                                <input id="confirmpassword" type='password' name='confirmpassword' value='${user?.password}' />
                            </td>
                        </tr>
                        <tr class='prop'>
                            <td valign='top' style='text-align:left;' width='20%'>
                                <label for='bairro'>Bairro:</label>
                            </td>
                            <td valign='top' style='text-align:left;' width='80%'>
                                <input id="bairro" type='text' name='bairro' value='${user?.bairro}' /> </td>
                        </tr>
                        <tr class='prop'>
                            <td valign='top' style='text-align:left;' width='20%'>
                                <label for='cidade'>Cidade:</label>
                            </td>
                            <td valign='top' style='text-align:left;' width='80%'>
                                <input id="cidade" type='text' name='cidade' value='${user?.cidade}' /> </td>
                        </tr>
                        <tr class='prop'>
                            <td valign='top' style='text-align:left;' width='20%'>
                                <label for='estado'>Estado:</label>
                            </td>
                            <td valign='top' style='text-align:left;' width='80%'>
                                <input id="estado" type='text' name='estado' value='${user?.estado}' /> </td>
                        </tr>

                    </table> 
                </div>
                <div class="buttons">
                    <span class="formButton">
                        <input type="submit" value="Create"></input>
                    </span>
                </div>
            </g:form>
        </div>
    </body>
</html>
