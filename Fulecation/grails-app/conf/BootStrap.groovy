import fulecation.*

class BootStrap {

    def init = { servletContext ->
        def raphael = User.AddNewUser("Raphael", "a@a.com", "123456789", "test", "test", "test", true)
        User.AddNewUser("Rapha", "Rapha@a.com", "123456789", "test", "test", "test", true)
        def john = User.AddNewUser("John", "John@a.com", "123456789", "test", "test", "test", false)
        def mike = User.AddNewUser("Mike", "Mike@a.com", "123456789", "test", "duude", "test", true)
        User.AddNewUser("Andrew", "Andrew@a.com", "123456789", "test", "test", "test", true)
        def bob = User.AddNewUser("Bob", "Bob@a.com", "123456789", "test", "test", "youl", true)
        
        HasSticker.AddOrUpdate(john, true, true, 4)
        HasSticker.AddOrUpdate(mike, true, false, 4)
        HasSticker.AddOrUpdate(john, true, false, 5)
        HasSticker.AddOrUpdate(bob, true, true, 5)
        new Contact(userA: raphael, userB: john, approved: true).save()
        new Contact(userA: john, userB: raphael, approved: true).save()
        new Contact(userA: raphael, userB: bob, approved: false).save()
        new Contact(userA: bob, userB: raphael, approved: false).save()
    }
    def destroy = {
    }
}
