import UIKit

class BankAccount: CustomStringConvertible {
    private var balance: Int = 0
    private let overdraftLimit = -500
    
    func deposit(_ amount: Int) {
        balance += amount
        print("Deposited \(amount), balance is now \(balance)")
    }
}
