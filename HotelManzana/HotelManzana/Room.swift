//
//  Room.swift
//  HotelManzana
//
//  Created by Stomach Diego on 11/5/20.
//  Copyright © 2020 Mansur Nasybullin. All rights reserved.
//

import Foundation

struct RoomType: Equatable {
    var id: Int
    var name: String
    var shortName: String
    var price: Int
}

func ==(lhs: RoomType, rhs: RoomType) -> Bool {
    return lhs.id == rhs.id
}
