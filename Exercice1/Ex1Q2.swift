func somme(n : Int)-> Int{
    var s = 0
    for i in 1...n {
        s += i
    }
    return s
}
func somme2(_ n : Int) -> Int {
    let numbers = Array(1...n)
    return numbers.reduce(0){s,i in s + i}
}
print(somme(n : 5))
print(somme2(5))