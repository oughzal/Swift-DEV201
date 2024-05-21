func sup5(_ t : [String]) -> [String]{
    return t.filter{$0.count >= 5}
}

func sup5v2(_ t : [String]) -> [String]{
    var s : [String] = []
    for e in t where e.count >= 5 {
        s.append(e)
    }
    return s
}
let t = ["123","123345","abcdef","789"]
let s = sup5v2(t)
print(s)