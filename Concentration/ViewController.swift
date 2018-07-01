//
//  ViewController.swift
//  Concentration
//
//  Created by Naval Kishor Jha on 30/06/18.
//  Copyright © 2018 Naval. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips:\(flipCount)"
        }
    }
    var check = 0
    var visibleNo = 0
    @IBOutlet weak var prevBtn :UIButton!
    var emojiChoices = ["🎃",  "🎃","👻", "👻"]
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        //flipCountLabel.text = "Flips:\(flipCount)"
        //flipCard(withEmoj: "👻", on: sender)
        if let cardNumber = cardButtons.index(of: sender){
            print("cardNumber = \(cardNumber) and emoji :\(emojiChoices[cardNumber])")
            flipCard(withEmoj: emojiChoices[cardNumber], on: sender)
        }else{
            print("chosen card is not in cardButtons")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func flipCard(withEmoj emoji:String,on button:UIButton){
        
        check += 1
        
        if button.currentTitle == emoji{
            button.setTitle("", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.6000093013, blue: 0.2899445763, alpha: 1)
            
        }else{
            button.setTitle(emoji, for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            if check == 1{
                prevBtn = button
            }
        }
        print("flipCard(withEmoji:\(emoji)) and currentEmoji: \(String(describing: button.currentTitle))")
        if check == 2{
            let delay = DispatchTime.now() + .seconds(2)
            DispatchQueue.main.asyncAfter(deadline: delay) {
                
                print("checking on second click \(self.check)")
                if button.currentTitle?.count != 0 && self.prevBtn.currentTitle?.count != 0 && button.currentTitle == self.prevBtn.currentTitle {
                    
                    button.isHidden = true
                    self.prevBtn.isHidden = true
                    self.visibleNo += 2
                    
                    if self.visibleNo == self.cardButtons.count{
                        for cardButton in self.cardButtons {
                            cardButton.isHidden = false
                            cardButton.setTitle("", for: UIControlState.normal)
                            cardButton.backgroundColor = #colorLiteral(red: 1, green: 0.6000093013, blue: 0.2899445763, alpha: 1)
                        }
                        self.visibleNo = 0
                    }
                }
                else
                {
                    button.setTitle("", for: UIControlState.normal)
                    button.backgroundColor = #colorLiteral(red: 1, green: 0.6000093013, blue: 0.2899445763, alpha: 1)
                    self.prevBtn.setTitle("", for: UIControlState.normal)
                    self.prevBtn.backgroundColor = #colorLiteral(red: 1, green: 0.6000093013, blue: 0.2899445763, alpha: 1)
                    
                }
                self.check = 0
            }
        }
        
    }
    
    
}

