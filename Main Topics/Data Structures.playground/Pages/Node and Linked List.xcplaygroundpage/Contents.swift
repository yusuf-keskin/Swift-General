//: [Previous](@previous)

import Foundation
import Darwin


// 1
public class Node<T> {
  // 2
  var value: T
  var next: Node<T>?
  weak var previous: Node<T>?

  // 3
  init(value: T) {
    self.value = value
  }
}



public class LinkedList<T> {
    
  fileprivate var head: Node<T>?
  private var tail: Node<T>?

  public var isEmpty: Bool {
    return head == nil
  }

  public var first: Node<T>? {
    return head
  }

  public var last: Node<T>? {
    return tail
  }
    
    init(head : Node<Any>?) {
        self.head = head as? Node<T>
    }
    
    public func append(value: T) {
      // 1
      let newNode = Node(value: value)
      // 2
      if let tailNode = tail {
        newNode.previous = tailNode
        tailNode.next = newNode
      }
      // 3
      else {
      head = newNode
      }
      // 4
      tail = newNode
      }
    
    public func removeAll() {
      head = nil
      tail = nil
    }
    
    
    public func remove(node: Node<Any>) -> String {
      let prev = node.previous
      let next = node.next

      if let prev = prev {
        prev.next = next // 1
      } else {
          head = next as? Node<T> // 2
      }
      next?.previous = prev // 3

      if next == nil {
          tail = prev as? Node<T> // 4
      }

      // 5
      node.previous = nil
      node.next = nil

      // 6
        return node.value as! String
    }


    
    public func nodeAt(index: Int) -> Node<T>? {
      // 1
      if index >= 0 {
        var node = head
        var i = index
        // 2
        while node != nil {
            if i == 0 { return node }
          i -= 1
          node = node!.next
        }
      }
      // 3
      return nil
    }
    
    
}

extension LinkedList: CustomStringConvertible {
  // 2
  public var description: String {
    // 3
    var text = "["
    var node = head
    // 4
    while node != nil {
      text += "\(node!.value)"
      node = node!.next
      if node != nil { text += ", " }
    }
    // 5
    return text + "]"
  }
}

//: [Next](@next)
