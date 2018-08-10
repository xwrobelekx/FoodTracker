//
//  RaitingControl.swift
//  FoodTracker
//
//  Created by Kamil Wrobel on 8/10/18.
//  Copyright © 2018 Kamil Wrobel. All rights reserved.
//

import UIKit

@IBDesignable class RaitingControl: UIStackView {
    
    //MARK: Properties
    
    private var ratingButtons = [UIButton]()
    var rating = 0 {
        didSet {
            updateButtonSelectionStates()
        }
    }
    
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0) {
        didSet {
            setupButton()
        }
    }
    @IBInspectable var starCount: Int = 5 {
        didSet {
            setupButton()
        }
    }
    

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
        guard let index = ratingButtons.index(of: button) else {
            fatalError("The button, \(button), is not in the ratingButtons array: \(ratingButtons)")
        }
        
        // calculate the rating of selected button
        let selectedRating = index + 1
        
        if selectedRating == rating {
            // If the selected star represents the current rating, reset the rating to 0.
            rating = 0
        } else {
            // Otherwise set the rating to the selected star
            rating = selectedRating
        }
        
    }
    
    
    
    
    //MARK: Private Methods
    
    private func setupButton() {
    
        // clear any existing buttons
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        
        //load button images
        let bundle = Bundle(for: type(of: self))
        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named: "highlightedStar", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named: "emptyStar", in: bundle, compatibleWith: self.traitCollection)
        
        
        for _ in 0..<starCount {
            // create button
            let button = UIButton()
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightedStar, for: .highlighted)
            button.setImage(highlightedStar, for: [.highlighted, .selected])
            
            // add constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            //set up the button action
            button.addTarget(self, action: #selector(RaitingControl.ratingButtonTapped(button:)), for: .touchUpInside)
            
            
            // add the button to the stack
            addArrangedSubview(button)
            
            // add new button to the rating button array
            ratingButtons.append(button)
        }
        
        updateButtonSelectionStates()
        
    }
    
    private func updateButtonSelectionStates() {
        
        for (index, button) in ratingButtons.enumerated() {
            
            // If the index of a button is less than the rating, that button should be selected.
            button.isSelected = index < rating
        }
        
        
    }

}

















