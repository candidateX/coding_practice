import UIKit

var str = "Hello, playground"

let revenues_1 = [100, 200, 300, 400, 500]
let milestones_1 = [300, 800, 1000, 1400]

let revenues_2 = [700, 800, 600, 400, 600, 700]
let milestones_2 = [3100, 2200, 800, 2100, 1000]

let revenues_3 = [Int]()
let milestones_3 = [Int]()

print("Hits: \(getMilestoneDays(revenues_1, milestones_1 ))")

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


