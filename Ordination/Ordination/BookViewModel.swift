import Foundation

protocol BookDataSource {
    var title: String { get }
    var author: String { get }
    var editionYear: String { get }
}

class BookViewModel: BookDataSource {
    var title: String
    var author: String
    var editionYear: String

    init(book: Book) {
        self.title = book.title!
        self.author = book.author!
        self.editionYear = "\(book.editionYear!)"
    }
}
