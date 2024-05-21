class Animal : CustomStringConvertible { // protocol : interface
    var nom : String
    var espece : String
    var age : Int
    var description : String {
        "nom : \(nom) ; espèce : \(espece) ; Age : \(age)"
    }
    // initialiseur
    init(nom : String, espece : String, age : String){
        self.nom = nom
        self.espece = espece
        self.age = age
    }
}