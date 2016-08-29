//
//  Order.swift
//  Ordination
//
//  Created by Bruno da Luz on 8/29/16.
//  Copyright © 2016 Bruno da Luz. All rights reserved.
//

import Foundation

enum OrderSegment: Int {
    case Deselected = -1, Title_Selected = 0, Selected_Author = 1, Selected_EditionYear = 2
}

enum SelectedOrder: Int {
    case ASC = 0, DESC = 1
}
