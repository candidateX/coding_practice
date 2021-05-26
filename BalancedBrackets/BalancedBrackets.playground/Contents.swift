import UIKit

struct ShackStack<Element> {
    private var items = [Element]()
    var isEmpty:Bool {
        items.isEmpty
    }
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

func isBalanced(s: String) -> Bool {
    return s.checkBalance()
}

private extension String {
    func checkBalance() -> Bool {
        let parseSymbols = [")":"(", "}":"{", "]":"["]
        let array = Array(self).map { String($0) }
        var stack = ShackStack<String>()
        
        for ch in array {
            if parseSymbols.keys.contains(ch) {
                if stack.isEmpty || stack.pop() != parseSymbols[ch]  {
                    return false;
                }
            } else if parseSymbols.values.contains(ch) {
                stack.push(ch);
            }
        }
        
        return stack.isEmpty
    }
}

// These are the tests we use to determine if the solution is correct.
// You can add your own at the bottom, but they are otherwise not editable!

var test_case_number = 1;
func check(expected: Bool, output: Bool) {
    let result = expected == output
    let rightTick = "\u{2713}"
    let wrongTick = "\u{2717}"
    if result {
        print("\(rightTick) Test #\(test_case_number)")
    } else {
        print("\(wrongTick) Test #\(test_case_number): Expected [\(expected)] Your output: [\(output)]")
    }
    test_case_number += 1
}

let s1 = "{[(])}"
check(expected: false, output: isBalanced(s: s1))

let s2 = "{{[[(())]]}}"
check(expected: true, output: isBalanced(s: s2))

// Add your own test cases here
let s3 = "}{{[[(())]]}}"
check(expected: false, output: isBalanced(s: s3))
let s4 = "{{[[[(()){}]]}}"
check(expected: false, output: isBalanced(s: s4))
