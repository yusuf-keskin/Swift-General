// Use pivot in from in the middle or random if the array is already sorted!

import UIKit

let unsortedArray = [7, 2, 6, 3, 9, 4]


func quickSort(arr:[Int]) -> [Int]{
    
    var less = [Int]()
    var equal = [Int]()
    var greater = [Int]()
    
    if arr.count > 1{
        let pivot = arr[0]
        
        for x in arr{
            if x < pivot{
                less.append(x)
            }
            if x == pivot{
                equal.append(x)
            }
            if x > pivot{
                greater.append(x)
            }
        }
        return (quickSort(arr:less)+equal+quickSort(arr:greater))
    }else{
        return arr
    }
    
}
let sortedArr = quickSort(arr: unsortedArray)

/// or:

func quicksort<T: Comparable>(_ a: [T]) -> [T] {
  guard a.count > 1 else { return a }

  let pivot = a[a.count/2]
  let less = a.filter { $0 < pivot }
  let equal = a.filter { $0 == pivot }
  let greater = a.filter { $0 > pivot }

  return quicksort(less) + equal + quicksort(greater)
}
