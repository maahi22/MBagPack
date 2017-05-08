//
//  DbHelper.swift
//  MBagPack
//
//  Created by Maahi on 08/05/17.
//  Copyright © 2017 Maahi. All rights reserved.
//

import UIKit
import EventKit
import CoreData

class DbHelper: NSObject {
    
    
    static let sharedInstance = DbHelper()
    private override init() {}


    
    public func AddTripList (tripData :NSDictionary , callback:((_ Result :Bool) -> Void)){
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.getContext()
        
        //retrieve the entity that we just created
        let entity =  NSEntityDescription.entity(forEntityName: "PlaceList", in: context)
        let manageObj = NSManagedObject(entity: entity!, insertInto: context)
        
        //set the entity values
        manageObj.setValue(tripData.value(forKey: "tripType"), forKey: "tripType")
        manageObj.setValue(tripData.value(forKey: "tripName"), forKey: "tripName")
        manageObj.setValue(tripData.value(forKey: "travelerGender"), forKey: "travelerGender")
        manageObj.setValue(tripData.value(forKey: "temprature"), forKey: "temprature")
        manageObj.setValue(tripData.value(forKey: "duration"), forKey: "duration")
        
        //save the object
        do {
            try context.save()
            print("saved!")
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        } catch {
            
        }
        
    
        callback(true)
    
    }
    
    
    public func AddCategory (catData :NSDictionary , callback:((_ Result :Bool) -> Void)){
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.getContext()
        
        //retrieve the entity that we just created
        let entity =  NSEntityDescription.entity(forEntityName: "CategoryList", in: context)
        let manageObj = NSManagedObject(entity: entity!, insertInto: context)
        
        //set the entity values
        manageObj.setValue(catData.value(forKey: "categoryType"), forKey: "categoryType")
        manageObj.setValue(catData.value(forKey: "categoryname"), forKey: "categoryname")
        
        
        //save the object
        do {
            try context.save()
            print("saved!")
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        } catch {
            
        }
        
        
        callback(true)
        
    }
    
    public func AddItems (itemData :NSDictionary , callback:((_ Result :Bool) -> Void)){
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.getContext()
        
        //retrieve the entity that we just created
        let entity =  NSEntityDescription.entity(forEntityName: "ItemList", in: context)
        let manageObj = NSManagedObject(entity: entity!, insertInto: context)
        
        //set the entity values
        manageObj.setValue(itemData.value(forKey: "status"), forKey: "status")
        manageObj.setValue(itemData.value(forKey: "quantity"), forKey: "quantity")
        manageObj.setValue(itemData.value(forKey: "notes"), forKey: "notes")
        manageObj.setValue(itemData.value(forKey: "itemName"), forKey: "itemName")
        
        //save the object
        do {
            try context.save()
            print("saved!")
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        } catch {
            
        }
        
        
        callback(true)
        
    }
    
    
    
    //Getting Data
    public func getPlaceListFromDB() -> NSArray{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.getContext()
        let sort : NSSortDescriptor = NSSortDescriptor(key: "tripName", ascending: true)
        
        //create a fetch request, telling it about the entity
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "PlaceList")
        fetchRequest.sortDescriptors = [sort]
        // Helpers
        var result = [NSManagedObject]()
        
        do {
            // Execute Fetch Request
            let records = try context.fetch(fetchRequest)
            
            if let records = records as? [NSManagedObject] {
                result = records
            }
            
        } catch {
            print("Unable to fetch managed objects for entity .")
        }
        
        
        return result as NSArray;
        
    }
}
