//
//  ViewController.swift
//  ConcentrationLSG
//  Copyright © 2019 CFGS La Salle Gracia. All rights reserved.
//

import UIKit

class BoardViewController: UIViewController {
    
    var concentration: Concentration?
    var theme:String?
    var flips: Int = 0
    @IBOutlet var outletCollection: [UIButton]!
    
    @IBOutlet weak var labelFlips: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func actionButton(_ sender: UIButton) {
        switch sender.tag {
        case 1...16:
            if let newConcentration = concentration {
            newConcentration.chooseCard(at: sender.tag - 1)
            
            if (newConcentration.indexOfOneAndOnlyFaceUpCard == nil){
                outletCollection[sender.tag - 1].setTitle(newConcentration.cards[sender.tag - 1].emoji, for: UIControl.State.normal)
                outletCollection[sender.tag - 1    ].backgroundColor = UIColor.clear
                
            } else {
                for iterator in newConcentration.cards.indices{
                    if (!newConcentration.cards[iterator].isFadeUp && !newConcentration.cards[iterator].isMatched){
                        outletCollection[iterator].setTitle("", for: UIControl.State.normal)
                        outletCollection[iterator].backgroundColor = UIColor.gray
                    }
                }
                outletCollection[sender.tag - 1].setTitle(newConcentration.cards[sender.tag - 1].emoji, for: UIControl.State.normal)
                outletCollection[sender.tag - 1].backgroundColor = UIColor.clear
            }
                    flips+=1
                    labelFlips.text = "Flips: \(flips)"
            }
            
            
        default:
            break
        }
    }
}

