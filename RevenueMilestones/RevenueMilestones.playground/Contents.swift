import UIKit

func getMilestoneDays(_ revenues: [Int], _ milestones: [Int]) -> [Int] {
    var hits = [Int].init(repeating: 0, count: milestones.count)
    var milstonesMap = [Int: Int]()
    
    zip(milestones, Array(0...milestones.count)).forEach { milstonesMap[$0] = $1 }
    
    let milestones = milestones.sorted()
    
    var totalRevenue = 0
    var currentMileStone = 0
    for (index, revenue) in revenues.enumerated() {
        totalRevenue += revenue
        
        while currentMileStone < milestones.count && totalRevenue >= milestones[currentMileStone] {
            
            if let mindex = milstonesMap[milestones[currentMileStone]] {
                hits.remove(at: mindex)
                hits.insert( index + 1, at: mindex )
            }
            
            currentMileStone += 1
        }
        
    }
    return hits
}


// These are the tests we use to determine if the solution is correct.
// You can add your own at the bottom, but they are otherwise not editable!

var test_case_number = 1
func check(_ expected: [Int], _ output: [Int]) {
    var result = true
    if expected.count != output.count {
        result = false
    }
    for i in 0..<min(expected.count, output.count) {
        result = result && (expected[i] == output[i])
    }
    let rightTick = "\u{2713}"
    let wrongTick = "\u{2717}"
    if result {
        print("\(rightTick) Test #\(test_case_number)")
    } else {
        print("\(wrongTick) Test # \(test_case_number): Expected \(expected) Your output: \(output)")
    }
    test_case_number += 1
}

let revenues_1 = [100, 200, 300, 400, 500]
let milestones_1 = [300, 800, 1000, 1400]
let expected_1 = [2, 4, 4, 5]
let output_1 = getMilestoneDays(revenues_1, milestones_1)
check(expected_1, output_1)

let revenues_2 = [700, 800, 600, 400, 600, 700]
let milestones_2 = [3100, 2200, 800, 2100, 1000]
let expected_2 = [5, 4, 2, 3, 2]
let output_2 = getMilestoneDays(revenues_2, milestones_2)
check(expected_2, output_2)


