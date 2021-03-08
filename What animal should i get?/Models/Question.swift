//
//  Question.swift
//  What animal should i get?
//
//  Created by Tanya on 13.02.2021.
//

struct Question: Decodable {
    let text: String
    let type: ResponseType
    let answers: [Answer]
}

enum ResponseType: String, Decodable {
    case single
    case multiple
    case ranged
}

extension Question {
    static func getQuestions() -> [Question] { 
        return [
            Question(
                text: "How do you like to relax?",
                type: .single,
                answers: [
                    Answer(text: "Actively", type: .cat),
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
