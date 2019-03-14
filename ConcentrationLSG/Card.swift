//
//  Card.swift
//  ConcentrationLSG
//  Copyright © 2019 CFGS La Salle Gracia. All rights reserved.
//

import Foundation

struct Card {
    var isFadeUp = false
    var isMatched = false
    var emoji:String
    
    
    init(emoji:String){
        self.emoji = emoji
    }
}
