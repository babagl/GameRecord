//
//  GameResult.swift
//  GameRecord
//
//  Created by Abdoulaye Aliou SALL on 09/02/2023.
//

import Foundation

struct GameResult {
    let playerName : String
    let score:Int
    
    init(playerName: String, score: Int) {
        self.playerName = playerName
        self.score = score
    }
}
