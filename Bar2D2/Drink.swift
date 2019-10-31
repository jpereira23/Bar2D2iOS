//
//  Drink.swift
//  Bar2D2
//
//  Created by Jeffery Pereira on 10/30/19.
//  Copyright © 2019 Jeffery Pereira. All rights reserved.
//

import Foundation


class DrinkClass{
    private var drinkName: String!
    private var arrayOfSlots: [Int] = []
    
    
    init(name: String, slots: [Int]){
        drinkName = name
        arrayOfSlots = slots 
    }
    
    public func getDrinkName() -> String{
        return drinkName
    }
    
    public func getArrayOfSlots() -> [Int]{
        return arrayOfSlots
    }
    
    
}
