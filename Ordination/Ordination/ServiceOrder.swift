//
//  ServiceOrder.swift
//  Ordination
//
//  Created by Bruno da Luz on 8/29/16.
//  Copyright © 2016 Bruno da Luz. All rights reserved.
//

import Foundation

class ServiceOrder {

    //# MARK: - TITLE --> ASC

    func getTitleASC(list listOfSorting: [Book]) -> [Book] {
        let list_Title_ASC = listOfSorting.sort {
            $0.title < $1.title
        }
        return list_Title_ASC
    }

    //# MARK: - TITLE --> DESC

    func getTitleDESC(list listOfSorting: [Book]) -> [Book] {
        let list_Title_DESC = listOfSorting.sort {
            $0.title > $1.title
        }
        return list_Title_DESC
    }

    //# MARK: - AUTHOR --> ASC

    func getAuthorASC(list listOfSorting: [Book]) -> [Book] {
        let list_Author_ASC = listOfSorting.sort {
            $0.author < $1.author
        }
        return list_Author_ASC
    }

    //# MARK: - AUTHOR --> DESC

    func getAuthorDESC(list listOfSorting: [Book]) -> [Book] {
        let list_Author_DESC = listOfSorting.sort {
            $0.author > $1.author
        }
        return list_Author_DESC
    }

    //# MARK: - EDITION YEAR --> ASC

    func getEditionYearASC(list listOfSorting: [Book]) -> [Book] {
        let list_EditionYear_ASC = listOfSorting.sort {
            $0.editionYear < $1.editionYear
        }
        return list_EditionYear_ASC
    }

    //# MARK: - EDITION YEAR --> DESC

    func getEditionYearDESC(list listOfSorting: [Book]) -> [Book] {
        let list_EditionYear_DESC = listOfSorting.sort {
            $0.editionYear > $1.editionYear
        }
        return list_EditionYear_DESC
    }

}
