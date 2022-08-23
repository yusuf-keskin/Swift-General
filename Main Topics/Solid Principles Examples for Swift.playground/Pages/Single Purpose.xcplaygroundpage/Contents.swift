import Cocoa

// Problem = One class with many different responsibilities, purposes.


class Handler {

    func handle() {
        let data = requestDataToAPI()
        let array = parse(data: data)
        saveToDB(array: array)
    }

    private func requestDataToAPI() -> Data {
        // send API request and wait the response
    }

    private func parse(data: Data) -> [String] {
        // parse the data and create the array
    }

    private func saveToDB(array: [String]) {
        // save the array in a database (CoreData/Realm/...)
    }
}


// Solution = Make seperate classes to seperate responsibilities.


class Handler2 {

    let apiHandler: APIHandler2
    let parseHandler: ParseHandler2
    let dbHandler: DBHandler2

    init(apiHandler: APIHandler2, parseHandler: ParseHandler2, dbHandler: DBHandler2) {
        self.apiHandler = apiHandler
        self.parseHandler = parseHandler
        self.dbHandler = dbHandler
    }

    func handle() {
        let data = apiHandler.requestDataToAPI()
        let array = parseHandler.parse(data: data)
        dbHandler.saveToDB(array: array)
    }
}

class APIHandler2 {

    func requestDataToAPI() -> Data {
        // send API request and wait the response
    }
}

class ParseHandler2 {

    func parse(data: Data) -> [String] {
        // parse the data and create the array
    }
}

class DBHandler2 {

    func saveToDB(array: [String]) {
        // save the array in a database (CoreData/Realm/...)
    }
}
