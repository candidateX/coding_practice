import UIKit

var str = "Hello, playground"

let max_num_users = 1000000000

print("Growth: \(grow(rate: Array(repeating: 1.21, count: 1001), maxUsers: max_num_users))")


func grow(rate: [Double], maxUsers: Int) -> Int {
    guard rate.count > 0 && rate.count <= 1000 else { print("1 <= rate <= 1,000"); return 0 }
    guard rate.first! > 1.0 && rate.last! < 2.0 else { print("1.0 < growthRate < 2.0 for all growth rates"); return 0 }
    
    var result = [TotalGrowth]()
    var total = 0
    var days = 0
    var tg: TotalGrowth = (0,0)
    
    while total < maxUsers {
        total = 0
        days += 1
        result.removeAll()
        
        for i in rate {
            tg = growth(days: days, factor: i)
            total += tg.current
            result.append(tg)
        }
    }
    
    print("Total: \(total)")
    print("Results: \(result)")
    return tg.days
}

typealias TotalGrowth = (current: Int, days: Int)
func growth(days: Int = 0, factor: Double) -> TotalGrowth {
    guard factor > 1.0 && factor < 2.0 else { return (current: 0, days: 0) }
    
    let totalUsers = Int(pow(Float(factor), Float(days)))
    
    let total: TotalGrowth = (current: totalUsers, days: days)
    
    return total
}
