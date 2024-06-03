import Foundation
// Créez une fonction qui prend une chaîne ch et un nombre n en paramètre et qui répète chaque caractère dans une chaîne n fois.
func repeatchars(_ ch : String, _ n : Int) -> String{
    return ch.reduce(""){$0 + String(repeating :$1,count:n)}
}
print(repeatchars("abc",3))
// Créez une fonction qui prend une chaîne et renvoie le nombre de voyelles qu’elle contient.
func nbVoyelles(_ ch : String) -> Int{
    return ch.filter{"aieouy".contains($0)}.count
}
print(nbVoyelles("maroc"))
// Ecrire une fonction partieEntiere(x) qui retourne la partie entière d’un nombre positif
func partieEntiere(_ x : Double) -> Int {
    var i = 0
    while i <= Int(x) {
        i += 1
    }
    return i - 1
}
print(partieEntiere(12.654))

// Classe Film : 

class Film{
    //  •Propriétés :  titre, réalisateur, durée, genre
    var titre : String
    var realisateur : String
    var duree : Int
    var genre : String
    init(titre : String, realisateur: String, duree : Int, genre : String){
        self.titre = titre
        self.realisateur = realisateur
        self.duree = duree
        self.genre = genre
    }
    // •Méthode description() : Retourne une chaîne de caractères qui décrit le film
    func description() -> String {
        return "titre : \(titre)\nréalisateur : \(realisateur)\ndurée : \(duree)\ngenre \(genre)"
    }
}

// Classe Séance : 
class Seance{
    // • Propriétés :  numéro (auto), film, heure, salle
    static var cmp = 0
    var num : Int
    var film : Film
    var heure : Date
    var salle : String
    // • Initialiseur(constructeur) :  avec toutes les propriétés
    init(film : Film, heure : Date, salle : String){
        Seance.cmp += 1
        self.num = Seance.cmp
        self.film = film
        self.heure = heure
        self.salle = salle
    }
}

// Classe GestionCinéma:
class GestionCinéma{
    // • Propriétés :  séances, films ([String : Film])
    var seances : [Seance] = []
    var films : [String:Film] = [:]
    // • Méthode programmerSéance(séance) : Ajoute une nouvelle séance au système.
    func programmerSéance(seance : Seance){
        seances.append(seance)
    }
    // • ajouterFilmAuCinéma(film) : Ajoute un nouveau film au système.
    func ajouterFilmAuCinema(film:Film){
        films[film.titre] = film
    }
    // • afficherProgramme() : Affiche toutes les séances programmées avec les détails des films.
    func afficherProgramme() {
        for seance in seances {
            print("film : \(seance.film.titre) heure : \(seance.heure) salle : \(seance.salle)")
        }
    }
    // • Méthode LongestFilmsByGender() : qui retourne un dictionnaire [String:String] pour clé genre de films et la clé le nom du film le plus long
    func LongestFilmsByGender() -> [String:String]{
        var s : [String:String] = [:]
        for genre in Set(films.values.map{$0.genre}) {
            s[genre] = films.values.filter{$0.genre == genre}.sorted{$0.duree > $1.duree}[0].titre
        }
        return s
    }
}
