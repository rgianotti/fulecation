<%@page import="fulecation.*" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" /> 
        <title>User Login</title>
        <script type="text/javascript">
        $(document).ready(function()
        {
            document.getElementById("manage").className += " active";
        })
        </script>
    </head>
    <body>
        <%
            def user = null
            if(params['user'])
            {
                user = User.findWhere(username: params['user'])
            }

            if(!user)
            user = session.user

            Boolean isLogedInUser = (user.username == session.user.username)

            def cont = Contact.findWhere(userA: session.user, userB: user)

        %>
        <g:if test="${isLogedInUser == false && (cont == null || cont.approved == false)}">
            <div class="main_area">
            <h2>Você não pode ver essas informações desse usuário</h2>
            <g:link action="profile" controller="user" params="[user:user.username]">Profile de ${user.username}</g:link>
            </div>
        </g:if>
        <g:else>
            <div class="body">
                <g:if test="${isLogedInUser == false}">
                    <div style="margin-bottom: 10px">
                        <g:link class = "btn btn-primary" action="profile" controller="user" params="[user:user.username]">Profile de ${user.username}</g:link>
                    </div>
                </g:if>
                <div class="header" role="navigation">
                    <ul class = "nav nav-pills pull-right">
                        <%
                            session.stickers = []
                            def i
                            for(i = 1; i < HasSticker.album_sections.size; i++)
                            {
                                def temp = "[collection: '" + Integer.toString(i) + "']";
                        %>
                            <g:if test="${params['collection'] == Integer.toString(i)}"> 
                                <li class="active"><g:link class="stickerNavButton" action="manage" params="[collection: i, user:user.username]">${ HasSticker.album_sections[i] }</g:link></li>
                            </g:if>
                            <g:else>
                                <li><g:link class="stickerNavButton" action="manage" params="[collection: i, user:user.username]">${ HasSticker.album_sections[i] }</g:link></li>
                            </g:else>
                        <%
                            }
                        %>
                            <g:if test="${params['collection'] == null || params['collection'] == '0'}"> 
                                <li class="active"><g:link class="stickerNavButton" action="manage" params="[collection: 0, user:user.username]">${ HasSticker.album_sections[0] }</g:link></li>
                            </g:if>
                            <g:else>
                                <li><g:link class="stickerNavButton" action="manage" params="[collection: 0, user:user.username]">${ HasSticker.album_sections[0] }</g:link></li>
                            </g:else>
                    </ul>
                </div>

                <g:form url="[action:'doManage']">
                    <div class="dialog">
                    <!--<p>Enter your login details below:</p>-->
                        <table class="userForm" id="stickersTable">
                            <thead>
                                <tr class="stickerHead">
                                    <td width="30%">
                                        Figurinha
                                    </td>
                                    <td width="15%">
                                        Code
                                    </td>
                                    <td width="35%">
                                        Name
                                    </td>
                                    <td width="10%">
                                        Tem Extras
                                    </td>
                                    <td width="10%">
                                        Brilhante
                                    </td>
                                </tr>
                            </thead>
                            <tbody>  
                                <%
                                    def cols = params['collection']
                                    if(cols == null)
                                    {
                                        cols = "0";
                                    }
                                    Integer col = Integer.parseInt(cols);
                                    Integer min = 32 + ((col - 1) * 19)
                                    Integer max = 32 + ((col) * 19)
                                    if(col == 0)
                                    {
                                        min = 0;
                                        max = 32
                                    }
                                    def j
                                    for(j = min; j < max; j++)
                                    {
                                        java.lang.Object hs = HasSticker.findWhere(onwer: user, stickerNumber: j)
                                        if(!hs)
                                        hs = new HasSticker(onwer: user, stickerNumber: j, hasExtra: false, hasShiny: false)
                                        session.stickers.add(hs)
                                %>
                                <tr class="stickerLine">
                                    <td valign='top' width="30%">
                            <asset:image src="${j}.jpg" alt="Grails"/>
                            </td>
                            <td  valign='top' width="15%">
                                ${HasSticker.GetCode(j)}
                            </td>
                            <td valign='top'  width="35%">
                                ${HasSticker.GetName(j)}
                            </td>
                            <td valign='top' width="10%">
                                <g:if test="${isLogedInUser == true}">
                                    <g:checkBox name="hasExtra${hs?.stickerNumber}" value="${hs?.hasExtra}"/>
                                </g:if>
                                <g:else>
                                    <g:checkBox name="hasExtra${hs?.stickerNumber}" value="${hs?.hasExtra}" onclick="return false"/>
                                </g:else>
                            </td>
                            <td valign='top' width="10%">
                                <g:if test="${isLogedInUser == true}">
                                    <g:checkBox name="hasShiny${hs?.stickerNumber}" value="${hs?.hasShiny}"/>
                                </g:if>
                                <g:else>
                                    <g:checkBox name="hasShiny${hs?.stickerNumber}" value="${hs?.hasShiny}" onclick="return false"/>
                                </g:else>
                            </td>
                            </tr>
                            <%
                                }
                            %>
                            </tbody>
                        </table> 
                    </div>
                    <g:if test="${isLogedInUser == true}">
                        <div>
                            <g:submitButton  class = "btn btn-primary" name="atualizar" value="Atualizar" />
                        </div>
                    </g:if>
                </g:form>
            </div>
        </g:else>
    </body>
</html>
