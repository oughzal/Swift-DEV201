
func estPalandrome(_ s : String) -> Bool{
    return s == String(s.reversed())
}
func estPalandrome2(_ s : String) -> Bool{
    let t = Array(s)
    var i = 0
    var j = s.count - 1
    while i < j  {
        if t[i] != t[j]{
            return false
        }
        i += 1
        j -= 1
    }
    return true
}
print(estPalandrome("LAVAL"))
print(estPalandrome2("LAVAL"))
print(estPalandrome("DEV"))