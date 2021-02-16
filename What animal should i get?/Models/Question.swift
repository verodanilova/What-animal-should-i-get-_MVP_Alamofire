//
//  Question.swift
//  What animal should i get?
//
//  Created by Tanya on 13.02.2021.
//

struct Question {
    let text: String // вопросы
    let type: ResponseType // тип вопроса
    let answers: [Answer] // каждый вопрос уже будет содержать ответы
}

enum ResponseType {
    case single // одиночные
    case multiple // множественные
    case ranged // диапозон
}

extension Question {
    static func getQuestions() -> [Question] { // метод который возвращает массив с набором данных - статик - метод типа данных /мы его не сможем вызвать из экземпляра модели /надо обратиться к самой модели для вызова метода
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
