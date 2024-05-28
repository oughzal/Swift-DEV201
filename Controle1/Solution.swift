import Foundation
/*
Q1. 1.	Écrivez une fonction qui prend une chaîne en paramètres et retourne un dictionnaire avec le comptage de chaque caractère apparaissant dans la chaîne
*/
func charCount(_ ch:String)->[Character:Int]{
    var s :[Character:Int] = [:]
    for c in Set(ch){
        s[c] = ch.filter{$0==c}.count
    }
    return s
}
/**
2.	Écrivez une fonction qui prend une phrase en paramètre retourne le mot le plus long dans cette phrase
**/
func longestWord(_ ch:String)->String{
    return String(ch.split(separator:" ").sorted{$0.count > $1.count}[0])
}

/*
Structure Plat : 
•	Propriétés :  nom (String), prix (Double), ingrédients ([String]) 
•	Initialiseur(constructeur) :  avec toutes les propriétés
•	Méthode description() : Retourne une chaîne de caractères qui décrit le plat, incluant le nom, le prix et les ingrédients.
Q3. réer la structure plat
*/
struct Plat{
    var nom : String
    var prix : Double
    var ingredients :[String] = []
    func description()-> String {
        return "nom : \(nom)\nprix : \(prix)\nIngédients :\n \(ingredients.reduce(""){$0 + "- \($1)\n"})"

    }
    mutating func ajouterIngedient(_ ingredient:String){
        ingredients.append(ingredient)
    }
}

/*
Classe Commande : 
•	Propriétés :  numéro (auto), plats
•	Méthode ajouterPlat(plat) : Ajoute un plat à la commande.
•	Méthode calculerTotal() : Calcule le prix total de la commande.
Q4.	Créer la classe commande
*/
class Commande{
    // Propriétés :  numéro (auto), plats
    static var cmp : Int = 0
    var num : Int
    var plats : [Plat] : []

    init(){
        cmp +=1
        self.num = cmp
    }
    // Méthode ajouterPlat(plat) : Ajoute un plat à la commande.
    func ajouterPlat(plat:Plat){
        plats.append(plat)
    }
    // Méthode calculerTotal() : Calcule le prix total de la commande.
    func calculerTotal()->Double{
        return plats.reduce(0){$0 + $1.prix}
    }
}

/*
Classe GestionRestaurant :
•	Propriétés :  commandes, menu ([String:Plat])
•	Méthode ajouterCommande(commande) : Enregistre une nouvelle commande.
•	Méthode ajouterPlatAuMenu(plat) : Ajoute un nouveau plat au menu.
•	Méthode afficherMenu() : Affiche tous les plats disponibles.
•	Méthode afficherCommandes() : Affiche toutes les commandes avec leur total.
Q5.	Créer la classe GestionRestaurant
*/
class GestionRestaurant{
    // Propriétés :  commandes, menu ([String:Plat])
    var commandes : [Commande] = []
    var menu : [String:Plat] = [:]
    // Méthode ajouterCommande(commande) : Enregistre une nouvelle commande.
    func ajouterCommande(commande : Commande){
        commandes.append(commande)
    }
    // Méthode ajouterPlatAuMenu(plat) : Ajoute un nouveau plat au menu.
    func ajouterPlatAuMenu(plat : Plat){
        menu[plat.nom] = plat
    }
    // Méthode afficherMenu() : Affiche tous les plats disponibles.
    func afficherMenu(){
        print(menu.values.reduce(""){$0 + "\($1.nom) : \($1.prix)")
        
    }
    // Méthode afficherCommandes() : Affiche toutes les commandes avec leur total.
    func afficherCommandes() {
        print(commandes.reduce(""){$0 + "\($1.num) : \($1.calculerTotal())"})
    }

}