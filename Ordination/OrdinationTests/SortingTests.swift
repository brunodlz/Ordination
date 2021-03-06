import XCTest
@testable import Ordination

class SortingTests: XCTestCase {

    var listOfBooks = [Book]()
    let service = ServiceOrder()
    let bookController = BookController()

    override func setUp() {
        super.setUp()

        listOfBooks = Book().createListOfBooks()
    }

    override func tearDown() {
        super.tearDown()
    }

    func test_Title_Asc() {

        let listTitleAsc = service.getTitleASC(list: self.listOfBooks)

        XCTAssertEqual(listTitleAsc[0].number, 3)
        XCTAssertEqual(listTitleAsc[1].number, 4)
        XCTAssertEqual(listTitleAsc[2].number, 1)
        XCTAssertEqual(listTitleAsc[3].number, 2)

        for book in listTitleAsc {
            print(book)
        }
    }

    func test_Title_Asc_And_Author_Asc() {

        let listTitleAsc  = service.getTitleASC(list: self.listOfBooks)
        let listAuthorAsc = service.getAuthorASC(list: listTitleAsc)

        XCTAssertEqual(listAuthorAsc[0].number, 4)
        XCTAssertEqual(listAuthorAsc[1].number, 1)
        XCTAssertEqual(listAuthorAsc[2].number, 3)
        XCTAssertEqual(listAuthorAsc[3].number, 2)

        for book in listTitleAsc {
            print(book)
        }
    }

    func test_Author_Asc_And_Title_Desc() {

        let listTitleDesc = service.getTitleDESC(list: self.listOfBooks)
        let listAuthorAsc = service.getAuthorASC(list: listTitleDesc)

        XCTAssertEqual(listAuthorAsc[0].number, 1)
        XCTAssertEqual(listAuthorAsc[1].number, 4)
        XCTAssertEqual(listAuthorAsc[2].number, 3)
        XCTAssertEqual(listAuthorAsc[3].number, 2)

        for book in listAuthorAsc {
            print(book)
        }
    }

    func test_EditionYear_Desc_And_Author_Desc_And_Title_Asc() {

        let listTitleAsc        = service.getTitleASC(list: self.listOfBooks)
        let listAuthorDesc      = service.getAuthorDESC(list: listTitleAsc)
        let listEditionYearDesc = service.getEditionYearDESC(list: listAuthorDesc)

        XCTAssertEqual(listEditionYearDesc[0].number, 4)
        XCTAssertEqual(listEditionYearDesc[1].number, 1)
        XCTAssertEqual(listEditionYearDesc[2].number, 3)
        XCTAssertEqual(listEditionYearDesc[3].number, 2)

        for book in listEditionYearDesc {
            print(book)
        }
    }

    func test_EditionYear_Desc_And_Author_Desc_And_Title_DESC() {

        let listTitleDesc       = service.getTitleDESC(list: self.listOfBooks)
        let listAuthorDesc      = service.getAuthorDESC(list: listTitleDesc)
        let listEditionYearDesc = service.getEditionYearDESC(list: listAuthorDesc)

        XCTAssertEqual(listEditionYearDesc[0].number, 1)
        XCTAssertEqual(listEditionYearDesc[1].number, 4)
        XCTAssertEqual(listEditionYearDesc[2].number, 3)
        XCTAssertEqual(listEditionYearDesc[3].number, 2)

        for book in listEditionYearDesc {
            print(book)
        }
    }

    func test_EditioYear_Asc() {

        let listEditionYearAsc = service.getEditionYearASC(list: self.listOfBooks)

        XCTAssertEqual(listEditionYearAsc[0].number, 2)
        XCTAssertEqual(listEditionYearAsc[1].number, 3)
        XCTAssertEqual(listEditionYearAsc[2].number, 1)
        XCTAssertEqual(listEditionYearAsc[3].number, 4)

        for book in listEditionYearAsc {
            print(book)
        }
    }

    func test_all_segments_selected_for_ASC() {

        let dictionaryWithOptionsSelected = ["title" : OrderBy.asc.rawValue,
                                             "author" : OrderBy.asc.rawValue,
                                             "editionYear" : OrderBy.asc.rawValue]

        let (selected_title,
            author_selected,
                editionYear_selected) =
                    bookController.getSelectedSegment(selected: dictionaryWithOptionsSelected)

        XCTAssertTrue(selected_title)
        XCTAssertTrue(author_selected)
        XCTAssertTrue(editionYear_selected)
    }

    func test_all_segments_selected_for_DESC() {

        let dictionaryWithOptionsSelected = ["title" : OrderBy.desc.rawValue,
                                             "author" : OrderBy.desc.rawValue,
                                             "editionYear" : OrderBy.desc.rawValue]

        let (selected_title,
            author_selected,
                editionYear_selected) =
                    bookController.getSelectedSegment(selected: dictionaryWithOptionsSelected)

        XCTAssertTrue(selected_title)
        XCTAssertTrue(author_selected)
        XCTAssertTrue(editionYear_selected)
    }

