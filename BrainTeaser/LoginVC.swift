//
//  ViewController.swift
//  BrainTeaser
//
//  Created by Paing Soe on 5/5/16.
//  Copyright © 2016 Paing Soe. All rights reserved.
//

import UIKit
import pop

class LoginVC: UIViewController {

    @IBOutlet weak var emailConstrain: NSLayoutConstraint!
    @IBOutlet weak var passwordConstraint: NSLayoutConstraint!
    @IBOutlet weak var loginButtonConstraint: NSLayoutConstraint!
    
    var animEngine: AnimationEngine!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animEngine = AnimationEngine(constraints: [emailConstrain, passwordConstraint, loginButtonConstraint])
    }

    override func viewDidAppear(animated: Bool) {
        self.animEngine.animatedOnScreen(1)
    }
   

}

