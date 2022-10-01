//First find the smallest element in the array and exchange it with the element in the first position, then find the second smallest element and replace it with the element in second position and continues in same way for the entire array.


import Foundation
var arr = [4,3,5,6,1,2]

var min = 0
var j = 0
for i in 0..<arr.count{
    min = i
    j = i+1
    for j in stride(from: j, to: arr.count, by: 1){
        if(arr[min] > arr[j]){
            min = j
        }
    }
    var temp = arr[i]
    arr[i] = arr[min]
    arr[min] = temp
}
print(arr)

/*
Time Complexity –  worst – O(n^2), best – O(n^2) and Average – O(n^2)
*/

// or

extension Array where Element: Comparable {
  
  public mutating func selectionSort() {
    for iterationIndex in 0 ..< self.count - 1 {
      
      var minIndex = iterationIndex
      
      for compareIndex in iterationIndex + 1 ..< self.count {
        if self[compareIndex] < self[minIndex] {
          minIndex = compareIndex
        }
      }
      
      swapAt(iterationIndex, minIndex)
    }
  }
}
