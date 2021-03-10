//
//  ResultsPresenterProtocol.swift
//  What animal should i get?
//
//  Created by Tanya on 17.02.2021.
//

import Foundation

protocol ResultsPresenterProtocol {
    init(viewAnswer: ResultsViewProtocol, modelAnswer: Answer)
}

class ResultsPresenter: ResultsPresenterProtocol {
    unowned private let viewAnswer: ResultsViewProtocol
    private let modelAnswer: Answer
    
    required init(viewAnswer: ResultsViewProtocol, modelAnswer: Answer) {
        self.viewAnswer = viewAnswer
        self.modelAnswer = modelAnswer
    }
}


