package fulecation

class UserController extends AuthController {
    
    def beforeInterceptor = [action:this.&checkUser,except: ['login','doLogin', 'create', 'doCreate', 'confirm_created']]
    
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
            redirect(controller:'user',action:'login', params:[error:'E-mail e/ou senha errados.'])
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
        }
        else 
        {
            def user = User.AddNewUser(params['username'], params['email'], params['password'], params['bairro'], params['cidade'], params['estado'], params['onlyShiny'] != null)
            if(!user || user.hasErrors())
            {
                 redirect(controller:'user',action:'create', params:[error:'Falha ao tentar cadastrar o usuário, o nome ou e-mail podem já estar em uso.'])
            }
            else {
                redirect(controller:'user',action:'confirm_created', params:[user:params['username']])
            }
        }
    }
    
    def list = {
    }
    
    def profile = {
        
    }
    
    def doRequest = {
        if(!params['user'])
        {
            redirect(controller:'user', action:'list')
        }
        else
        {
            def user = User.findWhere(username: params['user'])
            if(!user)
            {
                redirect(controller:'user', action:'list')
            }
            else
            {
                def contAB = Contact.findWhere(userA:user, userB:session.user)
                if(!contAB)
                {
                    contAB = new Contact(userA:user, userB:session.user, approved:true)
                }
                
                def contBA = Contact.findWhere(userA:session.user, userB:user)
                if(!contBA)
                {
                    contBA = new Contact(userA:session.user, userB:user, approved:false)
                }
                
                contAB.save flush:true
                contBA.save flush:true
                
                user.pendingRequests = Contact.findAllWhere(userB:user, approved:false).size
                session.user.pendingRequests = Contact.findAllWhere(userB:session.user, approved:false).size
                
                user.save flush:true
                session.user = session.user.merge()
                session.user.save flush:true
                
                redirect(controller:'user', action:'contacts')
            }
        }
    }
    
    def contacts = {
    }
    
    def doAccept = {
        if(!params['user'])
        {
            redirect(controller:'user', action:'contacts')
        }
        else
        {
            def user = User.findWhere(username:params['user'])
            if(!user)
            {
                redirect(controller:'user', action:'contacts')
            }
            else
            {
                def contAB = Contact.findWhere(userA:user, userB:session.user)

                def contBA = Contact.findWhere(userA:session.user, userB:user)

                if(!contBA || !contAB)
                {
                    redirect(controller:'user', action:'contacts')
                }
                else
                {
                    contAB.approved = true;
                    //contBA.approved = true;
                    contAB.save flush:true
                    contBA.save flush:true

                    user.pendingRequests = Contact.findAllWhere(userB:user, approved:false).size
                    session.user.pendingRequests = Contact.findAllWhere(userB:session.user, approved:false).size

                    user.save flush:true
                    session.user = session.user.merge()
                    session.user.save flush:true

                    redirect(controller:'user', action:'contacts')
                }
            }
        }
    }
    
    def doDelete = {
        if(!params['user'])
        {
            redirect(controller:'user', action:'contacts')
        }
        else
        {
            def user = User.findWhere(username:params['user'])
            if(!user)
            {
                redirect(controller:'user', action:'contacts')
            }
            else
            {
                def contAB = Contact.findWhere(userA:user, userB:session.user)

                def contBA = Contact.findWhere(userA:session.user, userB:user)
                if(!contBA || !contAB)
                {
                    redirect(controller:'user', action:'contacts')
                }
                else
                {
                    contAB.approved = false;
                    contBA.approved = false;
                    contAB.delete flush:true
                    contBA.delete flush:true

                    user.pendingRequests = Contact.findAllWhere(userB:user, approved:false).size
                    session.user.pendingRequests = Contact.findAllWhere(userB:session.user, approved:false).size

                    user.save flush:true
                    session.user = session.user.merge()
                    session.user.save flush:true

                    redirect(controller:'user', action:'contacts')
                }
            }
        }
    }
    
    def confirm_created = {
        
    }
}
