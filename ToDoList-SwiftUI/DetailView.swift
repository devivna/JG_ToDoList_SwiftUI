//
//  DetailView.swift
//  ToDoList-SwiftUI
//
//  Created by Students on 05.02.2023.
//

import SwiftUI

struct DetailView: View {
    
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        VStack {
            Spacer()
            Text("Welcome to the new screen!")
            Spacer()
            Button("Back", action: { dismiss() })

        }
        .navigationBarBackButtonHidden()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
