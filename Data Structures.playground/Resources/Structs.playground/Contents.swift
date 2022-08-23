import Cocoa


// -------- REDUCE --------------

var greeting = [1,2,3,4,5,6]

var new = greeting.reduce(0) { x, y in
    x+y
}


// -------- LAZY COLLECTIONS ---------------

/// If the number is prime (asal sayi)
func isPrime(_ number: Int) -> Bool {
    if number == 1 { return false }
    if number == 2 || number == 3 { return true }
    for i in 2...Int(Double(number).squareRoot()) {
        if number % i == 0 { return false }
    }
    return true
}

let primes = (1...).lazy
    .filter { isPrime($0) }
    .prefix(10)
primes.forEach { print($0) }


func isEven(number: Int) -> Bool {
    if number % 2 == 0 {
        return true
    } else {
        return false
    }
}

// Yukarıdaki fonksiyonu kullanarak 15 ten başlayıp sonsuza kadar giden
// sayılar içinde, sonraki 20 değer içinden çift olan değerleri süzerek
// yeni dizi oluşturma
let sayilarGrubu = (15...).lazy.prefix(20).filter { isEven(number: $0)}

print(sayilarGrubu)


///This func repeats given closure for desired times
func taskRepeat(times: Int, task: ()-> Void) {
    return (1...).lazy.prefix(times).forEach { _ in
        task()
    }
}

