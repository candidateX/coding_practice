//: A MapKit based Playground

import MapKit
import PlaygroundSupport


extension Character {
    static var captitalAsciiStart: Int {
        return Character("A").intValue
    }
    
    static var capitalAsciiEnd: Int {
        return Character("Z").intValue
    }
    
    static var capitalCount: Int {
        return capitalAsciiEnd - captitalAsciiStart + 1
    }
    
    static var lowerCaseAsciiStart: Int {
        return Character("a").intValue
    }
    
    static var lowerCaseAsciiEnd: Int {
        return Character("z").intValue
    }
    
    static var lowerCaseCount: Int {
        return lowerCaseAsciiEnd - lowerCaseAsciiStart + 1
    }
    
    static var numStart: Int {
        return Character("0").intValue
    }
    
    static var numEnd: Int {
        return Character("9").intValue
    }
    
    static var numberCount: Int {
        return numEnd - numStart + 1
    }
    
    fileprivate var intValue: Int {
        return Int(asciiValue!)
    }
    
    fileprivate init?(int: Int) {
        self.init(UnicodeScalar(int)!)
    }
    
    func cipher(_ factor: Int) -> Character {
        enum Characteristic {
            case lower(range: Int?, start: Int?), upper(range: Int?, start: Int?), number(range: Int?, start: Int?), none
            
            init(_ char: Character, isNegative: Bool) {
                
                if char.isNumber {
                    self = .number(range: Character.numberCount,
                                   start: !isNegative ? Character.numStart : Character.numEnd)
                } else if char.isUppercase {
                    self = .upper(range: Character.capitalCount,
                                  start: !isNegative ? Character.captitalAsciiStart : Character.capitalAsciiEnd)
                } else if char.isLowercase {
                   self = .lower(range: Character.lowerCaseCount,
                                 start: !isNegative ? Character.lowerCaseAsciiStart : Character.lowerCaseAsciiEnd)
                } else {
                    self = .none
                }
            }

        }
        
        func convert(s: Int, r: Int) -> Character {
            var offSet = (intValue + factor) - Int(s)
            //Get the modulus of total count in case out of range and add to range start.
            offSet = offSet % Int(r) + Int(s)
            return Character(int: offSet)!
        }
        
        let characteristic = Characteristic(self, isNegative: factor.isNegative)
        
        switch characteristic {

        case .lower(let range, let start), .upper(let range, let start), .number(let range, let start):
            return convert(s: start!, r: range!)
        case .none:
            return self
        }
        
    }
}

extension Int {
    fileprivate var isNegative: Bool {
        return self < 0
    }
}

extension String {
    func cipher(_ rotationFactor: Int) -> String {
        return String(compactMap({
            return $0.cipher(rotationFactor)
        }))
    }
}

struct RotationalCipher {
    let backing: String

    func cipher(withRotationFactor: Int) -> String {
        return backing.cipher(withRotationFactor)
    }
}

private var testCaseNumber = 1;
 
private extension String {
    var characterArray: String {
        return "[\"\(self)\"]"
    }
}

private extension RotationalCipher {
    static func check(_ expectedValue: String, against output: String) {
        let rightTick = "\u{2713}";
        let wrongTick = "\u{2717}";
    
        let result = expectedValue == output
        if result {
            print("\(rightTick) Test #\(testCaseNumber)")
        } else {
            print("\(wrongTick) Test #\(testCaseNumber) Expected: \(expectedValue.characterArray) Your output: \(output.characterArray)")
        }
        testCaseNumber += 1
    }
}

let input1 = "All-convoYs-9-be:Alert1."
let expected1 = "Epp-gsrzsCw-3-fi:Epivx5."
let output1 = RotationalCipher(backing: input1).cipher(withRotationFactor: 4)
RotationalCipher.check(expected1, against: output1)

let input2 = "abcdZXYzxy-999.@"
let expected2 = "stuvRPQrpq-999.@"
let output2 = RotationalCipher(backing: input2).cipher(withRotationFactor: 200)
RotationalCipher.check(expected2, against: output2)
