//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Gabrielle Polite on 12/24/24.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)  // whether it is the first, second, or third flag
    
    // needed so we can update in flagTapped
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    var body: some View {
        // needed to make the background grey
        ZStack {
            Color.gray
                .ignoresSafeArea()
            
            // seperate score from flags
            VStack {
                
                Spacer()
                
                // game title
                Text("Guess the Flag")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                // seperate words from flag pictures
                VStack(spacing: 15) {
                    
                    // words
                    VStack {
                        Text("Tap the flag of")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                        Text(countries[correctAnswer])  // name of correct country
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundStyle(.black)
                    }
                    
                    // three flag pictures
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .clipShape(.rect(cornerRadius: 10))
                                .shadow(radius: 5)
                        }
                        
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                // show score
                Text("Score: ???")
                    .font(.title)
                    .fontWeight(.bold)
                
                Spacer()
            }
            .padding()
            
        }
        // button to keep the game going
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is ???")
        }
    }
    
    // update the score when the user makes a guess
    func flagTapped (_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Incorrect"
        }
        
        showingScore = true
    }
    
    // ask another question to keep the game going
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

#Preview {
    ContentView()
}
