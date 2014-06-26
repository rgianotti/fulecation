package fulecation

class AuthController {

    def beforeInterceptor = [action:this.&checkUser/*,except: ['index','list','show']*/]
    def checkUser() {
        if(!session.user) {
            session.reduri = request.forwardURI - request.contextPath;
            redirect(controller:'user',action:'login')
            return false
        }
    }
}

