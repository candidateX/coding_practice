import UIKit

let root1 = Node(8,
                 left: Node(3,
                            left: Node(1),
                            right: Node(6,
                                        left: Node(4),
                                        right: Node(7))),
                 right: Node(10,
                             right: Node(14,
                                         left: Node(13))))

let root3 = Node(10,
                 left: Node(8,
                            left: Node(4,
                                       left: Node(100), right: Node(5,
                                                                    right: Node(6)))
                 ),
                 right: Node(15,
                             left: Node(14),
                             right: Node(16)))

let root2 = Node(10,
                 left: Node(8,
                            left: Node(4,
                                       right: Node(5,
                                                   right: Node(6)))),
                 right: Node(15,
                             left: Node(14),
                             right: Node(16)))


class Node {
    let data: Int
    let left: Node?
    let right: Node?
    
    static var count = 0
    
    init(_ data: Int, left: Node? = nil, right: Node? = nil) {
        self.data = data
        self.left = left
        self.right = right
    }
}

private extension Node {
    
    func visible(aNode: Node, count: Int = 0) -> Int {
        var count = count
        
        //Left node conditions
        if let l = aNode.left {
            print("L Value: \(l.data)")
            count = visible(aNode: l, count: count) + 1
        }
        
        //Right node conditions
        if let r = aNode.right, aNode.left == nil, r.left == nil {
            print("R Value: \(r.data)")
            count = visible(aNode: r, count: count) + 1
        } else if let r = aNode.right {
            count = visible(aNode: r, count: count)
        }
        
        return count
    }
    
    var visibleNodes: Int {
        return visible(aNode: self)
    }
}

var testCaseNumber = 1

private func check(_ expectedValue: Int, matches output: Int) {
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

check(4, matches: root1.visibleNodes)

check(5, matches: root2.visibleNodes)

// Test 3
//                          10
//                          /\
//                        8   15
//                        /   / \
//                      4    14  16
//                     /   \
//                   100     5
//                            \
//                              6

check(5, matches: root3.visibleNodes)

check(2, matches: root3.left!.left!.visibleNodes)
