//
//  LastRun+CoreDataProperties.swift
//  TipCalculator
//
//  Created by Sidharth Sharma on 7/29/17.
//  Copyright © 2017 Sidharth Sharma. All rights reserved.
//

import Foundation
import CoreData


extension LastRun {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LastRun> {
        return NSFetchRequest<LastRun>(entityName: "LastRun")
    }

    @NSManaged public var billAmount: String?

}
