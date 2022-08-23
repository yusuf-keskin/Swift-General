import Foundation

// Fat Protocol -------------

// A simple component implements too many func from Protocol that which
// it doesn!t need

protocol GestureProtocol {
    func didTap()
    func didDoubleTap()
    func didLongPress()
}

class PoorButton: GestureProtocol {
    
    func didTap() {
        // send tap action
    }

    func didDoubleTap() { }

    func didLongPress() { }
}

class SuperButton: GestureProtocol {
    func didTap() {
        // send tap action
    }

    func didDoubleTap() {
        // send double tap action
    }

    func didLongPress() {
        // send long press action
    }
}

// Fat Protocol Fix :------------------------

protocol TapProtocol {
    func didTap()
}

protocol DoubleTapProtocol {
    func didDoubleTap()
}

protocol LongPressProtocol {
    func didLongPress()
}

class SuperButton2: TapProtocol, DoubleTapProtocol, LongPressProtocol {
    func didTap() {
        // send tap action
    }

    func didDoubleTap() {
        // send double tap action
    }

    func didLongPress() {
        // send long press action
    }
}

class PoorButton2: TapProtocol {
    func didTap() {
        // send tap action
    }
}


// Fat Class --------------------------
// A class objects all parts are being read instead of needed ones!


class Video {
    var title: String = "My Video"
    var description: String = "This is a beautiful video"
    var author: String = "Marco Santarossa"
    var url: String = "https://marcosantadev.com/my_video"
    var duration: Int = 60
    var created: Date = Date()
    var update: Date = Date()
}

func play(video: Video) {
    // load the player UI
    // load the content at video.url
    // add video.title to the player UI title
    // update the player scrubber with video.duration
}

// Fat Class Fix ----------------------

protocol Playable {
    var title: String { get }
    var url: String { get }
    var duration: Int { get }
}

class Video2: Playable {
    var title: String = "My Video"
    var description: String = "This is a beautiful video"
    var author: String = "Marco Santarossa"
    var url: String = "https://marcosantadev.com/my_video"
    var duration: Int = 60
    var created: Date = Date()
    var update: Date = Date()
}


func play2(video: Playable) {
    // load the player UI
    // load the content at video.url
    // add video.title to the player UI title
    // update the player scrubber with video.duration
}

