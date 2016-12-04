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
    }

    func viewDidAppear() {
        self.setDefaultList()
    }
    
    //# MARK: Actions

    @IBAction func actionOrder(_ sender: AnyObject) {
        self.hiddenButton(hidden: false, selectedSegment: sender.tag)
        self.updateTableView()
    }

    @IBAction func actionCleanOption(_ sender: AnyObject) {
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

    func getOrdenation(positionTitle: Int,
                                     positionAuthor: Int,
                                     positionEditionYear: Int) -> [Book] {

        let dictionaryWithOptionsSelected = ["title" : positionTitle,
                                             "author" : positionAuthor,
                                             "editionYear" : positionEditionYear]

        let newList = bookController.validate(selected: dictionaryWithOptionsSelected as NSDictionary,
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
        guard self.segmentTitle!.selectedSegmentIndex == Segment.deselected.rawValue else {
            return
        }
        
        guard self.segmentAuthor!.selectedSegmentIndex == Segment.deselected.rawValue else {
            return
        }
        
        guard self.segmentEditioYear!.selectedSegmentIndex == Segment.deselected.rawValue else {
            return
        }
        
        self.setDefaultList()
    }

    //# MARK: Hidden Button

    func hiddenButton(hidden: Bool, selectedSegment: Int) {
        switch selectedSegment {
        case 0:
            self.buttonClearTitle.isHidden = hidden
            break

        case 1:
            self.buttonClearAuthor.isHidden = hidden
            break

        case 2:
            self.buttonClearEditionYear.isHidden = hidden
            break

        default: break
        }
    }

    //# MARK: Table View

    func resetSegment(selectedSegment: Int) {
        switch selectedSegment {
        case 0:
            self.segmentTitle!.selectedSegmentIndex = Segment.deselected.rawValue
            break

        case 1:
            self.segmentAuthor!.selectedSegmentIndex = Segment.deselected.rawValue
            break

        case 2:
            self.segmentEditioYear!.selectedSegmentIndex = Segment.deselected.rawValue
            break

        default: break
        }
    }
}

extension BookViewController : UITableViewDataSource {
    
    //# MARK: Table View
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellBooks = (tableView.dequeueReusableCell(withIdentifier: "CellBooks") as? BookCell)!
        
        let book = BookViewModel(book: self.listOfBooks[indexPath.row])
        cellBooks.configure(bookViewModel: book)
        
        return cellBooks
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listOfBooks.count
    }
    
    //# MARK: Set Default List
    
    func setDefaultList() {
        let defaultList = getOrdenation(positionTitle: OrderBy.asc.rawValue,
                                        positionAuthor: OrderBy.asc.rawValue,
                                        positionEditionYear: Segment.deselected.rawValue)
        self.listOfBooks = defaultList
    }
    
}
