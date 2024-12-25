//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Gabrielle Polite on 12/24/24.
//

import SwiftUI

struct ContentView: View {
    var COUNTRIES_LIST = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"]
    var correctAnswer = Int.random(in: 0...2)  // whether it is the first, second, or third flag
    
    var body: some View {
        // needed to make the background blue
        ZStack {
            Color.blue
                .ignoresSafeArea()
            
            // seperate words from flag pictures
            VStack(spacing: 30) {
                
                // words
                VStack {
                    Text("Type the flag of")
                        .foregroundStyle(.white)
                    Text(COUNTRIES_LIST[correctAnswer])
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                }
                
                // three flag pictures
                ForEach(0..<3) { number in
                    Button {
                        // when you press the button
                    } label: {
                        Image(COUNTRIES_LIST[number])
                    }
                    
                }
            }
        }
        

    }
}

#Preview {
    ContentView()
}
