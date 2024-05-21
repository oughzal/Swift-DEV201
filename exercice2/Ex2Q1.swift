
func nombresPositifs(_ t : [Int]) -> [Int]{
    return t.filter{ e in e >= 0 }
}
func nombresPositifs2(_ t : [Int]) -> [Int]{
    var s : [Int] = []
    for e in t where e>=0 {
            s.append(e)
    }
    return s
}
print(nombresPositifs2([1,2,-5,3,-8,2]))