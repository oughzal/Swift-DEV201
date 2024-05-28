/**
2.	Écrivez une fonction qui prend une phrase en paramètre retourne le mot le plus long dans cette phrase
**/
func longestWord(_ ch:String)->String{
    return String(ch.split(separator:" ").sorted{$0.count > $1.count}[0])
}
print(longestWord("un deux abcd devoam201 dix"))