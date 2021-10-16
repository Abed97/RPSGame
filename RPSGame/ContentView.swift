//
//  ContentView.swift
//  RPSGame
//
//  Created by Abed Atassi on 2021-09-12.
//

import SwiftUI

struct ContentView: View {
    
    let moves = ["Rock", "Paper", "Scissors"]
    @State private var appMsg = ""
    @State private var score = 0
    @State private var roundnum = 1
    @State private var option = Int.random(in: 0...2)
    @State private var userChoice = ""
    @State private var isWin = Bool.random()
    @State private var showScore = false
    var body: some View {
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.black]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack(spacing: 40) {
                
                Text("Opponent's move: \r \(moves[option])")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .multilineTextAlignment(.center)
                
                VStack {
                    Text("Round objective:")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                    
                    if (isWin) {
                        Text("Win")
                            .foregroundColor(.green)
                            .font(.largeTitle)
                            .fontWeight(.black)
                    } else {
                        Text("Lose")
                            .foregroundColor(.red)
                            .font(.largeTitle)
                            .fontWeight(.black)
                    }
                }
                
                if roundnum % 10 == 0 {
                    
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.black)

                }
                
                Spacer()
                
                ForEach(0 ..< 3) { move in
                    Button(action: {
                        self.checkMovePressed(move)
                    }) {
                        Text("\(moves[move])")
                            .bold()
                            .foregroundColor(.white)
                            .font(.largeTitle)
                    }.alert(isPresented: $showScore) {
                        Alert(title: Text(appMsg), message: Text("Score: \(score)") , dismissButton: .default(Text("Continue")) {
                            self.nextRound()
                        })
                    }
                }
            }
        }
    }
    
    func checkMovePressed(_ move: Int) {
        
        if isWin {
            if ((move == option + 1) || (move == 0 && option == 2)) {
                appMsg = "Correct"
                score += 1
            } else {
                appMsg = "Wrong"
                score -= 1
            }
            
        } else {
            if ((move == option - 1) || (move == 2 && option == 0)) {
                appMsg = "Correct"
                score += 1
            } else {
                appMsg = "Wrong"
                score -= 1
            }
        }
        showScore = true
        
    }
        
    func nextRound() {
        roundnum += 1
        option = Int.random(in: 0...2)
        isWin = Bool.random()
        
        if roundnum == 10 {
        roundnum = 0
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
