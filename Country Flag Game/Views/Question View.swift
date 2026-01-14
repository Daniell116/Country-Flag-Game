//
//  Question View.swift
//  Country Flag Game
//
//  Created by daniell Escareno 1/7/26.
// this is normal to crash

import SwiftUI

struct Question_View: View {
    @Environment(GameManager.self) var gameManager
    var body: some View {
        VStack(spacing: 20) {
            if gameManager.playingGame {
                HStack {
                    Text("Country Flag Game")
                        .fontWeight(.heavy)
                        .padding()
                    Spacer()
                    Text("\(gameManager.index) out of \(gameManager.questions.count)")
                        .padding()
                }
                ProgressBar(progress: gameManager.progress)
                VStack(spacing: 10) {
                    Text("Which country's flag is this?")
                        .font(.title)
                    Image(gameManager.country)
                        .resizable()
                        .frame(width: 300, height: 200)
                    ForEach(gameManager.answerChoices) { answer in
                        AnswerRow(answer: answer)
                    }
                }
                Button {
                    gameManager.goToNextQuestion()
                } label: {
                    CustomButton(text: "Next", background: gameManager.answerSelected ? .yellow : .gray)
                }
                .disabled(!gameManager.answerSelected)
                Spacer()
            }
            else {
                Text("Country Flag Game")
                    .font(.title)
                    .fontWeight(.heavy)
                Text("Congrats! you've completed the game!")
                Text("You scored \(gameManager.score) out of \(gameManager.questions.count)")
                Button {
                    gameManager.reset()
                } label: {
                    CustomButton(text: "Play Again")
                }
            }
        }
        .foregroundColor(.yellow)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.cyan)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Question_View()
}
