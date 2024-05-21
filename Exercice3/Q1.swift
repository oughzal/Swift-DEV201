class Voiture : CustomStringConvertible{ // référence
    var marque : String
    var model : String
    var annee : Int
    // initializer = contrusteur
    init(marque : String,model:String,annee : Int){
        self.marque = marque
        self.model = model
        self.annee = annee
    }
    var description : String {
        "maque : \(self.marque) \nmodel : \(model) \nannée : \(annee)"
    }
     func description2() -> String{
        return "maque : \(self.marque) \nmodel : \(model) \nannée : \(annee)"
    }
}
struct Voiture2{ // valeur
    var marque : String
    var model : String
    var annee : Int
    //initializer généré automatiquement
    func description() -> String{
        return "maque : \(self.marque) \nmodel : \(model) \nannée : \(annee)"
    }
}

var v1 : Voiture = Voiture(marque : "BMW",model:"X5",annee : 2020)
var v2 : Voiture = v1 // référence
v1.marque = "DACIA"
print(v2)
var v3 : Voiture2 = Voiture2(marque : "BMW",model:"X5",annee : 2020)
var v4 : Voiture2 = v3 // valeur
v3.marque = "DACIA"
print(v4.description())
