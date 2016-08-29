//
//  SortingTests.swift
//  Ordination
//
//  Created by Bruno da Luz on 8/29/16.
//  Copyright © 2016 Bruno da Luz. All rights reserved.
//

import XCTest
@testable import Ordination

class SortingTests: XCTestCase {

    var listOfBooks = [Book]()
    let service = ServiceOrder()

    override func setUp() {
        super.setUp()

        let book1 = Book(number: 1,
                         title: "Java How To Program",
                         author: "Deitel & Deitel",
                         editionYear: 2007)

        let book2 = Book(number: 2,
                         title: "Patterns of Enterprise Application Architecture",
                         author: "Martin Fowler",
                         editionYear: 2002)

        let book3 = Book(number: 3,
                         title: "Head First Design Patterns",
                         author: "Elisabeth Freeman",
                         editionYear: 2004)

        let book4 = Book(number: 4,
                         title: "Internet & World Wide Web: How to Program",
                         author: "Deitel & Deitel",
                         editionYear: 2007)

        self.listOfBooks.append(book1)
        self.listOfBooks.append(book2)
        self.listOfBooks.append(book3)
        self.listOfBooks.append(book4)
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

    func test_Empty() {
        self.listOfBooks.removeAll()

        XCTAssertTrue(self.listOfBooks.isEmpty)
    }
}
