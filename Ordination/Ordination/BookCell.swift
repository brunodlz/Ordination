import UIKit

class BookCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(bookViewModel book: BookViewModel) {
        self.titleLabel.text = book.title
        self.authorLabel.text = "\(book.editionYear) \(book.author)"
    }

}
