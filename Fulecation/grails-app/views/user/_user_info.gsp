<%@ page import="fulecation.*" %>

<%
    def user = User.findWhere(username: params['user'])
    
    def cont = Contact.findWhere(userA: session.user, userB: user)
%>

<g:if test="${user == null}">
    <div class="main_area">
        <h2>Usuário ${params['user']} não encontrado</h2>
    </div>
</g:if>
<g:elseif test="${cont == null}">
    <div class="main_area">
        <h2>Usuário não é seu contato</h2>
        <span>
            <g:link class = "btn btn-primary" action="doRequest" controller="user" params="[user:user.username]">Pedir Contato</g:link>
        </span>
    </div>
</g:elseif>
<g:elseif test="${cont.approved == false}">
    <div class="main_area">
        <h2>Pendendo aprovação de contato</h2>
    </div>
</g:elseif>
<g:else>
<table class="userForm">
    <tr class='prop'>
        <td valign='top' style='text-align:left;' width='20%'>
            <label for='email'>Email:</label>
        </td>
        <td valign='top' style='text-align:left;' width='80%'>
            <input readonly="true" id="email" type='text' name='email' value='${user?.email}' /> </td>
    </tr>
    <tr class='prop'>
        <td valign='top' style='text-align:left;' width='20%'>
            <label for='username'>User Name:</label>
        </td>
        <td valign='top' style='text-align:left;' width='80%'>
            <input readonly="true"  id="username" type='text' name='username' value='${user?.username}' /> </td>
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
            <input readonly="true"  id="bairro" type='text' name='bairro' value='${user?.bairro}' /> </td>
    </tr>
    <tr class='prop'>
        <td valign='top' style='text-align:left;' width='20%'>
            <label for='cidade'>Cidade:</label>
        </td>
        <td valign='top' style='text-align:left;' width='80%'>
            <input readonly="true"  id="cidade" type='text' name='cidade' value='${user?.cidade}' /> </td>
    </tr>
    <tr class='prop'>
        <td valign='top' style='text-align:left;' width='20%'>
            <label for='estado'>Estado:</label>
        </td>
        <td valign='top' style='text-align:left;' width='80%'>
            <input readonly="true"  id="estado" type='text' name='estado' value='${user?.estado}' /> </td>
    </tr>

    <tr class='prop'>
        <td valign='top' style='text-align:left;' width='20%'>
            <label for='onlyShiny'>Apenas Brilhantes:</label>
        </td>
        <td valign='top' style='text-align:left;' width='80%'>
            <g:checkBox onclick="return false"  id="onlyShiny" name="onlyShiny" value="${user?.onlyShiny}" />
        </td>
        <!--<g:checkBox  readonly="true" id="onlyShiny" name='onlyShiny' value= '${session.getAttribute("user")?.onlyShiny} ? "true" : "false"' /> </td>-->
    </tr>

</table>
<div class="main_area" style="margin-bottom:10px">
    <g:link class = "btn btn-primary" action="manage" controller="hasSticker" params="[user:user.username]">Figurinhas de ${user.username}</g:link>
</div>
</g:else>

