//
//  Question.swift
//  Country Flag Game
//
//  Created by daniell Escareno on 1/6/26.
//

import Foundation
struct Answer: Identifiable {
    var id = UUID()
    var text: String
    var isCorrect: Bool
}
struct Question: Identifiable {
    var id = UUID()
    var correctAnswer: Answer
    var incorrectAnswers: [Answer]
}
