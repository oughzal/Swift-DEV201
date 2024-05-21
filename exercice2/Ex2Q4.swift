func toutPositif(_ t : [Int]) -> Bool{
    return t.filter{$0>=0}.count == t.count
}
func toutPositif2(_ t : [Int]) -> Bool{
    return t.allSatisfy{$0>=0}
}
func toutPositif3(_ t : [Int]) -> Bool{
    for e in t {
        if e < 0 {
            return false
        }
    }
    return true
}
print(toutPositif3([1,2,-3,4]))