//
//  Order.swift
//  Ordination
//
//  Created by Bruno da Luz on 8/29/16.
//  Copyright © 2016 Bruno da Luz. All rights reserved.
//

import Foundation

enum Segment: Int {
    case Deselected = -1, Title = 0, Author = 1, EditionYear = 2
}

enum OrderBy: Int {
    case ASC = 0, DESC = 1
}
