//
//  ToDoViewModel.swift
//  ToDoList-SwiftUI
//
//  Created by Students on 06.02.2023.
//

import Foundation

class ToDoViewModel: ObservableObject {
    @Published var toDos: [ToDo] = []
    
    init() {
        toDos.append(ToDo(item: "Item 1"))
        toDos.append(ToDo(item: "Item 2"))
        toDos.append(ToDo(item: "Item 3"))
    }
}
