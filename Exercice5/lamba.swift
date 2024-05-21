// lamba , anonyme , coluses
import Foundation
var lambda : (Int,Int)-> Int = {(a,b) in a+b}

let x = lambda(1,2)
print(x)

// heigh order fonction
func myHOfun(x:Int,y:Int, f: (Int,Int)->Int)->Int{
    return f(x,y)
}

extension Array{
    func myFilter(f:(Element)->Bool)->[Element]{
        var s : [Element] = []
        for e in self {
            if f(e) == true {
                s.append(e)
            }
        }
        return s
    }
}
 func myfun(e:Int)->Bool{
    return e % 2 == 0
 }
let T : [Int] = Array(1...20)
let s = T.myFilter(f:myfun) // trailing
print(s)