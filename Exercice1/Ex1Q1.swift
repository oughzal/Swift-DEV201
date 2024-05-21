// Q1
// x,y,z 
func permutation(x:inout Int,y:inout Int,z:inout Int){
    let t = x
    x = y
    y = z
    z = t
}
var a = 5
var b = 8
var c = 2
permutation(x: &a, y: &b, z: &c)
print("a :\(a) b :\(b) c: \(c)")