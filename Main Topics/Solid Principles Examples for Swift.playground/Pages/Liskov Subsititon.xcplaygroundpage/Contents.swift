import Foundation

//preconditions // Wrong structure---------

class Handler {

    func save(string: String) {
        // Save string in the Cloud
    }
}

class FilteredHandler: Handler {

    override func save(string: String) {
        guard string.count > 5 else { return }

        super.save(string: string)
    }
}

//preconditions // Correct Structure ------------

//Here we added new requirement to main class like a filter, without overriding anything else. Here, other classes can continue to
//the main class without changing in the implemention, also no need for subclassing :

class AltHandler {

    func save(string: String, minChars: Int = 0) {
        guard string.count >= minChars else { return }

        // Save string in the Cloud
    }
}


///////////////////////////////////////////////////////////////////////////


//postconditions  // Wrong structure
// Here one main and one subclass. subclass need different calculation, main class'es calculation func
// gives wrong answer

class Rectangle {

    var width: Float = 0
    var length: Float = 0

    var area: Float {
        return width * length
    }
}

class Square: Rectangle {

    override var width: Float {
        didSet {
            length = width
        }
    }
}


//This calculates area as 4, instead of 10. Because subclass (Square) parameters modified and
//main class func doesnt give correct result for subclass:

func printArea(of rectangle: Rectangle) {
    rectangle.length = 5
    rectangle.width = 2
    print(rectangle.area)
}




//postconditions  Correct Structure ----------------------

// Here we defice Protocol to give func to main class
// which can be implemented different for subclass

protocol Polygon {
    var area: Float { get }
}

class Rectangle2: Polygon {

    private let width: Float
    private let length: Float

    init(width: Float, length: Float) {
        self.width = width
        self.length = length
    }

    var area: Float {
        return width * length
    }
}

class Square2: Polygon {

    private let side: Float

    init(side: Float) {
        self.side = side
    }

    var area: Float {
        return pow(side, 2)
    }
}

// Client Method

func printArea2(of polygon: Polygon) {
    print(polygon.area)
}

// Usage

let rectangle = Rectangle2(width: 2, length: 5)
printArea2(of: rectangle) // 10

let square = Square2(side: 2)
printArea2(of: square) // 4
