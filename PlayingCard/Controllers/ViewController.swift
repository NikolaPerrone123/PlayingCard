//
//  ViewController.swift
//  PlayingCard
//
//  Created by Nikola Popovic on 3/9/18.
//  Copyright © 2018 Nikola Popovic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var deck = PlayingCardDeck()
        
        for _ in 1...10 {
            if let card = deck.draw() {
                print("\(card.description)")
            }
        }
    }
}

