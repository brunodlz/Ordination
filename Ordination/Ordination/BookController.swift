//
//  BookController.swift
//  Ordination
//
//  Created by Bruno da Luz on 8/29/16.
//  Copyright © 2016 Bruno da Luz. All rights reserved.
//

import Foundation

class BookController {

    let service = ServiceOrder()

    func validate(selected attributes: NSDictionary, listOfBooks: [Book]) -> [Book] {

        let (title_selected, selected_author, seletecd_edition_year) = self.getSelectedSegment(selected: attributes)

        guard title_selected || selected_author || seletecd_edition_year else {
            return self.getBooks()
        }

        return self.getOrdination(selected: [title_selected, selected_author, seletecd_edition_year], attributes: attributes, listOfBooks: listOfBooks)
    }

    //# MARK: - GET ORDINATION

    func getOrdination(selected selected: [Bool], attributes: NSDictionary, listOfBooks: [Book]) -> [Book] {

        var listContainsNewOrder = [Book]()

        let title_selected = selected[OrderSegment.Title_Selected.rawValue]
        let selected_author = selected[OrderSegment.Selected_Author.rawValue]
        let selected_edition_year = selected[OrderSegment.Selected_EditionYear.rawValue]

        let value_selected = self.getTheOrderSelectedByAscOrDesc(selected: attributes)

        if title_selected {
            listContainsNewOrder = self.getTitle(value_selected[OrderSegment.Title_Selected.rawValue], list: listOfBooks)
        }

        if selected_author && listContainsNewOrder.count > 0 {

            let newList = self.getAuthor(value_selected[OrderSegment.Selected_Author.rawValue], list: listContainsNewOrder)

            listContainsNewOrder.removeAll()
            listContainsNewOrder = newList

        } else if selected_author {
            listContainsNewOrder = self.getAuthor(value_selected[OrderSegment.Selected_Author.rawValue], list: listOfBooks)
        }

        if selected_edition_year && listContainsNewOrder.count > 0 {

            let newList = self.getEditionYear(value_selected[OrderSegment.Selected_EditionYear.rawValue], list: listContainsNewOrder)

            listContainsNewOrder.removeAll()
            listContainsNewOrder = newList

        } else if selected_edition_year {
            listContainsNewOrder = self.getEditionYear(value_selected[OrderSegment.Selected_EditionYear.rawValue], list: listOfBooks)
        }

        return listContainsNewOrder
    }

    //# MARK: - TITLE - [ ASC / DESC ]

    func getTitle(segment: Int, list listOfBooks: [Book]) -> [Book] {

        if segment == SelectedOrder.ASC.rawValue {
            return service.getTitleASC(list: listOfBooks)
        }
        return service.getTitleDESC(list: listOfBooks)

    }

    //# MARK: - AUTHOR - [ ASC / DESC ]

    func getAuthor(segment: Int, list listOfBooks: [Book]) -> [Book] {

        if segment == SelectedOrder.ASC.rawValue {
            return service.getAuthorASC(list: listOfBooks)
        }

        return service.getAuthorDESC(list: listOfBooks)
    }

    //# MARK: - EDITION YEAR - [ ASC / DESC ]

    func getEditionYear(segment: Int, list listOfBooks: [Book]) -> [Book] {

        if segment == SelectedOrder.ASC.rawValue {
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

    func getSelectedSegment(selected selected: NSDictionary) -> (Bool, Bool, Bool) {
        let title = selected.valueForKey("title") as! Int
        let author = selected.valueForKey("author") as! Int
        let editionYear = selected.valueForKey("editionYear") as! Int

        var title_selected = false
        var selected_author = false
        var selected_edition_year = false

        if title != OrderSegment.Deselected.rawValue {
            title_selected = true
        }

        if author != OrderSegment.Deselected.rawValue {
            selected_author = true
        }

        if editionYear != OrderSegment.Deselected.rawValue {
            selected_edition_year = true
        }

        return (title_selected, selected_author, selected_edition_year)
    }

    //# MARK: - GET THE ORDER SELECTED BY ASC OR DESC

    func getTheOrderSelectedByAscOrDesc(selected selected: NSDictionary) -> [Int] {

        let value_selected_title = selected.valueForKey("title") as! Int
        let author_value_selected = selected.valueForKey("author") as! Int
        let edition_year_value_selected_title = selected.valueForKey("editionYear") as! Int

        return [value_selected_title, author_value_selected, edition_year_value_selected_title]
    }

}
