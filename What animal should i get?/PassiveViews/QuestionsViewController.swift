//
//  QuestionsViewController.swift
//  What animal should i get?
//
//  Created by Tanya on 15.02.2021.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    @IBOutlet var questionLabel: UILabel!
    
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var rangedStackView: UIStackView!
    
    @IBOutlet var singleButtons: [UIButton]!
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var multipleSwitches: [UISwitch]!
    @IBOutlet var rangedLabels: [UILabel]!
    
    @IBOutlet var rangedSlider: UISlider! {
        didSet{
            let answersCount = Float(questions[questionIndex].answers.count - 1)
            rangedSlider.maximumValue = answersCount
        }
    }
    
    @IBOutlet var questionProgressView: UIProgressView!
    
    private let questions = Question.getQuestions()
    private var questionIndex = 0
    private var answersChoosen: [Answer] = []
    private var currentAnswers: [Answer] {
        questions[questionIndex].answers
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI() // скрываем стек
    }
    
    @IBAction func singleButtonAnswerPressed(_ sender: UIButton) {
        guard let currentIndex = singleButtons.firstIndex(of: sender) else {
            return
        }
        
        let currentAnswer = currentAnswers[currentIndex]
        answersChoosen.append(currentAnswer)
        
        nextQuestion()
    }
    
    @IBAction func multipleAnswerPressed() {
        for (multipleSwitch, answer) in zip(multipleSwitches, currentAnswers) {
            if multipleSwitch.isOn {
                answersChoosen.append(answer)
            }
        }
        nextQuestion()
    }
    
    @IBAction func rangedAnswerButtonPressed() {
        let index = lrintf(rangedSlider.value)
        answersChoosen.append(currentAnswers[index])
        // nextQuestion()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultsVC = segue.destination as! ResultsViewController
        resultsVC.answers = answersChoosen
        
    }
}

extension QuestionsViewController { // контроллер для приватных методов
    private func updateUI() { // скрывает стек вью 
        
        for stackView in [singleStackView, multipleStackView, rangedStackView] {
            stackView?.isHidden = true // скрываем стек вью
        }
        
        let currentQuestion = questions[questionIndex] // определяем текущий вопрос
        questionLabel.text = currentQuestion.text
        
        let totalProgress = Float(questionIndex) / Float(questions.count) // расчитываем програсс вью
        
        questionProgressView.setProgress(totalProgress, animated: true) // потом устанавливаем прогресс вью
        
        title = "Question № \(questionIndex + 1) in \(questions.count)" // указываем номер влпроса
        
        showCurrentAnswers(for: currentQuestion.type)
    }
    
    private func showCurrentAnswers(for type: ResponseType) { // показываем текущие ответы
        switch type { // в зависимости от категории вопросов - ответы
        case .single: showSingleAnswers(with: currentAnswers)
        case .multiple: showMultipleAnswers(with: currentAnswers)
        case .ranged: showRangedAnswers(with: currentAnswers)
        }
    }
    
    private func showSingleAnswers(with answers: [Answer]) { // методы для отображения ответов
        singleStackView.isHidden = false // делаем видимым стек вью
        
        for (button, answer) in zip(singleButtons, answers) {
            button.setTitle(answer.text, for: .normal)
        }
    }
    
    private func showMultipleAnswers(with answers: [Answer]) {
        multipleStackView.isHidden = false
        
        for (label, answer) in zip(multipleLabels, answers) {
            label.text = answer.text
        }
    }
    
    private func showRangedAnswers(with answers: [Answer]) {
        rangedStackView.isHidden = false
        rangedLabels.first?.text = answers.first?.text
        rangedLabels.last?.text = answers.last?.text
    }
    
    private func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "resultSegue", sender: nil)
        }
    }
}


