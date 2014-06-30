package fulecation

class UserController extends AuthController {
    
    def beforeInterceptor = [action:this.&checkUser,except: ['login','doLogin', 'create', 'doCreate']]
    
    //def scaffold = true

    def login = { 
    }

    def doLogin = {
        //session = new HTTPSession
        def user = User.FindUser(params['email'], params['password'])
        //session.invalidate()
        //request.session
        session.setAttribute("user", user)
        //session.user = user
        if (user)
        {
            if(session.reduri)
            {
                String reduri = session.getAttribute("reduri")
                session.setAttribute("reduri", null)
                //session.reduri = null
               
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
        //if(session.invalidated)
        //{
        //    redirect(uri: "")
        //    return
        //}
        session.setAttribute("user", null)
        //session.invalidate()
        if(session.getAttribute("reduri"))
        {
            String reduri = session.getAttribute("reduri")
            session.setAttribute("reduri", null)
               
            redirect(uri: reduri)
        }
        else
        {
            redirect(uri: "")
        }
    }
    
    def create = { 
    }

    def doCreate = {
        if(params['password'] != params['confirmpassword'])
        {
            redirect(controller:'user',action:'create')
        }
        def user = User.AddNewUser(params['username'], params['email'], params['password'], params['bairro'], params['cidade'], params['estado'], params['onlyShiny'] != null)
        if(!user)
        {
             redirect(controller:'user',action:'create')
        }
        else {
            redirect(uri:"")
        }
    }
    
    def info = { 
    }
    
    def list = {
    }
}
