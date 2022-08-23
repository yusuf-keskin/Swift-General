//: [Previous](@previous)
import Cocoa

var array = [10,2,3,4,52,6,9]

/// Bir array'i tersine çevirme
func reverseArray<T>(array : [T]) -> [T] {
    var newArray = [T]()
    var copyArray = array
    for _ in array {
        let x = copyArray.removeLast()
        newArray.append(x)
        }
    if newArray.count != 0 {
        return newArray
    } else {
        return []
    }
}

reverseArray(array: array)

/// Bir array'in ortasında veya ortanın bir öncesindeki değeri bulma
func returnMiddle<T> (array : [T]) -> T {
    if array.count % 2 == 0 {
        return array[(array.count / 2) - 1]
    } else {
        return array[(array.count - 1) / 2]
    }
}

returnMiddle(array: array)

///Bir array'daki en büyük sayıyı bulma
func findMax(array: [Int]) -> Int {
    let newArray = array.sorted { a, b in
        if a>b {
            return true
        } else {
            return false
        }
    }
    return newArray.first!
}

findMax(array: array)

//: [Next](@next)
