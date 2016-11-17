import Foundation
// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}


class ServiceOrder {

    //# MARK: - TITLE --> ASC

    func getTitleASC(list listOfSorting: [Book]) -> [Book] {
        let list_Title_ASC = listOfSorting.sorted {
            $0.title < $1.title
        }
        return list_Title_ASC
    }

    //# MARK: - TITLE --> DESC

    func getTitleDESC(list listOfSorting: [Book]) -> [Book] {
        let list_Title_DESC = listOfSorting.sorted {
            $0.title > $1.title
        }
        return list_Title_DESC
    }

    //# MARK: - AUTHOR --> ASC

    func getAuthorASC(list listOfSorting: [Book]) -> [Book] {
        let list_Author_ASC = listOfSorting.sorted {
            $0.author < $1.author
        }
        return list_Author_ASC
    }

    //# MARK: - AUTHOR --> DESC

    func getAuthorDESC(list listOfSorting: [Book]) -> [Book] {
        let list_Author_DESC = listOfSorting.sorted {
            $0.author > $1.author
        }
        return list_Author_DESC
    }

    //# MARK: - EDITION YEAR --> ASC

    func getEditionYearASC(list listOfSorting: [Book]) -> [Book] {
        let list_EditionYear_ASC = listOfSorting.sorted {
            $0.editionYear < $1.editionYear
        }
        return list_EditionYear_ASC
    }

    //# MARK: - EDITION YEAR --> DESC

    func getEditionYearDESC(list listOfSorting: [Book]) -> [Book] {
        let list_EditionYear_DESC = listOfSorting.sorted {
            $0.editionYear > $1.editionYear
        }
        return list_EditionYear_DESC
    }

}
