//
//  ToDoListItem+CoreDataProperties.swift
//  todolist
//
//  Created by dan on 20.03.2023.
//
//

import Foundation
import CoreData


extension ToDoListItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDoListItem> {
        return NSFetchRequest<ToDoListItem>(entityName: "ToDoListItem")
    }

    @NSManaged public var name: String?
    @NSManaged public var created: Date?

}

extension ToDoListItem : Identifiable {

}
