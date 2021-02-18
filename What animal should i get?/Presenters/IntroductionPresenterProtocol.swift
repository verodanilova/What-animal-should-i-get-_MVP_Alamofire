//
//  File.swift
//  What animal should i get?
//
//  Created by Tanya on 17.02.2021.
//

protocol IntroductionPresenterProtocol {
    init(_: IntroductionViewController)
    func unwind()
}

class IntroductionPresenter: IntroductionPresenterProtocol {
    required init(_: IntroductionViewController) {
    }
    func unwind() {
    }
}
