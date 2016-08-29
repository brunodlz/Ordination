//
//  ModelTests.swift
//  Ordination
//
//  Created by Bruno da Luz on 8/29/16.
//  Copyright © 2016 Bruno da Luz. All rights reserved.
//

import XCTest

@testable import Ordination

class ModelTests: XCTestCase {

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

    func test_With_Exception() {

        let swift_pocket_reference = [Book]()
        XCTAssertNil(swift_pocket_reference)

    }

}
