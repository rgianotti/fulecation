package fulecation

class HasSticker {
    
    Long id
    Long version
    
    User onwer
    Boolean hasExtra
    Boolean hasShiny
    Integer stickerNumber
    
    static constraints = {
        onwer (unique: ['stickerNumber'])
    }
    
    static AddOrUpdate(User user, Boolean hasExtra, Boolean hasShiny, Integer stickerNumber)
    {
        def hasSticker = HasSticker.findWhere(onwer: user, stickerNumber: stickerNumber)
         
        if(!hasSticker)
        {
            hasSticker = new HasSticker(onwer: user, hasExtra: hasExtra, hasShiny: hasShiny, stickerNumber: stickerNumber)
        }
        
        hasSticker.save flush:true
    }
    
    static album_sections = [
            "Outras",
            "Brasil",
            "Croácia",
            "México",
            "Camarões",
            "Espanha",
            "Holanda",
            "Chile",
            "Austrália",
            "Colombia",
            "Grécia",
            "Costa do Marfim",
            "Japan",
            "Uruguai",
            "Costa Rica",
            "Inglaterra",
            "Itália",
            "Suíça",
            "Equador",
            "França",
            "Honduras",
            "Argentina",
            "Bósnia e Herzegovina",
            "Iran",
            "Nigéria",
            "Alemanha",
            "Portugal",
            "Gana",
            "EUA",
            "Bélgica",
            "Argélia",
            "Rússia",
            "Coréia do Sul",
        
        ]
        
        
    static GetCode(Integer nr)
    {
        if(nr <= 639)
        {
            return nr.toString();
        }
        else
        {
            def codes = ["J1", "J2", "J3", "J4", "L1", "L2", "L3", "L4", "W1"]
            
            return (codes[nr - 640]);
        }
    }
   
    static GetName(Integer nr)
    {
        if(nr < names.size)
            return names[nr]
        else
            return "Unknown"
    }
    
    static names = 
    [
        "Panini Special Sticker",
        "Fifa Fair Play",
        "Logo/1",
        "Logo/2"
    ]
}
