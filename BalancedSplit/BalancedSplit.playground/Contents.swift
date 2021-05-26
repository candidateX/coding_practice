import UIKit

var str = "Hello, playground"

let arr1 = [2, 1, 5, 2]
let arr2 = [3, 6, 3, 4, 4]
let arr3 = [4,2,3,1,5,5]
let arr4 = [1,3,2,3,1,2,2,4,5,5]
let arr5 = [1,3,2,3,1,2,1,3,5,5]

//print("Balanced: \(arr3.hasBalancedSplit)")
print("Balanced: \(arr4.hasBalancedSplit)")
//print("Balanced: \(arr5.hasBalancedSplit)")

private extension Array where Element == Int {
    var hasBalancedSplit: Bool {
        let a = sorted()
        
        var maxIndex = a.count - 1
        var minIndexSum = 0
        var maxIndexSum = 0
        for (index, val) in a.enumerated() {
            minIndexSum += val

            print("minIndexSum: \(minIndexSum)")
            
            if maxIndexSum < minIndexSum {
                maxIndexSum = maxIndexSum + a[maxIndex]
                print("maxIndexSum: \(maxIndexSum)")
                maxIndex -= 1
            }
            
            if minIndexSum == maxIndexSum, index == maxIndex, a[index] < a[maxIndex + 1] {
                print("Balanced! minIndexSum: \(minIndexSum) maxIndexSum: \(maxIndexSum)")
                return true
            }
        }
        
        return false
    }
}

// These are the tests we use to determine if the solution is correct.
// You can add your own at the bottom, but they are otherwise not editable!

var testCaseNumber = 1

private func check(_ expectedValue: Bool, matches output: Bool) {
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


check(true, matches: arr1.hasBalancedSplit)

check(false, matches: arr2.hasBalancedSplit)

check(true, matches: arr3.hasBalancedSplit)

check(true, matches: arr4.hasBalancedSplit)

check(false, matches: arr5.hasBalancedSplit)
