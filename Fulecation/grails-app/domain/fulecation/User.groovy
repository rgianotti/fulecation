package fulecation

import java.security.MessageDigest
import org.apache.commons.codec.binary.Hex

class User {
    Long id
    Long version
    String username
    String email
    String password
    
    //Endereco
    String bairro
    String cidade
    String estado
    
    static constraints =
    {
        username (nullable: false, blank: false, unique: true)
        email (nullable: false, blank: false, unique: true, email: true)
        password (blank:false, password:true, nullable: false, display: false, editable: false)
        bairro (blank: true)
        cidade (blank: true)
        estado (blank: true)
    }
    
    static AddNewUser(String username, String  email, String password, String bairro, String cidade, String estado)
    {
        MessageDigest sha256 = MessageDigest.getInstance("SHA-256");        
        byte[] passBytes = (password + "this_is_just_a_random_salt").getBytes();
        byte[] passHash = sha256.digest(passBytes);
        passHash.toString();
        new User(email:email,password:Hex.encodeHexString( passHash ), username:username, bairro:bairro, cidade:cidade, estado:estado).save()
    }
    
    static FindUser(String email, String password)
    {
        MessageDigest sha256 = MessageDigest.getInstance("SHA-256");        
        byte[] passBytes = (password + "this_is_just_a_random_salt").getBytes();
        byte[] passHash = sha256.digest(passBytes);
        passHash.toString();
        
        def user = User.findWhere(email:email,
            password:Hex.encodeHexString( passHash ))
        
        return user
    }
}
