func difMinMax(_ t : [Int]) -> Int{
    if t.isEmpty { return 0}
    return t.max()! - t.min()!
}
let t = [1,2,3,4,5]
print(difMinMax(t))
print(difMinMax([]))