<%@page import="fulecation.*" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" /> 
        <title>User Login</title>
        <script type="text/javascript">
        $(document).ready(function()
        {
            document.getElementById("list").className += " active";
        })
        </script>
    </head>
    <body>
        <div class="body">
            <div>
                <g:form action="list">
                    <div id="filtros-list">
                        <h2>Filtrar Por:</h2>
                        <% if(!params['figurinha']) { params['figurinha'] = '0' } %>
                        <div>
                            <span class='filterCheckbox'>Figurinha: <input type="number" id="figurinha" name="figurinha" value="${(params['figurinha'])}" min="0" max="639"/></span>
                            <span>Tem Brilhante: <g:checkBox id="onlyShiny" name="onlyShiny" value="${params['onlyShiny']}" /></span>
                        </div>
                        <span class='filterCheckbox'>Bairro: <g:checkBox id="bairro" name="bairro" value="${params['bairro']}" /></span>
                        <span class='filterCheckbox'>Cidade: <g:checkBox id="cidade" name="cidade" value="${params['cidade']}" /></span>
                        <span class='filterCheckbox'>Estado: <g:checkBox id="estado" name="estado" value="${params['estado']}" /></span>
                        <div>
                            <input style="margin-top:10px" class = "btn btn-primary" type="submit" value="Filtrar"></input>
                        </div>
                    </div>
                </g:form>
            </div>
            <table class="userForm" id="userList">
            <thead>
                <tr class="userListHead">
                    <td width="15%">
                        Usuário
                    </td>
                    <td width="15%">
                        Bairro
                    </td>
                    <td width="20%">
                        Cidade
                    </td>
                    <td width="15%">
                        Estado
                    </td>
                    <td width="15%">
                        Apenas Brilhantes
                    </td>
                    <td width="20%">
                        Contato
                    </td>
                </tr>
            </thead>
            <tbody>  
            <%
                def query = "from User as u where u.username <> '${session.user.username}'";
                if(params['onlyShiny'])
                {
                    //query += " and u.onlyShiny = true"
                }
                if(params['bairro'])
                {
                    query += " and u.bairro = '${session.user.bairro}'"
                }
                if(params['cidade'])
                {
                    query += " and u.cidade = '${session.user.cidade}'"
                }
                if(params['estado'])
                {
                    query += " and u.estado = '${session.user.estado}'"
                }
                def list = User.findAll(query);
                for(int i = 0; i < list.size; i++)
                {
                    if(params['figurinha'] != '')
                    {
                        def hs = HasSticker.findWhere(onwer: list[i], stickerNumber: Integer.parseInt(params['figurinha']));
                        if(!hs)
                        {
                            continue;
                        }
                        if(!hs.hasExtra || (params['onlyShiny'] && !hs.hasShiny))
                        {
                            continue;
                        }
                    }
                    def contact = Contact.findWhere(userA: session.user, userB: list[i]);
                    //boolean isContact = contact && contact.approved
            %>
                <tr class="userListLine">
                    <td width="15%">
                         <g:link action="profile" controller="user" params="[user:list[i].username]">${list[i].username}</g:link>
                    </td>
                    <td width="15%">
                        ${list[i].bairro}
                    </td>
                    <td width="20%">
                        ${list[i].cidade}
                    </td>
                    <td width="15%">
                        ${list[i].estado}
                    </td>
                    <td width="15%">
                        ${list[i].onlyShiny}
                    </td>
                    <td width="20%">
                    <g:if test="${contact != null}">
                        <g:if test="${contact.approved}">
                            ${list[i].email}
                        </g:if>
                        <g:else>
                            Pendendo Aprovação
                        </g:else>
                    </g:if>
                    <g:else>
                        <span>
                                <g:link class = "btn btn-primary" action="doRequest" controller="user" params="[user:list[i].username]">Pedir</g:link>
                        </span>
                    </g:else>
                    </td>
                </tr>
            <%
                }
            %>
            </tbody>
            </table> 
        </div>
    </body>
</html>
