//
//  GameManager.swift
//  Country Flag Game
//
//  Created by daniell Escareno on 1/7/26.
//

import Foundation
import SwiftUI
internal import Combine

class GameManager: ObservableObject {
    var questions = [Question]()
    @Published private(set) var index = 0
    @Published private(set) var playingGame = false
    @Published private(set) var answerSelected = false
    @Published private(set) var country = ""
    @Published private(set) var answerChoices = [Answer]()
    @Published private(set) var progress: CGFloat = 0.0
    @Published private(set) var score = 0
    init() {
        reset()
    }
    func reset() {
        questions = questions.shuffled()
        index = 0
        score = 0
        progress = 0.0
        playingGame = true
        loadQuestions()
        GotoNextQuestion()
        
    }
    func loadQuestions() {
        let countries = Data().counrties
        if countries.count > 4 {
            print("There are only \(countries.count) countries listed in the data (must be at least 4)")
        }
        else {
            questions.removeAll()
            for country in countries {
                if UIImage(named: country ) != nil {
                    var incorrectAnswers = [String]()
                    while incorrectAnswers.count < 3 {
                        if let randomCountry = countries.randomElement() {
                            if randomCountry != country && !incorrectAnswers.contains(randomCountry) {
                                incorrectAnswers.append(randomCountry)
                            }
                        }
                    }
                    questions.append(Question(correctAnswer: Answer(text: country, isCorrect: true),
                                              incorrectAnswers: [
                                                Answer(text: incorrectAnswers[0], isCorrect: false),
                                                Answer(text: incorrectAnswers[1], isCorrect: false),
                                                Answer(text: incorrectAnswers[2], isCorrect: false)
                                              ]))
                }
                else {
                    print("\(country) image can not be found")
                }
            }
        }
    }
    func GotoNextQuestion() {
        if index < questions.count {
            answerSelected = false
            progress = CGFloat(index) / CGFloat(questions.count) * 350.0
            let nextQuestion = questions[index]
            country = nextQuestion.correctAnswer.text
            answerChoices = ([nextQuestion.correctAnswer] + nextQuestion.incorrectAnswers).shuffled()
            index += 1
        }
        else {
            playingGame = false
        }
    }
}
