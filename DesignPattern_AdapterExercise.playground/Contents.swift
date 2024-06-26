import Foundation
import XCTest

class Square {
    var side = 0
    
    init(side: Int) {
        self.side = side
    }
}

protocol Rectangle {
    var width: Int { get }
    var height: Int { get }
}

extension Rectangle {
    var area: Int {
        return self.width * self.height
    }
}

class SquareToRectangleAdapter: Rectangle {
    private let square: Square
    
    init(_ square: Square) {
        self.square = square
    }
    
    var width: Int { return square.side }
    var height: Int { return square.side }
}

class UMBaseTestCase: XCTestCase {}

class Evaluate: UMBaseTestCase {
    func simpleTest() {
        let sg = Square(side: 11)
        let adapter = SquareToRectangleAdapter(sg)
        XCTAssertEqual(121, adapter.area)
    }
}

extension Evaluate {
    static var allTests: [(String, (Evaluate) -> () throws -> Void)] {
        return [("simpleTest", simpleTest)]
    }
}

func main() {
    print(Evaluate.allTests)
}

main()
