//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Felipe Hoffmann on 2024-11-01.
//

import SwiftUI

struct ContentView: View {
    private let numberOfMatchsPerTurn: Int = 3
    
    @State private var countryFlags = ["Estonia", "France", "Germany", "Ireland", "Italy", "Monaco", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    
    @State private var countryToGuessIndex = Int.random(in: 0...2)
    @State private var isShowScore: Bool = false
    @State private var isShowEndGame: Bool = false
    @State private var scoreTitle: String = ""
    @State private var finalScoreTitle: String = ""
    @State private var score: Int = 0
    @State private var machtesPlayed: Int = 0
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.white, .gray], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess the flag")
                    .foregroundStyle(.black)
                    .font(.largeTitle.weight(.bold))
                
                VStack(spacing: 20) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.black)
                            .font(.subheadline.weight(.heavy))
                        Text(countryFlags[countryToGuessIndex])
                            .foregroundStyle(.black)
                            .font(.largeTitle.weight(.semibold))
                    }
                    ForEach(0..<3) { number in
                        Button {
                            tappedFlag(number)
                        } label: {
                            Image(countryFlags[number])
                                .clipShape(.rect(cornerRadius: 8))
                                .shadow(radius: 8)
                        }
                        
                    }
                }
                .padding(.vertical, 20)
                .frame(maxWidth: .infinity)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Text("Turn \(machtesPlayed + 1) of \(numberOfMatchsPerTurn)")
                    .foregroundStyle(.white)
                    .font(.footnote.bold())
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $isShowScore, actions: {
            Button("Done") {
                if machtesPlayed == (numberOfMatchsPerTurn) {
                    finalScoreTitle = "Your final score is: \(score)"
                    isShowEndGame.toggle()
                } else {
                    resort()
                }
            }
        }, message: {
            Text("Seu score atual é: \(score)")
        })
        .alert(finalScoreTitle, isPresented: $isShowEndGame, actions: {
            Button("Restart game") {
                resort()
                machtesPlayed = 0
                score = 0
            }
        })
    }
    
    func tappedFlag(_ number: Int) {
        if (number == countryToGuessIndex) {
            scoreTitle = "Correct!"
            score += 1
        } else {
            scoreTitle = "Wrong! That's the flag of \(countryFlags[number])."
            if score > 0 {
                score -= 1
            }
        }
        
        if machtesPlayed < (numberOfMatchsPerTurn) {
            machtesPlayed += 1
        }
        
        isShowScore.toggle()

        
    }
    
    func resort() {
        countryToGuessIndex = Int.random(in: 0...2)
        countryFlags.shuffle()
    }
}

#Preview {
    ContentView()
}
