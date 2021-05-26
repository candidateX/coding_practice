import UIKit


extension String {
    static func matchingPairs(s: String, t: String) -> Int {
        var s = s
        var bag = [Character: Int]()
        var count = 0
        var didSwap = false
        for (index,char) in s.enumerated() {
            if let prevIndex = bag[char] {
                var data = Array(s)
                data.swapAt(prevIndex, index)
                s = String(data)
                didSwap = true
            } else if char != t.charAt(index: index) {
                bag[t.charAt(index: index)] = index
            }
              
        }
        
        if !didSwap {
            var data = Array(s)
            data.swapAt(0, 1)
            s = String(data)
        }
        
        for (index,char) in s.enumerated() {
            if char == t.charAt(index: index) {
                count += 1
            }
        }
        
        //print("S: \(s)")
        //print("T: \(t)")
        return count
    }
    
    func charAt(index: Int) -> Character {
        let charIndex = self.index(startIndex, offsetBy: index)
        return self[charIndex]
    }
    
}


func matchingPairs(s: String, t: String) -> Int {
    // Write your code here
    return String.matchingPairs(s: s, t: t)
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

let s1 = "abcde"
let t1 = "adcbe"
let expected1 = 5
let output1 = matchingPairs(s: s1, t: t1)
check(expected: expected1, output: output1)

let s2 = "abcd"
let t2 = "abcd"
let expected2 = 2
let output2 = matchingPairs(s: s2, t: t2)
check(expected: expected2, output: output2)
    

