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

        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func test_select_by_title_ASC_and_deselected() {

        let element = XCUIApplication().otherElements.containingType(.NavigationBar, identifier:"Books").childrenMatchingType(.Other).elementBoundByIndex(1)
        element.childrenMatchingType(.SegmentedControl).elementBoundByIndex(0).buttons["Asc"].tap()
        element.childrenMatchingType(.Button).matchingIdentifier("erase").elementBoundByIndex(0).tap()

    }

    func test_select_by_title_DESC_and_deselected() {

        let element = XCUIApplication().otherElements.containingType(.NavigationBar, identifier:"Books").childrenMatchingType(.Other).elementBoundByIndex(1)
        element.childrenMatchingType(.SegmentedControl).elementBoundByIndex(0).buttons["Desc"].tap()
        element.childrenMatchingType(.Button).matchingIdentifier("erase").elementBoundByIndex(0).tap()

    }

    func test_select_by_author_ASC_and_deselected() {

        let element = XCUIApplication().otherElements.containingType(.NavigationBar, identifier:"Books").childrenMatchingType(.Other).elementBoundByIndex(1)
        element.childrenMatchingType(.SegmentedControl).elementBoundByIndex(1).buttons["Asc"].tap()
        element.childrenMatchingType(.Button).matchingIdentifier("erase").elementBoundByIndex(1).tap()

    }

    func test_select_by_author_DESC_and_deselected() {

        let element = XCUIApplication().otherElements.containingType(.NavigationBar, identifier:"Books").childrenMatchingType(.Other).elementBoundByIndex(1)
        element.childrenMatchingType(.SegmentedControl).elementBoundByIndex(1).buttons["Desc"].tap()
        element.childrenMatchingType(.Button).matchingIdentifier("erase").elementBoundByIndex(1).tap()

    }

    func test_select_by_edition_year_ASC_and_deselected() {

        let element = XCUIApplication().otherElements.containingType(.NavigationBar, identifier:"Books").childrenMatchingType(.Other).elementBoundByIndex(1)
        element.childrenMatchingType(.SegmentedControl).elementBoundByIndex(2).buttons["Asc"].tap()
        element.childrenMatchingType(.Button).matchingIdentifier("erase").elementBoundByIndex(2).tap()

    }

    func test_select_by_edition_year_DESC_and_deselected() {

        let element = XCUIApplication().otherElements.containingType(.NavigationBar, identifier:"Books").childrenMatchingType(.Other).elementBoundByIndex(1)
        element.childrenMatchingType(.SegmentedControl).elementBoundByIndex(2).buttons["Desc"].tap()
        element.childrenMatchingType(.Button).matchingIdentifier("erase").elementBoundByIndex(2).tap()

    }

}
