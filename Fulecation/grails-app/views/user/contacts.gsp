<%@page import="fulecation.*" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" /> 
        <title>User Login</title>
    </head>
    <body>
        <div class="body">
            <div>
                <g:form action="contacts">
                <div id="filtros">
                    <h2>Filtrar Por:</h2>
                    <span class='filterCheckbox'>Brilhantes: <g:checkBox id="onlyShiny" name="onlyShiny" value="${params['onlyShiny']}" /></span>
                    <span class='filterCheckbox'>Bairro: <g:checkBox id="bairro" name="bairro" value="${params['bairro']}" /></span>
                    <span class='filterCheckbox'>Cidade: <g:checkBox id="cidade" name="cidade" value="${params['cidade']}" /></span>
                    <span class='filterCheckbox'>Estado: <g:checkBox id="estado" name="estado" value="${params['estado']}" /></span>
                    <div class="buttons" id="filterButton">
                        <input type="submit" value="Filtrar"></input>
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
                    def contact = Contact.findWhere(userA: session.user, userB: list[i]);
                    def contact2 = Contact.findWhere(userA: list[i], userB: session.user);
                    if(!contact || !contact2)
                    {
                        continue
                    }
                        
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
                    <g:if test="${contact2.approved == true}">
                        <g:if test="${contact.approved == false}">
                            <p>Pendente</p>
                            <g:link action="doDelete" controller="user" params="[user:list[i].username]">Cancelar</g:link>
                        </g:if>
                        <g:else>
                            <g:link action="doDelete" controller="user" params="[user:list[i].username]">Deletar</g:link>
                        </g:else>
                    </g:if>
                    <g:else>
                        <span class="buttons" id="filterButton">
                            <g:link action="doAccept" controller="user" params="[user:list[i].username]">Aprovar</g:link>
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
