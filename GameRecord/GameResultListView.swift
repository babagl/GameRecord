//
//  GameResultListView.swift
//  GameRecord
//
//  Created by Abdoulaye Aliou SALL on 09/02/2023.
//

import SwiftUI

struct GameResultListView: View {
    let resultList : [GameResult]
    var body: some View {
        List()    }
}

struct GameResultListView_Previews: PreviewProvider {
    static var previews: some View {
        GameResultListView(resultList: [
        GameResult(playerName: "Baba Galle", score: 30),
        GameResult(playerName: "House", score: 40),
        GameResult(playerName: "Abdoulaye Aliou SALL", score: 100),
        ])
    }
}
