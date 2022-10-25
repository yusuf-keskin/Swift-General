import Cocoa
import Foundation

public class BinaryTree <T> {
    public var value : T
    public var leftChild : BinaryTree?
    public var rightChild : BinaryTree?
    
    init(value : T) {
        self.value = value
        
    }
}

var tree : BinaryTree<Int> {
    let zero = BinaryTree(value: 0)
    let five = BinaryTree(value: 5)
    let eight = BinaryTree(value: 8)
    let one = BinaryTree(value: 1)
    let nine = BinaryTree(value: 9)
    let seven = BinaryTree(value: 7)
    
    one.leftChild = zero
    one.rightChild = five
    nine.leftChild = eight
    seven.leftChild = one
    seven.rightChild = nine
    
    return seven
    
}


func breadFirstTreversal (tree : BinaryTree<Int>) -> [Int] {
    var result = [Int]()
    var queue = [tree]
    
    while !queue.isEmpty {
        let current = queue.remove(at: 0)
        
        result.append(current.value)
        
        if let leftChild = current.leftChild {
            queue.append(leftChild)
        }
        if let rightChild = current.rightChild {
            queue.append(rightChild)
        }
    }
    
    return result
}


func depthFirstTreversal (tree: BinaryTree<Int>) -> [Int] {
    var result =  [Int]()
    var stack = [tree]
    
    while !stack.isEmpty {
        let current = stack.popLast()
        result.append(current!.value)
        
        if let rightChildren = current?.rightChild {
            stack.append(rightChildren)
        }
        
        if let leftChildren = current?.leftChild {
            stack.append(leftChildren)
        }
    }
    return result
}


func breadLevelByLevel<T>(tree: BinaryTree<T>) -> [[T]] {
    var result = [[T]]()
    var queue = [tree]
    
    while !queue.isEmpty {
        
        var levelCount = queue.count
        var levelNodes = [T]()
        
        while levelCount > 0 {
            let current = queue.remove(at: 0)
            levelCount -= 1
            
            levelNodes.append(current.value)
            
            if let left = current.leftChild {
                queue.append(left)
            }
            
            if let right = current.rightChild {
                queue.append(right)
            }
        }
        result.append(levelNodes)
        
    }
    return result
}


func preOrderTraversal(node: BinaryTree<Int>?) {
    guard let node = node else { return }
    print(node.value)
    preOrderTraversal(node: node.leftChild)
    preOrderTraversal(node: node.rightChild)
}
func inOrderTraversal(node: BinaryTree<Int>?) {
    guard let node = node else { return }
    inOrderTraversal(node: node.leftChild)
    print(node.value)
    inOrderTraversal(node: node.rightChild)
}
func postOrderTraversal(node: BinaryTree<Int>?) {
    guard let node = node else { return }
    postOrderTraversal(node: node.leftChild)
    postOrderTraversal(node: node.rightChild)
    print(node.value)
}

breadFirstTreversal(tree: tree)
depthFirstTreversal(tree: tree)
breadLevelByLevel(tree: tree)

preOrderTraversal(node: tree)
inOrderTraversal(node: tree)
postOrderTraversal(node: tree)


