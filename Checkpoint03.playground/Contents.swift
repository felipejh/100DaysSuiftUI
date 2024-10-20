import Cocoa

for number in 1...100 {
    if number.isMultiple(of: 3) && number.isMultiple(of: 5) {
        print("number: FizzBuzz")
        continue
    }
    
    if number.isMultiple(of: 3) {
        print("number: Fizz")
        continue
    }
    
    if number.isMultiple(of: 5) {
        print("number: Buzz")
        continue
    }
    
    print("number: \(number)")
}
