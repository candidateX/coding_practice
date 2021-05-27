import UIKit

typealias IndexValue = (index: Int, value: Int)
struct SimpleQueue {

    var ivarray = [IndexValue]()
    
    var isEmpty: Bool {
        return ivarray.isEmpty
    }
    
    var peek: Int? {
        return ivarray.first?.value
    }
    
    init(array: [Int]) {
        for (index, item) in array.enumerated() {
            ivarray.append(IndexValue(index: index, value: item))
        }
    }
    
    mutating func push(_ item: IndexValue) {
        ivarray.append(item)
    }
    
    mutating func pop() -> IndexValue? {
        if !ivarray.isEmpty {
            return ivarray.removeFirst()
        } else {
            return nil
        }
    }
}


private extension Array where Element == Int {
  func findPositions(n: Int, x: Int) -> [Int] {
    var queue = SimpleQueue.init(array: self)
    var indexes = [Int]()
    var maxItt = 0
    
    
    while maxItt < x {
        var maxVal = IndexValue(index: -1, value: -1)
        let maxPop = Swift.min(x, queue.ivarray.count)
        var maxPopItt = 0
    
        while maxPopItt < maxPop {
        
            if var currentVal = queue.pop() {
                
                if maxVal.value == -1 {
                    maxVal = currentVal
                } else if maxVal.value < currentVal.value   {
                    
                    if maxVal.value > 0 {
                        maxVal.value -= 1
                    }
                    
                    queue.push(maxVal)

                    maxVal = currentVal
                    
                } else {
                    if currentVal.value > 0 {
                        currentVal.value -= 1
                    }
                    
                    queue.push(currentVal)
                }
            }
            
            maxPopItt += 1
        }
        
        print("maxVal: \(maxVal)")
        
        indexes.append(maxVal.index + 1)
        
        maxItt += 1
    }
   
    return indexes
  }
}





// These are the tests we use to determine if the solution is correct.
// You can add your own at the bottom, but they are otherwise not editable!

private var testCaseNumber = 1

private func check(_ expectedValue: [Int], matches output: [Int]) {
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

let arr1 = [1, 2, 2, 3, 4, 5]
let expected1 = [5, 6, 4, 3, 2]
let output1 = arr1.findPositions(n: 6, x: 5)
check(expected1, matches: output1)

let arr2 = [2, 4, 2, 4, 3, 1, 2, 2, 3, 4, 3, 4, 4]
let expected2 = [2, 5, 10, 13]
let output2 = arr2.findPositions(n: 13, x: 4)
check(expected2, matches: output2)


