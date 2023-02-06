//
//  ToDoModel.swift
//  ToDoList-SwiftUI
//
//  Created by Students on 06.02.2023.
//

import Foundation

struct ToDo: Identifiable, Codable {
    var id = UUID().uuidString // change to var because of Codable
    var item = ""
    var remainderIsOn = false
    var dueDate = Date() + (60*60*24) // (60*60*24) = 1 day = 60 sec * 60 min * 24 hours
    var notes = ""
    var isCompleted = false
}
