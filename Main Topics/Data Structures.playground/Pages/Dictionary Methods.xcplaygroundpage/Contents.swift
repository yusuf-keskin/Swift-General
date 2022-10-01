//: [Previous](@previous)
var dict = ["One":1, "Two":2, "Three":3]

var dict2 = ["Four":4, "Five":5]

///Merge two dictionaries
func mergeDictionaries<V,T> (dict1 : [V:T], dict2 : [V:T] ) -> [V:T] {
    var newDict = dict1
    for i in dict2.keys {
        for j in dict2.values {
            newDict[i] = j
        }
    }
    return newDict
}

mergeDictionaries(dict1: dict, dict2: dict2)

var uniqueValueDict = ["Mehmet":5, "Ahmet":8, "Selim":8, "Hanife":7]

///Find , if all elements in dictionary are unique
func isInvertible<T,V: Hashable>(_ dict:[T:V]) -> Bool {
    var newSet = Set<V>()
    for (_,j) in dict {
        newSet.insert(j)
    }
    if newSet.count != dict.count {
        return false
    } else {
        return true
    }
}

isInvertible(uniqueValueDict)

uniqueValueDict.removeValue(forKey: "Ahmet")
print(uniqueValueDict)

mergeDictionaries(dict1: dict, dict2: dict2)
//: [Next](@next)
