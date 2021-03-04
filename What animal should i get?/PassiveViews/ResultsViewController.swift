//
//  ResultsViewController.swift
//  What animal should i get?
//
//  Created by Tanya on 15.02.2021.
//

import UIKit

 protocol ResultsViewProtocol: class {
    func updateResult()
    func updateUI(with animal: AnimalType)
}

class ResultsViewController: UIViewController {
    @IBOutlet var animalTypeLabel: UILabel!
    @IBOutlet var discriptionLabel: UILabel!
    
    var answers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        updateResult()
    }
}

extension ResultsViewController: ResultsViewProtocol {
    internal func updateResult() {
        
        var frequencyOfAnimals: [AnimalType: Int] = [:]
        let animals = answers.map { $0.type }
        
        for animal in animals {
            if let animalTypeCount = frequencyOfAnimals[animal] {
                frequencyOfAnimals.updateValue(animalTypeCount + 1, forKey: animal)
            } else {
                frequencyOfAnimals[animal] = 1
            }
        }
        
        let sortedFrequencyOfAnimal = frequencyOfAnimals.sorted { $0.value > $1.value }
        guard let mostFrequencyAnimal = sortedFrequencyOfAnimal.first?.key else { return }
        
        updateUI(with: mostFrequencyAnimal)
    }
    
    internal func updateUI(with animal: AnimalType) {
        animalTypeLabel.text = "Your animal - \(animal.rawValue)!"
        discriptionLabel.text = animal.definitionAnimal
    }
}


