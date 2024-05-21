class Vetertinaire {
    var nom : String
    var specialite : String

    init(nom : String, specialite : String){
        self.nom = nom 
        self.specialite = specialite
    }

    func description() -> String {
        return "nom : \(nom) ; spécialité : \(specialite)"
    }
}