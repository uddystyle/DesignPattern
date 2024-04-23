class HtmlElement : CustomStringConvertible {
    
    var name = ""
    var text = ""
    var elements = [HtmlElement]()
    private let indentSize = 2
    
    init() {}
    init(name: String, text: String) {
        self.name = name
        self.text = text
    }
    
    private func description(_ indent: Int) -> String {
        var result = ""
        let i = String(repeating: " ", count: indent)
        result += "\(i)<\(name)>\n"
        
        if (!text.isEmpty) {
            result += String(repeating: " ", count: indentSize * (indent + 1))
            result += text
            result += "\n"
        }
        
        for e in elements {
            result += e.description(indent+1)
        }
        
        result += "\(i)</\(name)>\n"
        return result
    }
    
    public var description: String {
        return description(0)
    }
}

class HtmlBuilder : CustomStringConvertible {
    private let rootName: String
    var root = HtmlElement()
    
    init(rootName: String) {
        self.rootName = rootName
        root.name = rootName
    }
    
    // not fluent
    func addChild(name: String, text: String) {
        let e = HtmlElement(name: name, text: text)
        root.elements.append(e)
    }
    
    func addChildFluent(childName: String, childText: String) -> HtmlBuilder {
        let e = HtmlElement(name: childName, text: childText)
        root.elements.append(e)
        return self
    }
    
    public var description: String {
        return root.description
    }
    
    func clear() {
        root = HtmlElement(name: rootName, text: "")
    }
}

func main() {
    let hello = "hello"
    var result = "<p>\(hello)</p>"
    print(result)
    
    let words = ["hello", "world"]
    result = "<ul>"
    for word in words {
        result.append("<li>\(word)</li>")
    }
    result.append("</ul>")
    print(result)
    
    let builder = HtmlBuilder(rootName: "ul")
    builder.addChildFluent(childName: "li", childText: "hello")
        .addChildFluent(childName: "li", childText: "world")
    
    print(builder)
}

main()
