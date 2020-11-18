//
//  Order.swift
//  Restaurant
//
//  Created by Stomach Diego on 11/18/20.
//  Copyright © 2020 Mansur Nasybullin. All rights reserved.
//

import Foundation

struct Order: Codable {
    var menuItems: [MenuItem]
    
    init(menuItems: [MenuItem] = []) {
        self.menuItems = menuItems
    }
}