    func test_get_All_The_Sgments_Sorted_In_ASC() {

        let dictionaryWithSelected = ["title" : OrderBy.asc.rawValue,
                                      "author" : OrderBy.asc.rawValue,
                                      "editionYear" : OrderBy.asc.rawValue]

        let (title,
            author,
            editionYear) = bookController.getSelectedSegment(selected: dictionaryWithSelected)

        let orderedList = bookController.getOrdination(selected: [title, author, editionYear],
                                                       attributes: dictionaryWithSelected,
                                                       listOfBooks: self.listOfBooks)

        XCTAssertEqual(orderedList[0].number, 2)
        XCTAssertEqual(orderedList[1].number, 3)
        XCTAssertEqual(orderedList[2].number, 4)
        XCTAssertEqual(orderedList[3].number, 1)
    }

    func test_get_All_The_Sgments_Sorted_In_DESC() {

        let dictionaryWithSelected = ["title" : OrderBy.desc.rawValue,
                                      "author" : OrderBy.desc.rawValue,
                                      "editionYear" : OrderBy.desc.rawValue]

        let (title,
            author,
            editionYear) = bookController.getSelectedSegment(selected: dictionaryWithSelected)

        let orderedList = bookController.getOrdination(selected: [title, author, editionYear],
                                                       attributes: dictionaryWithSelected,
                                                       listOfBooks: self.listOfBooks)

        XCTAssertEqual(orderedList[0].number, 1)
        XCTAssertEqual(orderedList[1].number, 4)
        XCTAssertEqual(orderedList[2].number, 3)
        XCTAssertEqual(orderedList[3].number, 2)
    }

    func test_It_Was_Selected_Author_Only_ASC() {

        let dictionaryWithSelected = ["title" : Segment.deselected.rawValue,
                                      "author" : OrderBy.asc.rawValue,
                                      "editionYear" : Segment.deselected.rawValue]

        let (title,
            author,
            editionYear) = bookController.getSelectedSegment(selected: dictionaryWithSelected)

        let orderedList = bookController.getOrdination(selected: [title, author, editionYear],
                                                       attributes: dictionaryWithSelected,
                                                       listOfBooks: self.listOfBooks)

        XCTAssertEqual(orderedList[0].number, 1)
        XCTAssertEqual(orderedList[1].number, 4)
        XCTAssertEqual(orderedList[2].number, 3)
        XCTAssertEqual(orderedList[3].number, 2)
    }

    func test_It_Was_Selected_Author_Only_DESC() {

        let dictionaryWithSelected = ["title" : Segment.deselected.rawValue,
                                      "author" : OrderBy.asc.rawValue,
                                      "editionYear" : Segment.deselected.rawValue]

        let (title,
            author,
            editionYear) = bookController.getSelectedSegment(selected: dictionaryWithSelected)

        let orderedList = bookController.getOrdination(selected: [title, author, editionYear],
                                                       attributes: dictionaryWithSelected,
                                                       listOfBooks: self.listOfBooks)

        XCTAssertEqual(orderedList[0].number, 1)
        XCTAssertEqual(orderedList[1].number, 4)
        XCTAssertEqual(orderedList[2].number, 3)
        XCTAssertEqual(orderedList[3].number, 2)
    }

    func test_Was_Selected_Of_The_Year_Edition_Only_ASC() {

        let dictionaryWithSelected = ["title" : Segment.deselected.rawValue,
                                      "author" : Segment.deselected.rawValue,
                                      "editionYear" : OrderBy.asc.rawValue]

        let (title,
            author,
            editionYear) = bookController.getSelectedSegment(selected: dictionaryWithSelected)

        let orderedList = bookController.getOrdination(selected: [title, author, editionYear],
                                                       attributes: dictionaryWithSelected,
                                                       listOfBooks: self.listOfBooks)

        XCTAssertEqual(orderedList[0].number, 2)
        XCTAssertEqual(orderedList[1].number, 3)
        XCTAssertEqual(orderedList[2].number, 1)
        XCTAssertEqual(orderedList[3].number, 4)
    }

    func test_Was_Selected_Of_The_Year_Edition_Only_DESC() {

        let dictionaryWithSelected = ["title" : Segment.deselected.rawValue,
                                      "author" : Segment.deselected.rawValue,
                                      "editionYear" : OrderBy.desc.rawValue]

        let (title,
            author,
            editionYear) = bookController.getSelectedSegment(selected: dictionaryWithSelected)

        let orderedList = bookController.getOrdination(selected: [title, author, editionYear],
                                                       attributes: dictionaryWithSelected,
                                                       listOfBooks: self.listOfBooks)

        XCTAssertEqual(orderedList[0].number, 1)
        XCTAssertEqual(orderedList[1].number, 4)
        XCTAssertEqual(orderedList[2].number, 3)
        XCTAssertEqual(orderedList[3].number, 2)
    }

    func test_Empty() {
        self.listOfBooks.removeAll()

        XCTAssertTrue(self.listOfBooks.isEmpty)
    }
}
