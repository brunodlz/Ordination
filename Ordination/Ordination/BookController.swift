import Foundation

class BookController {

    let service = ServiceOrder()

    func validate(selected attributes: NSDictionary,
                           listOfBooks: [Book]) -> [Book] {

        let (title, author, editionYear) = self.getSelectedSegment(selected: attributes)

        guard title || author || editionYear else {
            return self.getBooks()
        }

        return self.getOrdination(selected: [title, author, editionYear],
                                  attributes: attributes, listOfBooks: listOfBooks)
    }

    //# MARK: - GET ORDINATION

    func getOrdination(selected status: [Bool],
                                attributes: NSDictionary,
                                listOfBooks: [Book]) -> [Book] {

        var listContainsNewOrder = [Book]()

        let title = status[Segment.title.rawValue]
        let author = status[Segment.author.rawValue]
        let editionYear = status[Segment.editionYear.rawValue]

        let value_selected = self.getTheOrderSelectedByAscOrDesc(selected: attributes)

        if title {
            listContainsNewOrder = self.getTitle(value_selected[Segment.title.rawValue],
                                                 list: listOfBooks)
        }

        if author && listContainsNewOrder.count > 0 {

            let newList = self.getAuthor(value_selected[Segment.author.rawValue], list:
                listContainsNewOrder)

            listContainsNewOrder.removeAll()
            listContainsNewOrder = newList

        } else if author {
            listContainsNewOrder = self.getAuthor(value_selected[Segment.author.rawValue],
                                                  list: listOfBooks)
        }

        if editionYear && listContainsNewOrder.count > 0 {

            let newList = self.getEditionYear(value_selected[Segment.editionYear.rawValue],
                                              list: listContainsNewOrder)

            listContainsNewOrder.removeAll()
            listContainsNewOrder = newList

        } else if editionYear {
            listContainsNewOrder = self.getEditionYear(value_selected[Segment.editionYear.rawValue],
                                                       list: listOfBooks)
        }

        return listContainsNewOrder
    }

    //# MARK: - TITLE - [ ASC / DESC ]

    func getTitle(_ segment: Int, list listOfBooks: [Book]) -> [Book] {

        if segment == OrderBy.asc.rawValue {
            return service.getTitleASC(list: listOfBooks)
        }
        return service.getTitleDESC(list: listOfBooks)

    }

    //# MARK: - AUTHOR - [ ASC / DESC ]

    func getAuthor(_ segment: Int, list listOfBooks: [Book]) -> [Book] {

        if segment == OrderBy.asc.rawValue {
            return service.getAuthorASC(list: listOfBooks)
        }

        return service.getAuthorDESC(list: listOfBooks)
    }

    //# MARK: - EDITION YEAR - [ ASC / DESC ]

    func getEditionYear(_ segment: Int, list listOfBooks: [Book]) -> [Book] {

        if segment == OrderBy.asc.rawValue {
            return service.getEditionYearASC(list: listOfBooks)
        }

        return service.getEditionYearDESC(list: listOfBooks)
    }

    //# MARK: - DEFAUL LIST

    func getBooks() -> [Book] {
        let listOfBooks = Book().createListOfBooks()
        return listOfBooks
    }

    //# MARK: - GET SELECTED SEGMENT

    func getSelectedSegment(selected: NSDictionary) -> (Bool, Bool, Bool) {
        
        var title = false
        var author = false
        var editionYear = false
        
        if let segment_title = (selected.value(forKey: "title") as? String) {
            if Int(segment_title) != Segment.deselected.rawValue {
                title = true
            }
        }
        
        if let segment_author = (selected.value(forKey: "author") as? String) {
            if Int(segment_author) != Segment.deselected.rawValue {
                author = true
            }
        }
        
        if let segment_editionYear = (selected.value(forKey: "editionYear") as? String) {
            if Int(segment_editionYear) != Segment.deselected.rawValue {
                editionYear = true
            }
        }

        return (title, author, editionYear)
    }

    //# MARK: - GET THE ORDER SELECTED BY ASC OR DESC

    func getTheOrderSelectedByAscOrDesc(selected: NSDictionary) -> [Int] {

        let value_selected_title = (selected.value(forKey: "title") as? String)!
        let author_value_selected = (selected.value(forKey: "author") as? String)!
        let edition_year_value_selected_title = (selected.value(forKey: "editionYear") as? String)!

        return [Int(value_selected_title)!,
                Int(author_value_selected)!,
                Int(edition_year_value_selected_title)!]
    }

}
