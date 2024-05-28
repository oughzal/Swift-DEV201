struct Article{
    private var _nom : String
     var nom:String{
        get{
        return _nom
    }
    set{_nom = newValue}
    }
     
    private var prix:Double
    var prix:Double{
      get{
        return _prix
    }  
    set{_prix = newValue}
    }
    }

    init(nom:String,prix:Double){
        self.nom=nom
        self.prix=prix
    }
}
enum CommandeStatus{
    case EnAttente, Expediee, Livree
}
class Commande : Identifiable{
    var id : int = 0
    var articles : [String]=[]
    var address : String
    var status : CommandeStatus

    init(address:String){
        self.address=address
        self.id = UUID()
        self.status = CommandeStatus.EnAttente
        
    }
    func ajouterArticle(article:Article){
        article.append(article)
    }
    func retirerArticle( nomArticle:String){
        for i in articles.indices {
            if article[i].nom == nomArticle {
                articles.removeAt(i)
                return 
            } 
        }
    }
    func removeA(nomArticle:String){
        for e in article where e.nom == nomArticle {
            article.remove(e)
        }
    }
    func remove2(nom : String){
        let i = articles.firstIndex(where : $0.nom == nom) ?? -1
        if i != -1 {
            articles.removeAt(i)
        }
        
    }
    func calculTotal() -> Double{
        var total : Double = 0 
        for article in articles {
            total += article.prix
        }
        // return total 
        return articles.reduce(0){$0 + $1.prix}
        return articles.reduce(0){total,article in total + article.prix }
    }
    func mettreAJourStatus(status:CommandeStatus){
            self.status = status
    }

}

class GestionCommandes{
    var commandes : [Commande] = []

    func Ajouter(commande : Commande){
        commandes.append(commande)
    }
    func supprrimer(id: Int){
        let i = fistIndex(where : $0.id == id) ?? -1
        if i != -1 {
            commandes.removeAt(i)
        }
    }
}