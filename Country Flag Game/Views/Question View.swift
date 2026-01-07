//
//  Question View.swift
//  Country Flag Game
//
//  Created by daniell Escareno on 1/7/26.
//

import SwiftUI

struct Question_View: View {
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Country Flag Game")
                    .fontWeight(.heavy)
                    .padding()
                Spacer()
                Text("1 out of 3")
                    .padding()
            }
            ProgressBar(progress: 50)
            VStack(spacing: 10) {
                Text("Which country's flag is this?")
                    .font(.title)
                Image("Italy")
                    .resizable()
                    .frame(width: 300, height: 200)
                AnswerRow(answer: Answer(text: "France", isCorrect: false))
                AnswerRow(answer: Answer(text: "Germany", isCorrect: false))
                AnswerRow(answer: Answer(text: "Italy", isCorrect: true))
                AnswerRow(answer: Answer(text: "England", isCorrect: false))
            }
            CustomButton(text: "Next")
            Spacer()
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
