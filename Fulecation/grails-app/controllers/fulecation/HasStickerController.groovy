package fulecation

class HasStickerController extends AuthController{

    
    static scaffold = true
    def manage = {
    }
    
    def doManage(ArrayList stickers) {
        if(null != session.stickers)
        {
           
            for(int i = 0; i < session.stickers .size; i++)
            {
                session.stickers[i].hasExtra = (params['hasExtra' + session.stickers[i].stickerNumber.toString()] != null)
                session.stickers[i].hasShiny = (params['hasShiny' + session.stickers[i].stickerNumber.toString()] != null)
                session.stickers[i].save flush:true
            }
            session.stickers = null
            
            redirect(controller:'HasSticker',action:'manage')
        }
        else
            redirect(uri: "")
    }
}
