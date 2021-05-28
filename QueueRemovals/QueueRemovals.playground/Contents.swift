import UIKit

//Queue Removals
struct SimpleQueue {
    typealias IndexValue = (index: Int, value: Int)
    
    private var ivarray = [IndexValue]()
    
    var count: Int {
       return ivarray.count
    }
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
    func processPopped(popped: [SimpleQueue.IndexValue], completion: (Int) -> ()) -> [SimpleQueue.IndexValue] {
        var popped = popped.sorted(by: { $0.value <= $1.value })
        let last = popped.removeLast()
        completion(last.index + 1)
        popped.sort(by: { $0.index < $1.index })
        
        popped = popped.compactMap({
            var v = $0
            v.value = Swift.max(0, v.value - 1)
            return v
        })
        
        return popped
    }
    
    func findPositions(n: Int, x: Int) -> [Int] {
        var queue = SimpleQueue.init(array: self)
        var indexes = [Int]()
        var maxItt = 0
    
        while maxItt < x {
            var temp = [SimpleQueue.IndexValue]()
            let maxPop = Swift.min(x, queue.count)
            var maxPopItt = 0

            while maxPopItt < maxPop {
                guard let val = queue.pop() else { break }
                temp.append(val)
                maxPopItt += 1
            }
        
            processPopped(popped: temp, completion: { indexes.append($0) }).compactMap { queue.push($0) }
        
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
let expected1 = [5, 6, 4, 1, 2]
let output1 = arr1.findPositions(n: 6, x: 5)
check(expected1, matches: output1)

let arr2 = [2, 4, 2, 4, 3, 1, 2, 2, 3, 4, 3, 4, 4]
let expected2 = [2, 5, 10, 13]
let output2 = arr2.findPositions(n: 13, x: 4)
check(expected2, matches: output2)


