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

    @IBOutlet weak var segmentTitle: UISegmentedControl!
    @IBOutlet weak var segmentAuthor: UISegmentedControl!
    @IBOutlet weak var segmentEditioYear: UISegmentedControl!

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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //# MARK: Table View

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellBooks = tableView.dequeueReusableCellWithIdentifier("CellBooks") as! BookCell

        let book = BookViewModel(book: self.listOfBooks[indexPath.row])
        cellBooks.configure(bookViewModel: book)

        return cellBooks
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listOfBooks.count
    }

    //# MARK: Set Default List

    func setDefaultList() {
        let defaultList = getOrdenation(positionTitle: SelectedOrder.ASC.rawValue,
                                        positionAuthor: SelectedOrder.ASC.rawValue,
                                        positionEditionYear: OrderSegment.Deselected.rawValue)
        self.listOfBooks = defaultList
    }

    func getOrdenation(positionTitle positionTitle: Int, positionAuthor: Int, positionEditionYear: Int) -> [Book] {
        let dictionaryWithOptionsSelected = ["title" : positionTitle,
                                             "author" : positionAuthor,
                                             "editionYear" : positionEditionYear]

        let newList = bookController.validate(selected: dictionaryWithOptionsSelected, listOfBooks: self.listOfBooks)
        self.clearList()
        return newList
    }
    
    //# MARK: Clear List
    
    func clearList() {
        self.listOfBooks.removeAll()
    }
}
