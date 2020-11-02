//
//  Emoji.swift
//  EmojiDictionary
//
//  Created by Stomach Diego on 11/2/20.
//  Copyright © 2020 Mansur Nasybullin. All rights reserved.
//

import Foundation

class Emoji {
    var symbol: String
    var name: String
    var description: String
    var usage: String
    
    init(symbol: String, name: String, description: String, usage: String) {
        self.symbol = symbol
        self.name = name
        self.description = description
        self.usage = usage
    }
}
