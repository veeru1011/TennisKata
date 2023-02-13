//
//  File.swift
//  TennisKata
//
//  Created by mac on 13/02/23.
//

import Foundation

struct Player {
    var name : String
    private(set) var score: Int = 0
    
    init(name:String) {
        self.name = name
    }
    
    mutating func updateScore() {
        self.score += 1
    }
    
    mutating func resetScore() {
        self.score = 0
    }
}
