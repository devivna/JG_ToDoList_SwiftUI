//
//  ContentView.swift
//  ToDoList-SwiftUI
//
//  Created by Students on 05.02.2023.
//

import SwiftUI

struct ToDoListView: View {
    
    var toDos = [
        "Learn Swift", "Build Apps", "Change the World", "Do my best"]
    
    var body: some View {
        NavigationStack {
            VStack {
                List{
                    ForEach(toDos, id: \.self) { item in
                        NavigationLink(item) {
                            DetailView(passedValue: item)
                        }
                    }
                }
            }
            .navigationTitle("ToDo List")
            .navigationBarTitleDisplayMode(.large)
            .listStyle(.insetGrouped)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
    }
}

