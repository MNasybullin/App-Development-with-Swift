//
//  IntermediaryModels.swift
//  Restaurant
//
//  Created by Stomach Diego on 11/18/20.
//  Copyright © 2020 Mansur Nasybullin. All rights reserved.
//

import Foundation

struct Categories: Codable {
    let categories: [String]
}

struct PreparationTime: Codable {
    let prepTime: Int
    
    enum CodingKeys: String, CodingKey {
        case prepTime = "preparation_time"
    }
}
