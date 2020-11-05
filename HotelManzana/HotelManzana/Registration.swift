//
//  Registration.swift
//  HotelManzana
//
//  Created by Stomach Diego on 11/5/20.
//  Copyright © 2020 Mansur Nasybullin. All rights reserved.
//

import Foundation

struct Registration {
    var firstName: String
    var lastName: String
    var emailAddress: String
    
    var checkInDate: Date
    var checkOutDate: Date
    var numberOfAdults: Int
    var numberOfChildren: Int
    
    var roomType: RoomType
    var wifi: Bool
}
