//
//  Meal.swift
//  FoodTracker
//
//  Created by Kamil Wrobel on 8/12/18.
//  Copyright © 2018 Kamil Wrobel. All rights reserved.
//

import UIKit
import os.log

class Meal: NSObject, NSCoding {
    
    //MARK: Properties
    
    var name: String
    var image: UIImage?
    var rating: Int
    
    
    //MARK: Archiving Paths
    
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("meals")
    
    
    //MARK: Types
    
    struct PropertyKeys {
        static let name   = "name"
        static let image  = "image"
        static let rating = "rating"
    }
    
    
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
        self.name   = name
        self.image  = image
        self.rating = rating
        
        
        
    }
    
    //MARK: NSCoding
    
    
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKeys.name)
        aCoder.encode(image, forKey: PropertyKeys.image)
        aCoder.encode(rating, forKey: PropertyKeys.rating)
    }
    
    
    required convenience init?(coder aDecoder: NSCoder) {
        // The name is required. If we cannot decode a name string, the initializer should fail.
        guard let name = aDecoder.decodeObject(forKey: PropertyKeys.name) as? String else {
            os_log("Unable to decodehe nameor a Mealbject.", log: OSLog.default, type: .debug)
            return nil
        }
        
        // Because photo is an optional property of Meal, just use conditional cast.
        let photo = aDecoder.decodeObject(forKey: PropertyKeys.image) as? UIImage
        
        let rating = aDecoder.decodeInteger(forKey: PropertyKeys.rating)
        
        // Must call designated initializer.
        self.init(name: name, image: photo, rating: rating)
        
    }
    
    
    
}
