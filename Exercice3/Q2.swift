class Livre{
    static var id : Int = 0
    var title : String
    init(title : String){
        Livre.id += 1
        self.id = Livre.id
        self.title = title
    }
    }
class Bibliotheque{
    var livres : [Int:Livre] = [:]

    func ajouter(livre:Livre){
        livres[livre.id] = livre
    }

    func supprimer(id:Int){
        if livres.keys.contains(id){
            livres[id] = nil
        }
    }

    func rechercher(title:String) -> [Int:Livre]{
        var s : [Int:Livre] = [:]
        for (k,v) in livres {
            if v.title.contains(title) {
                s[v.id] = v
            }
        }
        return s
    }
}