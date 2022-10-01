import Cocoa

import Foundation

//------------------------------------------------------------

//Simple Closuree
var multiplyClosure = { (_ a: Int, _ b: Int) -> Int in
    return a*b
}

multiplyClosure = {
    $0 * $1
}

//------------------------------------------------------------

//Simple Closured Function
func operateOnNumbers (_ a: Int, _ b: Int,
                       operation: (Int,Int)->Int)-> Int{
    let result = operation(a,b)
    print(result)
    return result
}

//Firts define a closure then add to approprate place
let addClosure = { (a: Int, b: Int) -> Int in
    a+b
}

operateOnNumbers(4, 5, operation: addClosure)

//------------------------------------------------------------

func numbersAgain( _ a: Int, _ b: Int, enterThis : (Int, Int) -> Int) ->Int {
    let c = (a*5)-1
    let d = (b-2)*10
    
    return enterThis(c,d)
}

//------------------------------------------------------------

func againAgain (a: Int, b: String, closure: (Int, String)-> [Int:String]) -> [Int:String] {
    let c = a*5
    let d = "Mehmet" + b

    let result = closure(c,d)
    return result
}

againAgain(a: 5, b: " Ahmet") { sayi, isim in
    return [sayi:isim]
}

againAgain(a: 5, b: " Ahmet", closure: {
    [$0:$1]
    
})


//------------------------------------------------------------

func downloadData (username : String, password: String, closure:([String]) -> [String:String]) -> [String:String] {
    let result = [username,password]
    let heyhey = closure(result)
    return heyhey
}

downloadData(username: "Yusuf", password: "Keskin") { result in
    let x : String = result[0]
    let y : String = result[1]

    return [x:y.uppercased()]
}

//------------------------------------------------------------

//Attention to func structure below!
func countingVS () ->  () ->  Int {
    var counter = 0
    let incrementCounter : () -> Int = {
        counter += 1
        return counter
    }
    return incrementCounter
}
