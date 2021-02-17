//
//  IntroductionViewController.swift
//  What animal should i get?
//
//  Created by Tanya on 12.02.2021.
//

import UIKit

private protocol IntroductionViewProtocol: class {
    func unwind(segue: UIStoryboardSegue)
}

class IntroductionViewController: UIViewController {
}

extension IntroductionViewController: IntroductionViewProtocol {
     @IBAction func unwind(segue: UIStoryboardSegue) {}
}
