class BootStrap {

    def init = { servletContext ->
        User.AddNewUser("Raphael", "a@a.com", "123456789", "test", "test", "test")
    }
    def destroy = {
    }
}
