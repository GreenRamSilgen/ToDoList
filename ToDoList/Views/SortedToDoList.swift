//
//  SortedToDoList.swift
//  ToDoList
//
//  Created by Kiran Shrestha on 1/21/26.
//

import SwiftUI
import SwiftData

struct SortedToDoList: View {
    let sortSelection : SortOption
    
    @Query var toDos : [ToDo]
    @Environment(\.modelContext) var modelContext
    
    init(sortSelection : SortOption) {
        self.sortSelection = sortSelection
        switch self.sortSelection {
        case .asEntered:
            _toDos = Query()
        case .alphabetical:
            _toDos = Query(sort: \.item)
        case .cronological:
            _toDos = Query(sort: \.dueDate, order: .forward)
        case .completed:
            _toDos = Query(filter: #Predicate { $0.isCompleted == false })
        }
    }
    var body: some View {
        List {
            ForEach(toDos) { toDo in
                VStack(alignment: .leading) {
                    HStack {
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
                    HStack {
                        Text(toDo.dueDate.formatted(date: .abbreviated, time: .shortened))
                            .foregroundStyle(.secondary)
                        if toDo.reminderIsOn {
                            Image(systemName: "calendar.badge.clock")
                                .symbolRenderingMode(.multicolor)
                        }
                    }
                }
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    SortedToDoList(sortSelection: .completed)
        .modelContainer(ToDo.preview)
}
