import Foundation

class ServiceOrder {
    
    //# MARK: - TITLE --> ASC
    
    func getTitleASC(list listOfSorting: [Book]) -> [Book] {
        return listOfSorting.sorted { $0.title! < $1.title! }
    }
    
    //# MARK: - TITLE --> DESC
    
    func getTitleDESC(list listOfSorting: [Book]) -> [Book] {
        return listOfSorting.sorted { $0.title! > $1.title! }
    }
    
    //# MARK: - AUTHOR --> ASC
    
    func getAuthorASC(list listOfSorting: [Book]) -> [Book] {
        return listOfSorting.sorted { $0.author! < $1.author! }
    }
    
    //# MARK: - AUTHOR --> DESC
    
    func getAuthorDESC(list listOfSorting: [Book]) -> [Book] {
        return listOfSorting.sorted { $0.author! > $1.author! }
    }
    
    //# MARK: - EDITION YEAR --> ASC
    
    func getEditionYearASC(list listOfSorting: [Book]) -> [Book] {
        return listOfSorting.sorted { $0.editionYear! < $1.editionYear! }
    }
    
    //# MARK: - EDITION YEAR --> DESC
    
    func getEditionYearDESC(list listOfSorting: [Book]) -> [Book] {
        return listOfSorting.sorted { $0.editionYear! > $1.editionYear! }
    }
}
