//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Kamil Wrobel on 8/9/18.
//  Copyright © 2018 Kamil Wrobel. All rights reserved.
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
    

    //MARK: Meal Class Tests
    
    // Confirm that the Meal initializer returns a Meal object when passed valid parameters.
    func testMealInitalizationSucceds() {
        // Zero rating
        let zeroRatingMeal = Meal.init(name: "Zero", image: nil, rating: 0)
        XCTAssertNotNil(zeroRatingMeal)
        
        // Highest Positive rating
        let positiveRatingMeal = Meal.init(name: "Positive", image: nil, rating: 5)
        XCTAssertNotNil(positiveRatingMeal)
        
    }
    
    // Confirm that the Meal initialier returns nil when passed a negative rating or an empty name.
    func testMealInitalizationFail() {
        // negative rating
        let negativeRatingMeal = Meal.init(name: "Negative", image: nil, rating: -1)
        XCTAssertNil(negativeRatingMeal)
        
        //rating exceeds maximum
        let largerRatingMeal = Meal.init(name: "Larger", image: nil, rating: 6)
        XCTAssertNil(largerRatingMeal)
        
        // empty string
        let emptyStringMeal = Meal.init(name: "", image: nil, rating: 0)
        XCTAssertNil(emptyStringMeal)
    }
    
    
}











