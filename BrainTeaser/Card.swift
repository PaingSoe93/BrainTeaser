//
//  Card.swift
//  BrainTeaser
//
//  Created by Paing Soe on 8/5/16.
//  Copyright © 2016 Paing Soe. All rights reserved.
//

import UIKit

class Card: UIView {

    @IBOutlet weak var shadeImageView: UIImageView!
    
    let shade = ["shade", "shade1", "shade2"]
    
    var currentShade : String!
    
    @IBInspectable var cornerRadius: CGFloat = 3.0 {
        didSet {
            setupView()
        }
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
    
    override func awakeFromNib() {
        setupView()
        selectShade()
    }
    
    func setupView(){
        self.layer.cornerRadius = cornerRadius
        self.layer.shadowOpacity = 0.8
        self.layer.shadowRadius = 5.0
        self.layer.shadowOffset = CGSizeMake(0.0, 2.0)
        self.layer.shadowColor = UIColor(red: 157.0/255.0, green: 157.0/255.0, blue: 157.0/255.0, alpha: 1.0).CGColor
        self.setNeedsLayout()
    }
    
    func selectShade(){
        currentShade = shade[Int(arc4random_uniform(3))]
        shadeImageView.image = UIImage(named: currentShade)
    }
}
