import Foundation
// classe Auteur
class Auteur : CustomStringConvertible{
    var nom : String
    var nationalitie :String 
    var description: String{
        "nom : \(nom),nationalitie : \(nationalitie)"
    }
    init( nom : String , nationalitie: String ){
        self.nom=nom
        self.nationalitie=nationalitie

    }

    func description2()-> String{
           return "nom : \(nom),nationalitie : \(nationalitie)"
    }
}  

// Livre
class Livre : CustomStringConvertible{ // protocole = interface
    var titre : String
    var auteur : Auteur
    var annee : Int
    // toString
    var description : String {
        "titre : \(titre); auteur : \(auteur) ; annee : \(annee)" // f"{x}"
    }
    // initialiseur
    init(titre : String,auteur : Auteur,annee : Int){
        self.titre = titre
        self.auteur = auteur
        self.annee = annee
    }

    func description2() -> String {
        return "titre : \(titre); auteur : \(auteur) ; annee : \(annee)"
    }
}

// class Prêt
class Pret : CustomStringConvertible{
    var date : Date
    var livre : Livre
    var dateRetour : Date
    var description : String {
        "Date : \(date), Livre : \(livre), Date de Retour : \(dateRetour)"
    }
    init(date : Date, livre : Livre, dateRetour : Date) {
        self.date = date
        self.livre = livre
        self.dateRetour = dateRetour
    }
    init(livre :Livre ){
        self.date = Date() // now
        let calendar = Calendar.current
        self.dateRetour = calendar.date(byAdding : .day , value : 7 , to : date) ?? Date()
        self.livre = livre
    }
}
