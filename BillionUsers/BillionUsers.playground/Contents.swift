import UIKit

let max_num_users = 1000000000

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

struct GrowthRates {
    let rates: [Double]
}

private extension GrowthRates {
    func daysUntilBillionUsers() -> Int {
        grow(rate: rates, maxUsers: max_num_users)
    }
}

// These are the tests we use to determine if the solution is correct.
// You can add your own at the bottom, but they are otherwise not editable!

var testCaseNumber = 1

private func check(_ expectedValue: Int, matches output: Int) {
    let rightTick = "\u{2713}"
    let wrongTick = "\u{2717}"
    
    let result = expectedValue == output
    if result {
        print("\(rightTick) Test #\(testCaseNumber)")
    } else {
        print("\(wrongTick) Test #\(testCaseNumber) Expected: \(expectedValue) Your output: \(output)")
    }
    testCaseNumber += 1
}

let rates1 = GrowthRates(rates: [1.1, 1.2, 1.3])
check(79, matches: rates1.daysUntilBillionUsers())

let rates2 = GrowthRates(rates: [1.01, 1.02])
check(1047, matches: rates2.daysUntilBillionUsers())

// Add your own test cases here
let rates3 = GrowthRates(rates: [1.28, 1.28, 1.28])
check(80, matches: rates3.daysUntilBillionUsers())



