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
    
    @State private var sheetIsPresented = false
    var body: some View {
        NavigationStack {
            List {
                ForEach(toDos, id: \.self) { toDo in
                    NavigationLink {
                        DetailView(toDo: toDo)
                    } label: {
                        Text(toDo)
                    }
                    .font(.title2)
                }
            }
            .listStyle(.plain)
            .navigationTitle("To Do List")
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        sheetIsPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }

                }
            }
            .fullScreenCover(isPresented: $sheetIsPresented) {
                NavigationStack {
                    DetailView(toDo: "")
                }
            }
        }
    }
}

#Preview {
    ToDoListView()
}
