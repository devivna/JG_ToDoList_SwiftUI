//
//  DetailView.swift
//  ToDoList-SwiftUI
//
//  Created by Students on 05.02.2023.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) private var dismiss
    var passedValue: String
    
    @State private var toDo = ""
    @State private var remainderIsOn = false
    @State private var dueDate = Date() + (60*60*24)
    // (60*60*24) = 1 day = 60 sec * 60 min * 24 hours
    
    @State private var notes = ""
    @State private var isCompleted = false
    
    var body: some View {
        
        NavigationStack {
            List {
                TextField("Enter To Do here", text: $toDo)
                    .font(.title)
                    .textFieldStyle(.roundedBorder)
                    .padding(.vertical)
                    .listRowSeparator(.hidden)
                
                Toggle("Set Reminder: ", isOn: $remainderIsOn)
                    .padding(.top)
                    .listRowSeparator(.hidden)
                DatePicker("Date", selection: $dueDate)
                    .listRowSeparator(.hidden)
                    .padding(.bottom)
                    .disabled(!remainderIsOn)
                
                Text("Notes:")
                    .padding(.top)
                
                TextField("Notes", text: $notes, axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                    .listRowSeparator(.hidden)
                
                Toggle("Completed:", isOn: $isCompleted)
                    .padding(.top)
                    .listRowSeparator(.hidden)
            }
            .listStyle(.grouped)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        //
                    }
                }
            }
            .navigationBarBackButtonHidden()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(passedValue: "Item 1")
    }
}
