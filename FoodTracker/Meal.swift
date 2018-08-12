//
//  Meal.swift
//  FoodTracker
//
//  Created by Kamil Wrobel on 8/12/18.
//  Copyright © 2018 Kamil Wrobel. All rights reserved.
//

import UIKit

class Meal {
    
    //MARK: Properties
    
    var name: String
    var image: UIImage?
    var rating: Int
    
    
    
    //MARK: Initalization
    
    init?(name: String, image: UIImage?, rating: Int){
        
        // The name must not be empty
        guard !name.isEmpty else {
            return nil
        }
        
        //the rating must be between 0 and 5
        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }
        
        // initialize stored properties
        self.name = name
        self.image = image
        self.rating = rating
        
      
        
    }
    
    
    
    
}
