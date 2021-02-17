//
//  QuestionsPresenterProtocol.swift
//  What animal should i get?
//
//  Created by Tanya on 17.02.2021.
//

import Foundation

protocol QuestionsPresenterProtocol: class {
    init(view: QuestionsPresenterProtocol, model: Question)
}

class QuestionsPresenter: QuestionsPresenterProtocol {
    
    unowned private let view: QuestionsPresenterProtocol
    private let model: Question
    
    required init(view: QuestionsPresenterProtocol, model: Question) {
        self.view = view
        self.model = model
    }
    
    
}
