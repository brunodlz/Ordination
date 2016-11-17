import XCTest

@testable import Ordination

class ModelTests: XCTestCase {

    let bookController = BookController()

    func test_Add_Book() {
        let swift_beta_3 = Book(number: 1,
                                title: "The Swift Programming Language (Swift 3 Beta)",
                                author: "Apple",
                                editionYear: 2016)

        XCTAssertNotNil(swift_beta_3)
    }

    func test_Without_Exception() {

        let swift_pocket_reference = Book(number: 1,
                                          title: "Swift Pocket Referente",
                                          author: "Apress",
                                          editionYear: 2015)

        XCTAssertNotNil(swift_pocket_reference.title)

    }

    func test_validate_any_selected() {

        let dictionaryWithOptionsSelected = ["title" : -1,
                                             "author" : -1,
                                             "editionYear" : -1]

        let book1 = Book(number: 1,
                         title: "Java How To Program",
                         author: "Deitel & Deitel",
                         editionYear: 2007)

        let newList = bookController.validate(selected: dictionaryWithOptionsSelected,
                                              listOfBooks: [book1])

        XCTAssertEqual(newList[0].title, "Java How To Program")
        XCTAssertEqual(newList[0].author, "Deitel & Deitel")
        XCTAssertEqual(newList[0].editionYear, 2007)
    }

//    func test_With_Exception() {
//
//        let swift_pocket_reference = [Book]()
//        XCTAssertNil(swift_pocket_reference)
//
//    }

}
