import UIKit

extension String {
    func minLengthOfRearrangedSubstring(containing substring: String) -> Int {
       
        var subStringArray = Array(substring)
        let selfArray = Array(self)
        
        var indexes = [Character: Int]()
        for (index, c) in selfArray.enumerated() {
            if let subindex = subStringArray.firstIndex(of: c) {
                indexes[c] = index
                subStringArray.remove(at: subindex)
            }
        }
        
        if !indexes.isEmpty, subStringArray.isEmpty,
           let last = indexes.values.sorted().last,
           let first = indexes.values.sorted().first {
            return (last + 1) - first
        } else {
            return -1
        }
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

let s1 = "dcbefebce"
let t1 = "fd"
let output1 = s1.minLengthOfRearrangedSubstring(containing: t1)
check(5, matches: output1)

let s2 = "bfbeadbcbcbfeaaeefcddcccbbbfaaafdbebedddf"
let t2 = "cbccfafebccdccebdd"
let output2 = s2.minLengthOfRearrangedSubstring(containing: t2)
check(-1, matches: output2)

// Add your test cases here
let s3 = "bfbeadbcbcbfeaaeefcddcccbbbfaaafdbebedddf"
let t3 = "cacc"
let output3 = s3.minLengthOfRearrangedSubstring(containing: t3)
check(15, matches: output3)




