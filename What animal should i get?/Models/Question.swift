//
//  Question.swift
//  What animal should i get?
//
//  Created by Tanya on 13.02.2021.
//

enum ResponseType {
    case single // одиночные
    case multiple // множественные
    case ranged // диапозон
}

struct Question {
    let text: String // вопросы
    let type: ResponseType // тип вопроса
    let answers: [Answer] // ответы
}

extension Question {
    static func getQuestions() -> [Question] {
        return [
            Question(
                text: "How do you like to relax?",
                type: .single,
                answers: [
                    Answer(text: "Actively", type: .dog),
                    Answer(text: "Passively", type: .fish),
                    Answer(text: "Always different", type: .cat),
                    Answer(text: "Rest - is not mine", type: .mouse)
                ]),
            Question(
                text: "What food do you prefer?",
                type: .multiple,
                answers: [
                    Answer(text: "Сheese", type: .mouse),
                    Answer(text: "I eat everything", type: .dog),
                    Answer(text: "Fish", type: .cat),
                    Answer(text: "Vegetable", type: .fish)
                ]),
            Question(
                text: "Do you like to hug?",
                type: .ranged,
                answers: [
                    Answer(text: "I hate", type: .mouse),
                    Answer(text: "I'm nervous", type: .cat),
                    Answer(text: "All the same", type: .fish),
                    Answer(text: "Love", type: .dog)
                ])
        ]
    }
}
