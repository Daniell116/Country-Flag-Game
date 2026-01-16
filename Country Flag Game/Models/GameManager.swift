//
//  GameManager.swift
//  Country Flag Game
//
//  Created by daniell Escareno on 1/7/26.
//

import Foundation
import SwiftUI

@Observable
class GameManager {
    var questions = [Question]()
    private(set) var index = 0
    private(set) var playingGame = false
    private(set) var answerSelected = false
    private(set) var country = ""
    private(set) var answerChoices = [Answer]()
    private(set) var progress: CGFloat = 0.0
    private(set) var score = 0

    init() {
        reset()
    }
    
    func reset() {
        loadQuestions()
        questions = questions.shuffled()
        index = 0
        score = 0
        progress = 0.0
        playingGame = true
        goToNextQuestion()
    }
    
    func loadQuestions() {
        let countries = Data().counrties
        if countries.count < 4 {
            print("There are only \(countries.count) countries listed in the data (must be at least 4)")
        }
        else {
            questions.removeAll()
            for country in countries {
                if UIImage(named: country) != nil {
                    var incorrectAnswers = [String]()
                    while incorrectAnswers.count < 3 {
                        if let randomCountry = countries.randomElement(),
                           randomCountry != country,
                           !incorrectAnswers.contains(randomCountry) {
                                incorrectAnswers.append(randomCountry)
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
    
    func goToNextQuestion() {
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
    
    func selectAnswer(answer: Answer) {
        answerSelected = true
        if answer.isCorrect {
            score += 1
        }
    }
}
