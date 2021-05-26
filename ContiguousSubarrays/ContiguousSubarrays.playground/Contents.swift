import UIKit

var testCaseNumber = 1

check([1, 3, 1, 5, 1], matches: countSubarrays(arr: [3, 4, 1, 6, 2]))
check([3, 2, 1, 5, 1], matches: countSubarrays(arr: [3, 2, 1, 6, 2]))

func countSubarrays(arr: [Int]) -> [Int] {
    let count = arr.count
    var subs = Array(repeating: 0, count: arr.count)

    for (index,currentValue) in arr.enumerated() {
        
        for j in 0...currentValue {
            if index + j <= count - 1  {
                if currentValue >= arr[index + j] {
                    subs[index] = subs[index] + 1
                } else {
                    break
                }
            } else {
                break
            }
        }
        
        for j in 1...currentValue {
            if index - j >= 0  {
                if currentValue > arr[index - j] {
                    subs[index] = subs[index] + 1
                } else {
                    break
                }
            } else {
                break
            }
        }
    }
    
    return subs
}



private func check(_ expectedValue: [Int], matches output: [Int]) {
    let rightTick = "\u{2713}";
    let wrongTick = "\u{2717}";
    
    let result = expectedValue == output
    if result {
        print("\(rightTick) Test #\(testCaseNumber)\n")
    } else {
        print("\(wrongTick) Test #\(testCaseNumber) Expected: \(expectedValue) Your output: \(output)\n")
    }
    testCaseNumber += 1
}
