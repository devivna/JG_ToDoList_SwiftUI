//
//  DetailView.swift
//  ToDoList-SwiftUI
//
//  Created by Students on 05.02.2023.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var toDoVM: ToDoViewModel
    @State var toDo: ToDo

    var body: some View {
        
        NavigationStack {
            List {
                TextField("Enter To Do here", text: $toDo.item)
                    .font(.title)
                    .textFieldStyle(.roundedBorder)
                    .padding(.vertical)
                    .listRowSeparator(.hidden)
                
                Toggle("Set Reminder: ", isOn: $toDo.remainderIsOn)
                    .padding(.top)
                    .listRowSeparator(.hidden)
                DatePicker("Date", selection: $toDo.dueDate)
                    .listRowSeparator(.hidden)
                    .padding(.bottom)
                    .disabled(!toDo.remainderIsOn)
                
                Text("Notes:")
                    .padding(.top)
                
                TextField("Notes", text: $toDo.notes, axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                    .listRowSeparator(.hidden)
                
                Toggle("Completed:", isOn: $toDo.isCompleted)
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
        NavigationStack {
            DetailView(toDo: ToDo())
                .environmentObject(ToDoViewModel())
        }
    }
}
