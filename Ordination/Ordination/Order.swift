import Foundation

enum Segment: Int {
    case deselected  = -1
    case title       = 0
    case author      = 1
    case editionYear = 2
}

enum OrderBy: Int {
    case asc  = 0
    case desc = 1
}
