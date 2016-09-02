//
//  OrdinationUITests.swift
//  OrdinationUITests
//
//  Created by Bruno da Luz on 8/29/16.
//  Copyright © 2016 Bruno da Luz. All rights reserved.
//

import XCTest

class OrdinationUITests: XCTestCase {

    override func setUp() {
        super.setUp()

        continueAfterFailure = false

        XCUIApplication().launch()

    }

    override func tearDown() {
        super.tearDown()
    }

    func test_select_by_title_ASC_and_deselected() {

        let element = XCUIApplication()
            .otherElements
            .containingType(.NavigationBar, identifier:"Books")
            .childrenMatchingType(.Other).elementBoundByIndex(1)

        element.childrenMatchingType(.SegmentedControl)
            .elementBoundByIndex(0)
            .buttons["Asc"]
            .tap()

        element.childrenMatchingType(.Button)
            .matchingIdentifier("erase")
            .elementBoundByIndex(0)
            .tap()

    }

    func test_select_by_title_DESC_and_deselected() {

        let element = XCUIApplication().otherElements
            .containingType(.NavigationBar, identifier:"Books")
            .childrenMatchingType(.Other)
            .elementBoundByIndex(1)

        element.childrenMatchingType(.SegmentedControl)
            .elementBoundByIndex(0)
            .buttons["Desc"]
            .tap()

        element.childrenMatchingType(.Button)
            .matchingIdentifier("erase")
            .elementBoundByIndex(0)
            .tap()
    }

    func test_select_by_author_ASC_and_deselected() {

        let element = XCUIApplication().otherElements
            .containingType(.NavigationBar, identifier:"Books")
            .childrenMatchingType(.Other)
            .elementBoundByIndex(1)

        element.childrenMatchingType(.SegmentedControl)
            .elementBoundByIndex(1)
            .buttons["Asc"]
            .tap()

        element.childrenMatchingType(.Button)
            .matchingIdentifier("erase")
            .elementBoundByIndex(1)
            .tap()
    }

    func test_select_by_author_DESC_and_deselected() {

        let element = XCUIApplication().otherElements
            .containingType(.NavigationBar, identifier:"Books")
            .childrenMatchingType(.Other)
            .elementBoundByIndex(1)

        element.childrenMatchingType(.SegmentedControl)
            .elementBoundByIndex(1)
            .buttons["Desc"]
            .tap()

        element.childrenMatchingType(.Button)
            .matchingIdentifier("erase")
            .elementBoundByIndex(1)
            .tap()
    }

    func test_select_by_edition_year_ASC_and_deselected() {

        let element = XCUIApplication().otherElements
            .containingType(.NavigationBar, identifier:"Books")
            .childrenMatchingType(.Other)
            .elementBoundByIndex(1)

        element.childrenMatchingType(.SegmentedControl)
            .elementBoundByIndex(2)
            .buttons["Asc"]
            .tap()

        element.childrenMatchingType(.Button)
            .matchingIdentifier("erase")
            .elementBoundByIndex(2)
            .tap()
    }

    func test_select_by_edition_year_DESC_and_deselected() {

        let element = XCUIApplication().otherElements
            .containingType(.NavigationBar, identifier:"Books")
            .childrenMatchingType(.Other)
            .elementBoundByIndex(1)

        element.childrenMatchingType(.SegmentedControl)
            .elementBoundByIndex(2)
            .buttons["Desc"]
            .tap()

        element.childrenMatchingType(.Button)
            .matchingIdentifier("erase")
            .elementBoundByIndex(2)
            .tap()
    }

}
