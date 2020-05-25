//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Al Roben Adriane P. Goh on 5/23/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answer: String
    
    init(q: String, a: String) {
        text = q
        answer = a
    }
    
}
