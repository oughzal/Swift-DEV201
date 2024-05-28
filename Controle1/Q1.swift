/*
Q1. 1.	Écrivez une fonction qui prend une chaîne en paramètres et retourne un dictionnaire avec le comptage de chaque caractère apparaissant dans la chaîne
*/
import Foundation
func charCount(_ ch:String)->[Character:Int]{
    var s :[Character:Int] = [:]
    for c in Set(ch){
        s[c] = ch.filter{$0==c}.count
    }
    return s
}
print(charCount("Morocco"))