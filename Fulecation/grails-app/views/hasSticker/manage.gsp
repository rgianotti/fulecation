<%@page import="fulecation.*" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" /> 
        <title>User Login</title>
    </head>
    <body>
        <div class="body">
            <div class="nav" role="navigation">
                <ul>
                    <%
                        session.stickers = []
                        def i
                        for(i = 1; i < HasSticker.album_sections.size; i++)
                        {
                            def temp = "[collection: '" + Integer.toString(i) + "']";
                            %>
                            <li><g:link class="stickerNavButton" action="manage" params="[collection: i]">${ HasSticker.album_sections[i] }</g:link></li>
                            <%
                        }
                    %>
                    <li><g:link class="stickerNavButton" action="manage" params="[collection: 0]">${ HasSticker.album_sections[0] }</g:link></li>
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
                        java.lang.Object hs = HasSticker.findWhere(onwer: session.user, stickerNumber: j)
                        if(!hs)
                            hs = new HasSticker(onwer: session.user, stickerNumber: j, hasExtra: false, hasShiny: false)
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
                                <g:checkBox name="hasExtra${hs?.stickerNumber}" value="${hs?.hasExtra}"/>
                            </td>
                            <td valign='top' width="10%">
                                <g:checkBox name="hasShiny${hs?.stickerNumber}" value="${hs?.hasShiny}"/>
                            </td>
                    </tr>
                <%
                    }
                %>
                </tbody>
                </table> 
                </div>
                <div class="buttons">
                    <g:submitButton name="atualizar" value="Atualizar" />
                </div>
            </g:form>
            </div>
        </body>
    </html>
