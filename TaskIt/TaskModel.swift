//
//  TaskModel.swift
//  TaskIt
//
//  Created by David Grevink on 2014-12-06.
//  Copyright (c) 2014 David Grevink. All rights reserved.
//

import Foundation
import CoreData

@objc(TaskModel)
class TaskModel: NSManagedObject {

    @NSManaged var completed: NSNumber
    @NSManaged var date: NSDate
    @NSManaged var subtask: String
    @NSManaged var task: String

}
