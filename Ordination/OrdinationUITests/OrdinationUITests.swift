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
            .containing(.navigationBar, identifier:"Books")
            .children(matching: .other).element(boundBy: 1)

        element.children(matching: .segmentedControl)
            .element(boundBy: 0)
            .buttons["Asc"]
            .tap()

        element.children(matching: .button)
            .matching(identifier: "erase")
            .element(boundBy: 0)
            .tap()

    }

    func test_select_by_title_DESC_and_deselected() {

        let element = XCUIApplication().otherElements
            .containing(.navigationBar, identifier:"Books")
            .children(matching: .other)
            .element(boundBy: 1)

        element.children(matching: .segmentedControl)
            .element(boundBy: 0)
            .buttons["Desc"]
            .tap()

        element.children(matching: .button)
            .matching(identifier: "erase")
            .element(boundBy: 0)
            .tap()
    }

    func test_select_by_author_ASC_and_deselected() {

        let element = XCUIApplication().otherElements
            .containing(.navigationBar, identifier:"Books")
            .children(matching: .other)
            .element(boundBy: 1)

        element.children(matching: .segmentedControl)
            .element(boundBy: 1)
            .buttons["Asc"]
            .tap()

        element.children(matching: .button)
            .matching(identifier: "erase")
            .element(boundBy: 1)
            .tap()
    }

    func test_select_by_author_DESC_and_deselected() {

        let element = XCUIApplication().otherElements
            .containing(.navigationBar, identifier:"Books")
            .children(matching: .other)
            .element(boundBy: 1)

        element.children(matching: .segmentedControl)
            .element(boundBy: 1)
            .buttons["Desc"]
            .tap()

        element.children(matching: .button)
            .matching(identifier: "erase")
            .element(boundBy: 1)
            .tap()
    }

    func test_select_by_edition_year_ASC_and_deselected() {

        let element = XCUIApplication().otherElements
            .containing(.navigationBar, identifier:"Books")
            .children(matching: .other)
            .element(boundBy: 1)

        element.children(matching: .segmentedControl)
            .element(boundBy: 2)
            .buttons["Asc"]
            .tap()

        element.children(matching: .button)
            .matching(identifier: "erase")
            .element(boundBy: 2)
            .tap()
    }

    func test_select_by_edition_year_DESC_and_deselected() {

        let element = XCUIApplication().otherElements
            .containing(.navigationBar, identifier:"Books")
            .children(matching: .other)
            .element(boundBy: 1)

        element.children(matching: .segmentedControl)
            .element(boundBy: 2)
            .buttons["Desc"]
            .tap()

        element.children(matching: .button)
            .matching(identifier: "erase")
            .element(boundBy: 2)
            .tap()
    }

}
