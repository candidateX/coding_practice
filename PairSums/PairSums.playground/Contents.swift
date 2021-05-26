import UIKit


func numberOfWays(arr: [Int], k: Int) -> Int {
    return arr.pairSums(k)
}

extension Array where Element == Int {
    func pairSums(_ k: Int) -> Int {
        var total = 0
        for (index, val) in enumerated() {
            var next = index + 1
            while next < count {
                print("Current: \(val + self[next])")
                if val + self[next] == k {
                    total += 1
                }
                next += 1
            }
        }
        return total
    }
}

// These are the tests we use to determine if the solution is correct.
// You can add your own at the bottom, but they are otherwise not editable!

var test_case_number = 1
func check(expected: Int, output: Int) {
    let result = expected == output
    let rightTick = "\u{2713}"
    let wrongTick = "\u{2717}"
    if result {
        print("\(rightTick) Test #\(test_case_number)")
    } else {
        print("\(wrongTick) Test # \(test_case_number): Expected [\(expected)] Your output: [\(output)]")
    }
    test_case_number += 1
}

// Call numberOfWays() with test cases here
let arr1 = [ 1, 2, 3, 4, 3]
let k1 = 6
check(expected: 2, output: numberOfWays(arr: arr1, k: k1))

let arr2 = [ 1, 5, 3, 3, 3]
let k2 = 6
check(expected: 4, output: numberOfWays(arr: arr2, k: k2))
