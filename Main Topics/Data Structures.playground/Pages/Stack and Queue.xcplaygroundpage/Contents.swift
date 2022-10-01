//: [Previous](@previous)
import Foundation


struct NewStack {
    
    private var array : [Int] = []
    
    mutating func push (_ element : Int) {
        array.append(element)
    }
    
    mutating func pop() {
        array.popLast()
    }
}


struct Queue<T> {
  private var elements: [T] = []

  mutating func enqueue(_ value: T) {
    elements.append(value)
  }

  mutating func dequeue() -> T? {
    guard !elements.isEmpty else {
      return nil
    }
    return elements.removeFirst()
  }

  var head: T? {
    return elements.first
  }

  var tail: T? {
    return elements.last
  }
}


//: [Next](@next)
