<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" /> 
        <title>User Login</title>
        <script type="text/javascript">
        $(document).ready(function()
        {
            document.getElementById("profile").className += " active";
        })
        </script>
    </head>
    <body>
    <g:if test="${params['user'] == null || params['user'] == session.user.username}">
        <g:render template="info"/>
    </g:if>
    <g:else>
        <g:render template="user_info"/>
    </g:else>
        <%--<div class="body">
            <g:form>
                <div class="dialog">
                    <!--<p>Enter your login details below:</p>-->
                    <table class="userForm">
                        <tr class='prop'>
                            <td valign='top' style='text-align:left;' width='20%'>
                                <label for='email'>Email:</label>
                            </td>
                            <td valign='top' style='text-align:left;' width='80%'>
                                <input readonly="true" id="email" type='text' name='email' value='${session.getAttribute("user")?.email}' /> </td>
                        </tr>
                        <tr class='prop'>
                            <td valign='top' style='text-align:left;' width='20%'>
                                <label for='username'>User Name:</label>
                            </td>
                            <td valign='top' style='text-align:left;' width='80%'>
                                <input readonly="true"  id="username" type='text' name='username' value='${session.getAttribute("user")?.username}' /> </td>
                        </tr>
                        <!--<tr class='prop'>
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
                        </tr>-->
                        <tr class='prop'>
                            <td valign='top' style='text-align:left;' width='20%'>
                                <label for='bairro'>Bairro:</label>
                            </td>
                            <td valign='top' style='text-align:left;' width='80%'>
                                <input readonly="true"  id="bairro" type='text' name='bairro' value='${session.getAttribute("user")?.bairro}' /> </td>
                        </tr>
                        <tr class='prop'>
                            <td valign='top' style='text-align:left;' width='20%'>
                                <label for='cidade'>Cidade:</label>
                            </td>
                            <td valign='top' style='text-align:left;' width='80%'>
                                <input readonly="true"  id="cidade" type='text' name='cidade' value='${session.getAttribute("user")?.cidade}' /> </td>
                        </tr>
                        <tr class='prop'>
                            <td valign='top' style='text-align:left;' width='20%'>
                                <label for='estado'>Estado:</label>
                            </td>
                            <td valign='top' style='text-align:left;' width='80%'>
                                <input readonly="true"  id="estado" type='text' name='estado' value='${session.getAttribute("user")?.estado}' /> </td>
                        </tr>

                        <tr class='prop'>
                            <td valign='top' style='text-align:left;' width='20%'>
                                <label for='onlyShiny'>Apenas Brilhantes:</label>
                            </td>
                            <td valign='top' style='text-align:left;' width='80%'>
                                <g:checkBox onclick="return false"  id="onlyShiny" name="onlyShiny" value="${session.getAttribute("user")?.onlyShiny}" />
                            </td>
                            <!--<g:checkBox  readonly="true" id="onlyShiny" name='onlyShiny' value= '${session.getAttribute("user")?.onlyShiny} ? "true" : "false"' /> </td>-->
                        </tr>

                    </table> 
                </div>
                <!--<div class="buttons">
                    <span class="formButton">
                        <input type="submit" value="Create"></input>
                    </span>
                </div>-->
            </g:form>
        </div>--%>
    </body>
</html>
