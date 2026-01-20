//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Kiran Shrestha on 1/19/26.
//

import SwiftUI
import SwiftData

struct ToDoListView: View {
    @Query var toDos : [ToDo]
    
    @State private var sheetIsPresented = false
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(toDos) { toDo in
                    HStack{
                        Image(systemName: toDo.isCompleted ? "checkmark.rectangle": "rectangle")
                            .onTapGesture {
                                toDo.isCompleted.toggle()
                                try? modelContext.save()
                            }
                        NavigationLink {
                            DetailView(toDo: toDo)
                        } label: {
                            Text(toDo.item)
                        }
                        .font(.title2)
                        .swipeActions {
                            Button("Delete", role: .destructive) {
                                modelContext.delete(toDo)
                                try? modelContext.save()
                            }
                        }
                    }
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
                    DetailView(toDo: ToDo())
                }
            }
        }
    }
}

#Preview {
    ToDoListView()
        .modelContainer(for: ToDo.self, inMemory: true)
}
