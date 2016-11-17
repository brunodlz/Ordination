import Foundation

enum Segment: Int {
    case Deselected = -1, Title = 0, Author = 1, EditionYear = 2
}

enum OrderBy: Int {
    case ASC = 0, DESC = 1
}
