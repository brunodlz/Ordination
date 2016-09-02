//
//  BookViewController.swift
//  Ordination
//
//  Created by Bruno da Luz on 8/29/16.
//  Copyright © 2016 Bruno da Luz. All rights reserved.
//

import UIKit

class BookViewController: UIViewController {

    @IBOutlet weak var bookTableView: UITableView!

    @IBOutlet weak var segmentTitle: UISegmentedControl?
    @IBOutlet weak var segmentAuthor: UISegmentedControl?
    @IBOutlet weak var segmentEditioYear: UISegmentedControl?

    @IBOutlet weak var buttonClearTitle: UIButton!
    @IBOutlet weak var buttonClearAuthor: UIButton!
    @IBOutlet weak var buttonClearEditionYear: UIButton!

    let bookController = BookController()
    var listOfBooks = [Book]()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.listOfBooks = bookController.getBooks()
        self.setDefaultList()
    }

    //# MARK: Table View

    func tableView(tableView: UITableView,
                   cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cellBooks = (tableView.dequeueReusableCellWithIdentifier("CellBooks") as? BookCell)!

        let book = BookViewModel(book: self.listOfBooks[indexPath.row])
        cellBooks.configure(bookViewModel: book)

        return cellBooks
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listOfBooks.count
    }

    //# MARK: Set Default List

    func setDefaultList() {
        let defaultList = getOrdenation(positionTitle: OrderBy.ASC.rawValue,
                                        positionAuthor: OrderBy.ASC.rawValue,
                                        positionEditionYear: Segment.Deselected.rawValue)
        self.listOfBooks = defaultList
    }

    //# MARK: Actions

    @IBAction func actionOrder(sender: AnyObject) {
        self.hiddenButton(hidden: false, selectedSegment: sender.tag)
        self.updateTableView()
    }

    @IBAction func actionCleanOption(sender: AnyObject) {
        self.hiddenButton(hidden: true, selectedSegment: sender.tag)
        self.resetSegment(selectedSegment: sender.tag)
        self.validateSegments()
        self.updateTableView()
    }

    func updateTableView() {

        let segmentTitle = self.segmentTitle!.selectedSegmentIndex
        let segmentAuthor = self.segmentAuthor!.selectedSegmentIndex
        let segmentEditioYear = self.segmentEditioYear!.selectedSegmentIndex

        let orderedList = getOrdenation(positionTitle: segmentTitle,
                                        positionAuthor: segmentAuthor,
                                        positionEditionYear: segmentEditioYear)
        self.listOfBooks = orderedList

        self.bookTableView.reloadData()
    }

    func getOrdenation(positionTitle positionTitle: Int,
                                     positionAuthor: Int,
                                     positionEditionYear: Int) -> [Book] {

        let dictionaryWithOptionsSelected = ["title" : positionTitle,
                                             "author" : positionAuthor,
                                             "editionYear" : positionEditionYear]

        let newList = bookController.validate(selected: dictionaryWithOptionsSelected,
                                              listOfBooks: self.listOfBooks)
        self.clearList()
        return newList
    }

    //# MARK: Clear List

    func clearList() {
        self.listOfBooks.removeAll()
    }

    //# MARK: Validate Segments

    func validateSegments() {
        if self.segmentTitle!.selectedSegmentIndex == Segment.Deselected.rawValue &&
            self.segmentAuthor!.selectedSegmentIndex == Segment.Deselected.rawValue &&
            self.segmentEditioYear!.selectedSegmentIndex == Segment.Deselected.rawValue {
            self.setDefaultList()
        }
    }

    //# MARK: Hidden Button

    func hiddenButton(hidden hidden: Bool, selectedSegment: Int) {
        switch selectedSegment {
        case 0:
            self.buttonClearTitle.hidden = hidden
            break

        case 1:
            self.buttonClearAuthor.hidden = hidden
            break

        case 2:
            self.buttonClearEditionYear.hidden = hidden
            break

        default: break
        }
    }

    //# MARK: Table View

    func resetSegment(selectedSegment selectedSegment: Int) {
        switch selectedSegment {
        case 0:
            self.segmentTitle!.selectedSegmentIndex = Segment.Deselected.rawValue
            break

        case 1:
            self.segmentAuthor!.selectedSegmentIndex = Segment.Deselected.rawValue
            break

        case 2:
            self.segmentEditioYear!.selectedSegmentIndex = Segment.Deselected.rawValue
            break

        default: break
        }
    }
}
