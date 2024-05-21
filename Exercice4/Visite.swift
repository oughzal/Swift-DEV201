class Visite : CustomStringConvertible{
    var date : Date
    var animal : Animal
    var veterinaire : Veterinaire
    var description : String { // toString()
        "date : \(date) ; animal : \(animal) ; vétérinaire : \(veterinaire.description())"
    } 
    init(date : Date, animal : Animal, veterinaire : Veterinaire){
        self.date = date
        self.animal = animal
        self.veterinaire = veterinaire
    }

    func description2() -> String {
        return "date : \(date) ; animal : \(animal) ; vétérinaire : \(veterinaire.description())"
    }

}