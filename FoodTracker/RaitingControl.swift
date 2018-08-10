//
//  RaitingControl.swift
//  FoodTracker
//
//  Created by Kamil Wrobel on 8/10/18.
//  Copyright © 2018 Kamil Wrobel. All rights reserved.
//

import UIKit

class RaitingControl: UIStackView {

    //MARK: Initalization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init(coder: NSCoder) {
        super .init(coder: coder)
        setupButton()
    }
    
    //MARK: Private Methods
    
    private func setupButton() {
        // create button
        let button = UIButton()
        button.backgroundColor = UIColor.red
        
        // add constraints
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        button.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
        
        // add the button to the stack
        addArrangedSubview(button)
        
    }

}
