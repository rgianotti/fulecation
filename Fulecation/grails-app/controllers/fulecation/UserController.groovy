package fulecation

class UserController {
    
    def scaffold = true

    def login = { 
    }

    def doLogin = {
        def user = User.FindUser(params['useremail'], params['password'])
        session.user = user
        if (user)
        {
            if(session.reduri)
            {
                String reduri = session.reduri
                session.reduri = null
               
                redirect(uri: reduri)
            }
            else
            {
                redirect(uri: "")
            }
        }
        else
        {
            redirect(controller:'user',action:'login')
        }
    }
    
    def logout = {
        session.user = null
        if(session.reduri)
        {
            String reduri = session.reduri
            session.reduri = null
               
            redirect(uri: reduri)
        }
        else
        {
            redirect(uri: "")
        }
    }
}
