import Cocoa

enum ChangeGear {
    case up
    case down
}

enum ChangeGearError: Error {
    case lessThanOne
    case moreThanTen
}

struct Car {
    private let model: String
    private let numberOfSeats: Int
    private(set) var currentGear: Int = 1
    
    init(model: String, numberOfSeats: Int) {
        self.model = model
        self.numberOfSeats = numberOfSeats
    }
    
    mutating func changeGear(direction: ChangeGear) throws {
        if direction == .down {
            if currentGear == 1 {
                throw ChangeGearError.lessThanOne
            }
            
            currentGear -= 1
        } else if direction == .up {
            if currentGear == 10 {
                throw ChangeGearError.moreThanTen
            }
            
            currentGear += 1
        }
    }
}

var car1 = Car(model: "Civic", numberOfSeats: 4)
print(car1.currentGear)

do {
    try car1.changeGear(direction: .up)
    print(car1.currentGear)
    
    try car1.changeGear(direction: .down)
    print(car1.currentGear)
    
    try car1.changeGear(direction: .up)
    print(car1.currentGear)
    
    try car1.changeGear(direction: .up)
    print(car1.currentGear)
    
    try car1.changeGear(direction: .up)
    print(car1.currentGear)
    
    try car1.changeGear(direction: .up)
    print(car1.currentGear)
    
    try car1.changeGear(direction: .up)
    print(car1.currentGear)
    
    try car1.changeGear(direction: .up)
    print(car1.currentGear)
    
    try car1.changeGear(direction: .up)
    print(car1.currentGear)
    
    try car1.changeGear(direction: .up)
    print(car1.currentGear)
    
    try car1.changeGear(direction: .up)
    print(car1.currentGear)
    
    try car1.changeGear(direction: .up)
    print(car1.currentGear)
} catch {
    print(error)
}
