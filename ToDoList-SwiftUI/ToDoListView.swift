//
//  ContentView.swift
//  ToDoList-SwiftUI
//
//  Created by Students on 05.02.2023.
//

import SwiftUI

struct ToDoListView: View {
    
    @EnvironmentObject var toDoVM: ToDoViewModel
    @State private var sheetIsPresented = false
    
    var body: some View {
        
        NavigationStack {
            VStack {
                List{
                    ForEach(toDoVM.toDos) { element in
                        NavigationLink(element.item) {
                            DetailView(toDo: element)
                        }
                        .font(.title3)
                    }
                }
            }
            .navigationTitle("ToDo List")
            .navigationBarTitleDisplayMode(.large)
            .listStyle(.insetGrouped)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        sheetIsPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            
            .fullScreenCover(isPresented: $sheetIsPresented) {
                //NavigationStack {
                    DetailView(toDo: ToDo())
                //}
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
            .environmentObject(ToDoViewModel())
    }
}

