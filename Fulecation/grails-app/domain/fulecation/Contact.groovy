package fulecation

class Contact {
    User userA;
    User userB;
    Boolean approved;
    static constraints = {
        userA (unique: ['userB'])
    }
    
    def countPending(User user) {
        return Contacts.findAllWhere(userB:user, approved:false);
    }
}
