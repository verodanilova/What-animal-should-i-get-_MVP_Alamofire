//
//  QuestionsPresenterProtocol.swift
//  What animal should i get?
//
//  Created by Tanya on 17.02.2021.
//

import Foundation

protocol QuestionsPresenterProtocol {
    init(viewQuestion: QuestionViewProtocol, modelQuestion: Question)
}

class QuestionsPresenter: QuestionsPresenterProtocol {
    unowned private let viewQuestion: QuestionViewProtocol
    private let modelQuestion: Question
    
    required init(viewQuestion: QuestionViewProtocol, modelQuestion: Question) {
        self.viewQuestion = viewQuestion
        self.modelQuestion = modelQuestion
    }
}


