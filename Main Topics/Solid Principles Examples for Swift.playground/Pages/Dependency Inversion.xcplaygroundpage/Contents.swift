import Foundation

// High level depends on low level

// Handler class needs FilesystemManager to work. If we change it, handler class brokes

class Handler {

    let fm = FilesystemManager()

    func handle(string: String) {
        fm.save(string: string)
    }
}

class FilesystemManager {

    func save(string: String) {
        // Open a file
        // Save the string in this file
        // Close the file
    }
}

// Dependency Inversion Fix


// We define a new storage protocol so FilesystemManager or ant other storage
// manager can be used whjen they confirm to it. So Higher class now have
// protocols abstraction instead of depending on a spesific class.


protocol Storage {
   func save(string: String)
}


class Handler2 {

    let storage: Storage

    init(storage: Storage) {
        self.storage = storage
    }

    func handle(string: String) {
        storage.save(string: string)
    }
}

class FilesystemManager2: Storage {

    func save(string: String) {
        // Open a file in read-mode
        // Save the string in this file
        // Close the file
    }
}

class DatabaseManager2: Storage {

    func save(string: String) {
        // Connect to the database
        // Execute the query to save the string in a table
        // Close the connection
    }
}
