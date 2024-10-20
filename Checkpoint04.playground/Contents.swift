import Cocoa

enum SquareRootError: Error {
    case outOfBounds
    case noRoot
}

func getSquareRoot(of number: Int) throws -> Int {
    if number < 1 || number > 10_000 { throw SquareRootError.outOfBounds }
    
    var squareRoot: Int?
    for i in 1...number {
        if i * i == number {
            squareRoot = i
            break
        }
    }
    
    if squareRoot != nil {
        return squareRoot ?? 0
    } else {
        throw SquareRootError.noRoot
    }
}

do {
    let square = try getSquareRoot(of: 10001)
    print("The square root is: \(square)")
} catch SquareRootError.outOfBounds {
    print("Out of bounds")
} catch SquareRootError.noRoot {
    print("No root for that number")
} catch {
    print("Error: \(error.localizedDescription)")
}
