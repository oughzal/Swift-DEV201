struct CompteBancaire{
    var titulaire : String
    var num : String
    var sold : Double
    init(titulaire : String,num: String, sold : Double){
        self.titulaire = titulaire
        self.num = num
        self.sold = sold
    }

    func diposer(montant : Double){
        if montant > 0 {
            sold += montant
        }
    }

    func retirer(montant : Double){
        if montant <= sold{
            sold -= montant
        }   
    }

    func soldActuel() -> Double {
        return sold
    }
}