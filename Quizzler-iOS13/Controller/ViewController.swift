//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var answerBtn1: UIButton!
    @IBOutlet var answerBtn2: UIButton!
    @IBOutlet var answerBtn3: UIButton!
    
    
    @IBOutlet var scoreLabel: UILabel!
    
    
    var quizBrain = QuizBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle! // True, False
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        print(userGotItRight)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()

        
        self.answerBtn1.setTitle(quizBrain.getAnswerList()[0], for: .normal)
        self.answerBtn2.setTitle(quizBrain.getAnswerList()[1], for: .normal)
        self.answerBtn3.setTitle(quizBrain.getAnswerList()[2], for: .normal)
        
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        self.answerBtn1.backgroundColor = UIColor.clear
        self.answerBtn2.backgroundColor = UIColor.clear
        self.answerBtn3.backgroundColor = UIColor.clear
    }
    
    
}

