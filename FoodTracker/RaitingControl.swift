//
//  RaitingControl.swift
//  FoodTracker
//
//  Created by Kamil Wrobel on 8/10/18.
//  Copyright © 2018 Kamil Wrobel. All rights reserved.
//

import UIKit

class RaitingControl: UIStackView {
    
    //MARK: Properties
    
    private var ratingButtons = [UIButton]()
    
    var rating = 0
    

    //MARK: Initalization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init(coder: NSCoder) {
        super .init(coder: coder)
        setupButton()
    }
    
    //MARK: Button Action
    // in order for the  button to be created (#selector) the "@objc" was added by compailer in front of this function
    @objc func ratingButtonTapped(button: UIButton) {
        print("button pressed 👍🏻")
    }
    
    
    
    
    //MARK: Private Methods
    
    private func setupButton() {
        
        for _ in 1..<5 {
            // create button
            let button = UIButton()
            button.backgroundColor = UIColor.red
            
            // add constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
            button.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
            
            //set up the button action
            button.addTarget(self, action: #selector(RaitingControl.ratingButtonTapped(button:)), for: .touchUpInside)
            
            
            // add the button to the stack
            addArrangedSubview(button)
            
            // add new button to the rating button array
            ratingButtons.append(button)
        }
        
    }

}
