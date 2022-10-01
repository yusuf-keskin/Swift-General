import Cocoa
import Foundation


//DispatchGroup is to notify us about firing and ending events.
//Wait method show us to learn which events could pass timeout(we set) and
//and when all of them are done
//Notify method notifies us that all events in Queue are done


func fakeApiCaller2(callback : @escaping(_ value : Int)->()) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
        callback(0)
    }
}


let queue = DispatchQueue.global(qos: .userInitiated)
let group = DispatchGroup()


queue.async(group: group) {
    
    group.enter()  // -First call enter()
    fakeApiCaller2() { number in
        print("Do some work")
        group.leave() //then after the work done, in the same func call "leave()"
    }
}



queue.async(group: group) {
    print("task 1 starting")
    Thread.sleep(until: .now + 5)
    print("task 1 ending")
}

queue.async(group: group) {
    print("task 2 starting")
    Thread.sleep(until: .now + 2)
    print("task 2 ending")
}

queue.async(group: group) {
    print("task 3 starting")
    Thread.sleep(until: .now + 7)
    print("task 3 ending")
}

if group.wait(timeout: .now() + 4) == .timedOut {
    print("All task not completed within 4 seconds")
} else {
    print("All task are completed in 4 seconds")
}

group.notify(queue: .main) {
    print("All tasks are completed")
}

let queue2 = DispatchQueue.global(qos: .userInitiated)
let group2 = DispatchGroup()

func fakeApiCallerWithGroup(group : DispatchGroup, callback : @escaping(_ value : Int)->()) {
    group2.enter()
    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
        callback(0)
        group2.leave()
    }
}

fakeApiCallerWithGroup(group : group2) { _ in
    print("Heyyo")
}

group.notify(queue: queue2) {
    print("All tasks are completed 2")
}
