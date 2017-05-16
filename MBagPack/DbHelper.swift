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


    
    /*public func AddCategory1 (item : NSDictionary , callback:((_ Result :Bool) -> Void)){
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.getContext()
        
        
      //  for item in list {
            
            
            //retrieve the entity that we just created
            let entity =  NSEntityDescription.entity(forEntityName: "CategoryItem1", in: context)
            let manageObj = NSManagedObject(entity: entity!, insertInto: context)
            
            //set the entity values
        
        let propertyValue =  item.value(forKey: "gender") as int
        
        manageObj.setValue( Int(propertyValue), forKey: "gender")
            manageObj.setValue(item.value(forKey: "gen_Woman"), forKey: "gen_Woman")
            manageObj.setValue(item.value(forKey: "gen_Man"), forKey: "gen_Man")
            manageObj.setValue(item.value(forKey: "itemCat"), forKey: "itemCat")
        
        manageObj.setValue(item.value(forKey: "purpose"), forKey: "purpose")
        manageObj.setValue(item.value(forKey: "itemName_Eng"), forKey: "itemName_Eng")
        manageObj.setValue(item.value(forKey: "itemName_Ger"), forKey: "itemName_Ger")
        manageObj.setValue(item.value(forKey: "itemName_Ita"), forKey: "itemName_Ita")
        manageObj.setValue(item.value(forKey: "itemName_Span"), forKey: "itemName_Span")
        manageObj.setValue(item.value(forKey: "purpose_Buss"), forKey: "purpose_Buss")
        manageObj.setValue(item.value(forKey: "purpose_Leisure"), forKey: "purpose_Leisure")
        manageObj.setValue(item.value(forKey: "temperature_Heigh"), forKey: "temperature_Heigh")
        manageObj.setValue(item.value(forKey: "temperature_less"), forKey: "temperature_less")
        manageObj.setValue(item.value(forKey: "temperature_Medium"), forKey: "temperature_Medium")
        manageObj.setValue(item.value(forKey: "temprature"), forKey: "temprature")
        

            //save the object
            do {
                try context.save()
                print("saved!")
            } catch let error as NSError  {
                print("Could not save \(error), \(error.userInfo)")
            } catch {
                
            }
  
            
            
     //   }
        
        
        
        callback(true)
        
    }*/
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
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
