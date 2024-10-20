import Cocoa

protocol Building {
    var numRooms: Int { get set }
    var value: Int { get }
    var estateAgent: String { get }
    func summary()
}

struct House: Building {
    var numRooms: Int
    let value: Int
    let estateAgent: String
    
    func summary() {
        print("The agent \(estateAgent) is seeling a house with \(numRooms) rooms for \(value) dollars.")
    }
}

struct Office: Building {
    var numRooms: Int
    let value: Int
    let estateAgent: String
    
    func summary() {
        print("The agent \(estateAgent) is seeling an office with \(numRooms) rooms for \(value) dollars.")
    }
}

var house = House(numRooms: 3, value: 300000, estateAgent: "Felipe")
house.numRooms = 6
let office = Office(numRooms: 2, value: 100000, estateAgent: "Juliana")
house.summary()
office.summary()
