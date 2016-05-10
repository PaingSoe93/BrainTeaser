//
//  CardVC.swift
//  BrainTeaser
//
//  Created by Paing Soe on 8/5/16.
//  Copyright © 2016 Paing Soe. All rights reserved.
//

import UIKit
import pop

class CardVC: UIViewController {
    
    @IBOutlet weak var yesBtn : CustomButton!
    @IBOutlet weak var noBtn : CustomButton!
    @IBOutlet weak var titlelbl : UILabel!
    
    var currentCard : Card!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentCard = createCardFromNib()
        currentCard.center = AnimationEngine.screenCenterPosition
        
        self.view.addSubview(currentCard)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidDisappear(true)
        
    }
    
    @IBAction func yesPressed(sender: UIButton){
        if sender.titleLabel?.text == "YES" {
            checkAnswer()
        }else{
            titlelbl.text = "Does this card match the previous?"
        }
        
        showNextCard()
    }
    
    @IBAction func noPressed(sender: AnyObject){
        checkAnswer()
        showNextCard()
    }
    
    func showNextCard(){
        if let current = currentCard {
            let cardToRemove = current
            currentCard = nil
            
            AnimationEngine.animatedToPosition(current, position: AnimationEngine.offScreenLeftPosition, completion: { (anim : POPAnimation!, finished : Bool) in
                cardToRemove.removeFromSuperview()
           })
        }
        
        if let next = createCardFromNib() {
            next.center = AnimationEngine.offScreenRightPosition
            self.view.addSubview(next)
            currentCard = next
            
            if noBtn.hidden {
                noBtn.hidden = false
                yesBtn.setTitle("YES", forState: .Normal)
            }
            
            AnimationEngine.animatedToPosition(currentCard, position: AnimationEngine.screenCenterPosition, completion: { (anime : POPAnimation!, finished: Bool) in
                
            })
        }
    }
    
    func createCardFromNib() -> Card?{
        return NSBundle.mainBundle().loadNibNamed("Card", owner: self, options: nil)[0] as? Card
    }
    
    func checkAnswer(){
        
    }
}
