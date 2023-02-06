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
    
    func saveToDo(toDo: ToDo, newToDo: Bool) {
        if newToDo {
            toDos.append(toDo)
        } else {
            if let index = toDos.firstIndex(where: {
                $0.id == toDo.id // toDos.id == changed toDo.id
            }) {
                toDos[index] = toDo // apply new values
            }
        }
    }
    
    func moveToDo(oldIndex: IndexSet, newIndex: Int) {
        toDos.move(fromOffsets: oldIndex, toOffset: newIndex)
    }
    
    func deleteToDo(index: IndexSet) {
        toDos.remove(atOffsets: index)
    }
}
