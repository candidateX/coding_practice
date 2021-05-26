
struct Encrypt {
    var string: String
    
    typealias EncryptPieces = (middle: String, left: String, right: String)
    func encryptWords() -> String {
        guard string.count > 2 else { return string }
        
        return findEncryptedWords(s: string)
    }

    private func assemble(pieces: EncryptPieces) -> String {
        var returnStr = ""
        returnStr.append(pieces.middle)
        returnStr.append(pieces.left)
        returnStr.append(pieces.right)
        return returnStr
    }
    
    private func findEncryptedWords(s: String) -> String {
        guard s.count > 2 else { return s }
        let strLength = s.count
        //Get middle
        let isEven = strLength % 2 == 0
        var middleCharLocation = 0
        
        if isEven {
            middleCharLocation = strLength/2 - 1
        } else {
            middleCharLocation = ((strLength - 1) / 2)
        }
        
        let middleChar = String(s[middleCharLocation])
        
        let charArray = Array(s)
        let first = charArray[0..<middleCharLocation]
        let second = charArray[(middleCharLocation + 1)..<strLength]
        let split = [String(first), String(second)]
        
        let pieces = EncryptPieces(middle: middleChar, left: findEncryptedWords(s: split.first ?? ""), right: split.count > 1 ? findEncryptedWords(s: split.last ?? "") : "")
        

        return assemble(pieces: pieces)
    }
}

private extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}

func findEncryptedWord(s: String) -> String {
  // Write your code here
  return Encrypt(string: s).encryptWords()

}


// These are the tests we use to determine if the solution is correct.
// You can add your own at the bottom, but they are otherwise not editable!

var test_case_number = 1
func check(expected: String, output: String) {
  let result = expected == output
  let rightTick = "\u{2713}"
  let wrongTick = "\u{2717}"
  if result {
      print("\(rightTick) Test #\(test_case_number)")
  } else {
      print("\(wrongTick) Test # \(test_case_number): Expected \(expected) Your output: \(output)")
  }
  test_case_number += 1
}

let s1 = "abc"
let expected1 = "bac"
let output1 = findEncryptedWord(s: s1)
check(expected: expected1, output: output1)

let s2 = "abcd"
let expected2 = "bacd"
let output2 = findEncryptedWord(s: s2)
check(expected: expected2, output: output2)

// Add your own test cases here
let s3 = "abcxcba"
let expected3 = "xbacbca"
let output3 = findEncryptedWord(s: s3)
check(expected: expected3, output: output3)

let s4 = "facebook"
let expected4 = "eafcobok"
let output4 = findEncryptedWord(s: s4)
check(expected: expected4, output: output4)



