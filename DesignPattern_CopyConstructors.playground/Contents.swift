import Foundation

protocol Copying {
    init(copyFrom other: Self)
}

class Address: CustomStringConvertible, Copying {
    var streetAddress: String
    var city: String
    
    init(_ streetAddress: String, _ city: String) {
        self.streetAddress = streetAddress
        self.city = city
    }
    
    required init(copyFrom other: Address) {
        streetAddress = other.streetAddress
        city = other.city
    }
    
    var description: String {
        return "\(streetAddress), \(city)"
    }
}

struct Employee: CustomStringConvertible, Copying {
    var name: String
    var address: Address
    
    init(_ name: String, _ address: Address) {
        self.name = name
        self.address = address
    }
    
    init(copyFrom other: Employee) {
        name = other.name
        address = Address(copyFrom: other.address)
    }
    
    var description: String {
        return "My name is \(name) and I live at \(address)"
    }
}

func main() {
    var john = Employee("John", Address("123 London Road", "London"))
    
    var chris = Employee(copyFrom: john)
    chris.name = "Chris"
    chris.address.city = "Manchester"
    
    print(chris.description)
    print(john.description)
}

main()
