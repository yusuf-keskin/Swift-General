import Foundation

func fakeApiCaller(callback : @escaping(_ value : Int)->()) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
        callback(0)
    }
}

let semaphore = DispatchSemaphore(value : 0)
let newQueue = DispatchQueue.global(qos: .background)
//let newGroup = DispatchGroup()

var arr = [Int]()


//Below example shows how events are done one by one, before one finish
// other doesnt start. Because semaphore value = 0!

newQueue.async {
    

    fakeApiCaller() { number in
        arr.append(Int(number + 1))
        print("Task 1 finished")
        print("Now array is  \(arr)")
        semaphore.signal()
    }

    semaphore.wait()

    fakeApiCaller() { number in
        arr.append(Int(number + 2))
        print("Task 2 finished")
        print("Now array is  \(arr)")
        semaphore.signal()
    }

    semaphore.wait()

    fakeApiCaller() { number in
        arr.append(Int(number + 3))
        print("Task 3 finished")
        print("Now array is  \(arr)")
        semaphore.signal()
    }

    semaphore.wait()

}

print("Start adding numbers")

// If we define new semaphore with value 5, it means DispatchQueue will run 5 task ,
//when they are finished, it'll run 5 more and so on until end.

let newSemaphore = DispatchSemaphore(value : 5)
let queue = DispatchQueue(label: "com.gcd.myQueue", attributes: .concurrent)

for i in 1...20 {
   queue.async {
       newSemaphore.wait()
      print("Downloading song", i)
      sleep(2) // Download take ~2 sec each
       newSemaphore.signal()
   }
}




