package fulecation

class Contact {
    User userA;
    User userB;
    Boolean approved;
    static constraints = {
        userA (unique: ['userB'])
    }
}
