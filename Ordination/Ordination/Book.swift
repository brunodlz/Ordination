import Foundation

struct Book {
    var number: Int?
    var title: String?
    var author: String?
    var editionYear: Int?

    //# MARK: - DEFAUL LIST

    func createListOfBooks() -> [Book] {
        let java_how_to_program = Book(number: 1,
                                       title: "Java How To Program",
                                       author: "Deitel & Deitel",
                                       editionYear: 2007)

        let patterns_of_enterprise = Book(number: 2,
                                          title: "Patterns of Enterprise Application Architecture",
                                          author: "Martin Fowler",
                                          editionYear: 2002)

        let head_first_design_patterns = Book(number: 3,
                                              title: "Head First Design Patterns",
                                              author: "Elisabeth Freeman",
                                              editionYear: 2004)

        let how_to_program = Book(number: 4,
                                  title: "Internet & World Wide Web: How to Program",
                                  author: "Deitel & Deitel",
                                  editionYear: 2007)

        return [java_how_to_program,
                patterns_of_enterprise,
                head_first_design_patterns,
                how_to_program]
    }
}
