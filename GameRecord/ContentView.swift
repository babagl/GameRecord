//
//  ContentView.swift
//  GameRecord
//
//  Created by Abdoulaye Aliou SALL on 08/02/2023.
//

import SwiftUI

struct ContentView: View {
    @State var score = 0
    @State var resultList:[GameResult] = []
    @AppStorage("nichName") var nickName = ""
    
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
                        userTouchedClickButton()
                    }
            }
            Spacer()
            GameResultListView(resultList: resultList)
            // boutton Pour demarrer la partie
            if gameIsInProgress == false {
                Button("Nouvelle partie"){
                    userTouchedStartButton()
                }.padding()
            }
            
            
        }
        .padding()
        
        
    }
    
    //fonction qui permet de demarrer la partie
    func userTouchedStartButton(){
        score = 0
        gameIsInProgress = true
        Timer.scheduledTimer(withTimeInterval: 10.0, repeats: false){(_) in
            gameDidfinish()
        }
    }
    
    // fonction aui permet d'incrementer le timer
    func userTouchedClickButton(){
        score = score + 1
    }
    
    //fonction pour enregister le meilleur score
    func gameDidfinish(){
        gameIsInProgress = false
        if score > bestScore {
            bestScore = score
            bestNickName = nickName
        }
        let result:GameResult = GameResult(playerName: nickName, score: score)
        resultList.append(result)
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
