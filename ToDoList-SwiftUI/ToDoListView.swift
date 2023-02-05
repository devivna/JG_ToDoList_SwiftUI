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
    
    @State private var sheetIsPresented = false

    var body: some View {
        NavigationStack {
            VStack {
                List{
                    ForEach(toDos, id: \.self) { item in
                        NavigationLink(item) {
                            DetailView(passedValue: item)
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
                DetailView(passedValue: "")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
    }
}

