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
        loadData()
    }
    
    func toggleCompletion(toDo: ToDo) {
        
        // -- my
        //        if let index = toDos.firstIndex(where: { $0.id == toDo.id }) {
        //            toDos[index].isCompleted.toggle()
        //        }
        
        // -- Galaugher
        // guard toDo.id != nil else {return} // if in model id = String?
        
        var newToDo = toDo // we can't modify toDo
        newToDo.isCompleted.toggle()
        if let index = toDos.firstIndex(where: { $0.id == toDo.id }) {
            toDos[index] = newToDo
        }
        saveData()
        
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
        saveData()
    }
    
    func moveToDo(oldIndex: IndexSet, newIndex: Int) {
        toDos.move(fromOffsets: oldIndex, toOffset: newIndex)
        saveData()
    }
    
    func deleteToDo(index: IndexSet) {
        toDos.remove(atOffsets: index)
        saveData()
    }
    
    func loadData() {
        let path = URL.documentsDirectory.appending(component: "toDos")
        guard let data = try? Data(contentsOf: path) else {return}
        do {
            toDos = try JSONDecoder().decode(Array<ToDo>.self, from: data)
        } catch {
            print("Error: Could not load data \(error.localizedDescription)")
        }
    }
    
    func saveData() {
        let path = URL.documentsDirectory.appending(component: "toDos")
        let data = try? JSONEncoder().encode(toDos)
        do {
            try data?.write(to: path)
        } catch {
            print("Error: Could not save data \(error.localizedDescription)")
        }
    }
    
}
