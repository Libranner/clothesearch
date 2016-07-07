//
//  ClothingType+CoreDataProperties.swift
//  ClotheSearch
//
//  Created by Libranner Leonel Santos Espinal on 7/7/16.
//  Copyright © 2016 Libranner Leonel Santos Espinal. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension ClothingType {

    @NSManaged var clothingTypeId: NSNumber?
    @NSManaged var name: String?

}
