import Foundation

protocol Copying {
    func clone() -> Self
}

class Address: CustomStringConvertible, Copying {
    var streetAddress: String
    var city: String
    
    init(_ streetAddress: String, _ city: String) {
        self.streetAddress = streetAddress
        self.city = city
    }
    
    func clone() -> Self {
        return cloneImpl()
    }
    
    private func cloneImpl<T>() -> T {
        return Address(streetAddress, city) as! T
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
    
    func clone() -> Employee {
        return cloneImpl()
    }
    
    private func cloneImpl<T>() -> T {
        return Employee(name, address.clone()) as! T
    }
    
    var description: String {
        return "My name is \(name) and I live at \(address)"
    }
}

func main() {
    var john = Employee("John", Address("123 London Road", "London"))
    
    var chris = john.clone()
    chris.name = "Chris"
    chris.address.city = "Manchester"
    
    print(chris.description)
    print(john.description)
}

main()
