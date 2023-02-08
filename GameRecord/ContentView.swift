//
//  ContentView.swift
//  GameRecord
//
//  Created by Abdoulaye Aliou SALL on 08/02/2023.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("nichName") var nickName = ""
    @State var score = 0
    @AppStorage("bestScore") var bestScore = 0
    @AppStorage("bestNickName") var bestNickName = ""
    @State var gameIsInProgress = false
    var body: some View {
        VStack {
            EditableView(title: "pseudo", editedTexte: $nickName)
            HStack{
                if score >= bestScore && score != 0{
                    Image (systemName: "flame")
                }
                Text("score : \(score)")
                    .padding()
            }.font(.title)
            
            if bestScore > 0 {
                HStack{
                    Image(systemName: "star")
                    Text("\(bestNickName) - \(bestScore)")
                    Image(systemName: "star")
                }
            }
            
            if gameIsInProgress == true {
                Image(systemName: "plus.square")
                    .font(.title)
                    .onTapGesture{
                        score = score + 1
                    }
            }
            Spacer()
            if gameIsInProgress == false {
                Button("Nouvelle partie"){
                    score = 0
                    gameIsInProgress = true
                    Timer.scheduledTimer(withTimeInterval: 10.0, repeats: false){(_) in
                        gameIsInProgress = false
                        if score > bestScore {
                            bestScore = score
                            bestNickName = nickName
                        }
                        
                    }
                }.padding()
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
