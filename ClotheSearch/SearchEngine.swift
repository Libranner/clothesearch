//
//  SearchEngine.swift
//  ClotheSearch
//
//  Created by Libranner Leonel Santos Espinal on 7/7/16.
//  Copyright © 2016 Libranner Leonel Santos Espinal. All rights reserved.
//

import UIKit
import CoreData




class SearchEngine: NSObject {
    
    func search(searchQuery: String) -> (brands: [String], clothingTypes: [String], searchQuery: String) {
        let brandsResult = searchOnBrands(searchQuery)
        let clothingTypeResult = searchOnClothingTypes(searchQuery)
        
        var criteria = searchQuery
        
        if(brandsResult.result.count > 0 || clothingTypeResult.result.count < 0){
            let wordsNotFound = brandsResult.notFound.intersect(clothingTypeResult.notFound)
            if(wordsNotFound.count > 0){
                criteria = wordsNotFound.joinWithSeparator(" ")
            }
        }
        
        return(brandsResult.result, clothingTypeResult.result, criteria)
    }
    
    
    private func searchOnBrands(criteria: String) -> (result: [String], notFound: Set<String>){
        let data = getDataFromDB("Brand", field: "name")
        return searcher(criteria, data: data)
    }
    
    private func searchOnClothingTypes(criteria: String) -> (result: [String], notFound: Set<String>){
        let data = getDataFromDB("ClothingType", field: "name")
        return searcher(criteria, data: data)
    }
    
    private func getDataFromDB(entity: String, field: String)-> [String]{
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: entity)
        
        do {
            let results =
                try managedContext.executeFetchRequest(fetchRequest)
            let data = results as! [NSManagedObject]
            
            return data.map{ $0.valueForKey(field) as! String }
            
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
            return []
        }
    }
    
    private func searcher(criteria: String, data: [String])-> (result: [String], notFound: Set<String>){
        let words = criteria.componentsSeparatedByString(" ")
        var results: [String] = []
        var notFound: [String] = []
        
        for word in words {
            let filtered = data.filter({ $0.lowercaseString == word.lowercaseString })
            if(filtered.count > 0){
                results += filtered
            }
            else{
                notFound.append(word)
            }
        }
        
        return (results, Set(notFound))
    }

}
