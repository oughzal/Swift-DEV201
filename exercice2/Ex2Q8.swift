func remplacer (_ t : [String],_ s1 : String, _ s2 : String) -> [String]{
    var s : [String] = []
    for i in t.indices {
        if t[i] == s1 {
            s.append(s2)
        }else {
            s.append(t[i])
        }
    }
    return s
}
func remplacer2(_ t : [String],_ s1 : String, _ s2 : String) -> [String]{
    return t.map{($0 == s1) ? s2 : $0}
}
let t = ["a","b","c","d","a","b","x"]
print(remplacer2(t,"a","z"))