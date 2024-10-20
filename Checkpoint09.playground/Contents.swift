import Cocoa

extension Collection

func getNumber(from: [Int]?) -> Int { from?.randomElement() ?? Int.random(in: 1...100) }

print(getNumber(from: nil))
