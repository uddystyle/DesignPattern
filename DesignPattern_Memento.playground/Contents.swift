import UIKit

class Memento {
    let balance: Int
    init(_ balance: Int) {
        self.balance = balance
    }
}

class BankAccount: CustomStringConvertible {
    private var balance: Int
    
    init(_ balance: Int) {
        self.balance = balance
    }
    
    func deposit(_ amount: Int) -> Memento {
        balance += amount
        return Memento(balance)
    }
    
    func resotre(_ m: Memento) {
        balance = m.balance
    }
    
    public var description: String {
        return "Balnce = \(balance)"
    }
}

func main() {
    var ba = BankAccount(100)
    let m1 = ba.deposit(50)
    let m2 = ba.deposit(25)
    print(ba)
    
    ba.resotre(m1)
    print(ba)
    
    ba.resotre(m2)
    print(ba)
}

main()
