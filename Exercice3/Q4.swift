class Person{
    var firstname : String
    var lastname : String
    init(fn : String, ln : String){
        self.fistname = fn
        lastname = fn
    }
    func description() -> String {
        return "nom : \(lastname) ; prénom : \(firstname)"
    }
}

class Etudiant : Person {
    var num : Int
    var cours : [String] = []

    override func description() -> String {
        return super.description() + " ; num : \(num) ; cours : \(cours)"
    }
}