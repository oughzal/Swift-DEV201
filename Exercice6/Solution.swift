var DA : [String:Double] = ["football":200, "basketball":250, "tennis":400]

func getPrixAct(act:String) -> Double?{
    return DA[act] // nil
}

func getPrixAct2(act:String) -> Double{
    if DA.keys.contains(act) {
       return DA[act]!
    }
    else{
        return 0
    } 
}
print(DA.keys)
print(DA.values)

func getPrixBetween(_ min:Double,_ max:Double) -> [String:Double]{
    var s :[String:Double] = [:]
    for (k,v) in DA{
        if v >= min && v <= max {
            s[k] = v
        }
    }
    return s
}


class Adherent{
    var numero : Int
    var nom : String
    var email : String
    var activities : [String] = []

    func inscrire(act:String){
        if activities.contains(act) == false && DA.key.contains(act) {
            activities.append(act)
        }

     }

    func mTotal()->Double{
        var total = 0
        for k in DA.keys where activities.contains(k) {
            total +=  DA[k]
        }
        return total
    }
    func mTotal2()->Double{
        var total
         = 0
        for act in activities{
            total 
            += DA[act]
        } 
        return total
    }

    fun mTotal3()->Double{
        return activities.reduce(0){total,e in total + DA[e]}
    }
}

var T = [1,2,3,4]

var S : [Int] = []
for e in T {
    S.append(e*2)
} 

S = T.map{e in e*2}

var adherents : [Adherent] = []

// ...

adherents.sort{e1,e2 in e1.email > e2.email}
adherents.sort{$0.email > $1.email}