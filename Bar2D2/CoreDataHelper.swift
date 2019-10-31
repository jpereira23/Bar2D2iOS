//
//  CoreDataHelper.swift
//  Bar2D2
//
//  Created by Jeffery Pereira on 10/30/19.
//  Copyright © 2019 Jeffery Pereira. All rights reserved.
//

import UIKit
import CoreData

class CoreDataHelper{
    private var managedObjects = [NSManagedObject]()
    private var appDelegate = UIApplication.shared.delegate as! AppDelegate
    private var managedContext: NSManagedObjectContext!
    private var drinkEntity: NSEntityDescription!
    init(){
        self.managedContext = self.appDelegate.persistentContainer.viewContext
        self.drinkEntity = NSEntityDescription.entity(forEntityName: "Drink", in: self.managedContext)
    }
    
    public func saveDrink(drink: DrinkClass){
        let theDrink = NSManagedObject(entity: self.drinkEntity!, insertInto: self.managedContext)
        
        theDrink.setValue(drink.getDrinkName(), forKeyPath: "drinkName")
        var slots = drink.getArrayOfSlots()
        
        theDrink.setValue(slots[0], forKeyPath: "slot1")
        theDrink.setValue(slots[1], forKeyPath: "slot2")
        theDrink.setValue(slots[2], forKeyPath: "slot3")
        theDrink.setValue(slots[3], forKeyPath: "slot4")
        theDrink.setValue(slots[4], forKeyPath: "slot5")
        theDrink.setValue(slots[5], forKeyPath: "slot6")
        theDrink.setValue(slots[6], forKeyPath: "slot7")
        theDrink.setValue(slots[7], forKeyPath: "slot8")
        theDrink.setValue(slots[8], forKeyPath: "slot9")
        theDrink.setValue(slots[9], forKeyPath: "slot10")
        theDrink.setValue(slots[10], forKeyPath: "slot11")
        theDrink.setValue(slots[11], forKeyPath: "slot12")
        theDrink.setValue(slots[12], forKeyPath: "slot13")
        theDrink.setValue(slots[13], forKeyPath: "slot14")
        theDrink.setValue(slots[14], forKeyPath: "slot15")
        
        do {
            try self.managedContext.save()
            managedObjects.append(theDrink)
        } catch let error as NSError{
            NSLog(error.localizedDescription)
        }
        
    }
    
    public func getDrinks() -> [DrinkClass]{
        var tmpDrinks: [DrinkClass] = []
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Drink")
        
        do{
            managedObjects = []
            managedObjects = try self.managedContext!.fetch(fetchRequest)
        } catch let error as NSError{
            NSLog(error.localizedDescription)
        }
        
        if managedObjects.count > 0{
            let theObjects: [Drink] = managedObjects as! [Drink]
            
            for object in theObjects{
                let drinkName: String = (object.drinkName!)
                var arrayOfSlots: [Int] = []
                let slot1: Int = (Int(object.slot1))
                arrayOfSlots.append(slot1)
                let slot2: Int = (Int(object.slot2))
                arrayOfSlots.append(slot2)
                let slot3: Int = (Int(object.slot3))
                arrayOfSlots.append(slot3)
                let slot4: Int = (Int(object.slot4))
                arrayOfSlots.append(slot4)
                let slot5: Int = (Int(object.slot5))
                arrayOfSlots.append(slot5)
                let slot6: Int = (Int(object.slot6))
                arrayOfSlots.append(slot6)
                let slot7: Int = (Int(object.slot7))
                arrayOfSlots.append(slot7)
                let slot8: Int = (Int(object.slot8))
                arrayOfSlots.append(slot8)
                let slot9: Int = (Int(object.slot9))
                arrayOfSlots.append(slot9)
                let slot10: Int = (Int(object.slot10))
                arrayOfSlots.append(slot10)
                let slot11: Int = (Int(object.slot11))
                arrayOfSlots.append(slot11)
                let slot12: Int = (Int(object.slot12))
                arrayOfSlots.append(slot12)
                let slot13: Int = (Int(object.slot13))
                arrayOfSlots.append(slot13)
                let slot14: Int = (Int(object.slot14))
                arrayOfSlots.append(slot14)
                let slot15: Int = (Int(object.slot15))
                arrayOfSlots.append(slot15)
                
                let aDrink = DrinkClass(name: drinkName, slots: arrayOfSlots)
                tmpDrinks.append(aDrink)
            }
        }
        
        return tmpDrinks
    }
}
