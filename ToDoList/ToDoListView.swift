//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Kiran Shrestha on 1/19/26.
//

import SwiftUI

struct ToDoListView: View {
    var toDos = [
        "Learn Swift",
        "Build Apps",
        "Change the World",
        "Bring the Awesome",
        "Take a Vacation"
    ]
    var body: some View {
        NavigationStack {
            List {
                ForEach(toDos, id: \.self) { toDo in
                    NavigationLink {
                        DetailView(passedValue: toDo)
                    } label: {
                        Text(toDo)
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("To Do List")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

#Preview {
    ToDoListView()
}
